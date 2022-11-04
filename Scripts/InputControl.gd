#Basado en Proyecto de Jon Chau
extends Node

#amount of input delay in frames
var input_delay = 5 
#number of frame states to save in order to implement rollback (max amount of frames able to rollback)
var rollback = 7 
#frame range of duplicate past input packets to send every frame (should be less than rollback)
var dup_send_range = 5
#amount of input packets to send per frame
var packet_amount = 5

#tracks current game status
enum Game {WAITING, PLAYING, END}
var game = Game.WAITING
var status = "" #for additional status label info

var input_array = [] #array to hold 256 Inputs
var state_queue = [] #queue for Frame_States of past frames (for rollback)
var input_arrival_array = [] #256 boolean array, tracks if networked inputs for a given frame have arrived
var input_viable_request_array = [] #256 boolean array, tracks if local inputs for a given frame are viable to be sent by request
var input_array_mutex = Mutex.new()
var input_viable_request_array_mutex = Mutex.new()

var frame_num = 0 #ranges between 0-255 per circular input array cycle (cycle is every 256 frames)

var input_received #boolean to communicate between threads if new inputs have been received
var input_received_mutex = Mutex.new()

var input_thread = null #thread to receive inputs over the network

var UDPPeer = PacketPeerUDP.new()


#MIAS
#Pruebas
var frame_ms_array = [] #Index es el numero de frame guardado, valor ping en ms 
#[NroPrueba][Frame] = valor de ms
var flag_ms_array = false #Si este cambia a true, se comenzara a guardar datos
var nro_prueba = 0
const MINUTO_FPS = 3600 #3600 frames a 60 fps es un minuto, para realizar pruebas y guardar valores de ping
const CANT_PRUEBAS = 10 # 1-> 25ms 2->50ms 3->75ms y asi
var frame_count_test = 0
var frame_count = 0


#---classes---
class Inputs:
	#Indexing [0]: A, [1]: D,[2]: W, [3]: SPACE
	#inputs by local player for a single frame
	var local_input = [false, false, false, false]
	#Entradas del jugador a travez de la red
	var net_input = [false, false, false, false]
	var encoded_local_input = 0


class Frame_State:
	var local_input #inputs by local player for a single frame
	var net_input #inputs by a player over network for a single frame
	var frame #frame number according to 256 frame cycle number
	var game_state #dictionary holds the values need for tracking a game's state at a given frame. Keys are child names.
	var actual_input #boolean, whether the state contains guessed input (false) or actual input (true) from networked player

	func _init(_local_input : Array, _net_input : Array, _frame : int, _game_state : Dictionary, _actual_input : bool):
		self.local_input = _local_input #Array of booleans
		self.net_input = _net_input #Array of booleans
		self.frame = _frame
		self.game_state = _game_state #Dictionary of dictionaries
		#game_state keys are child names, values are their individual state dictionaries
		#states: Keys are state vars of the children (e.g. x, y), values are the var values 
		self.actual_input = _actual_input

#---functions---
func thr_network_inputs(_userdata): #thread function to read inputs from network
	var result = null
	while(true):
		result = UDPPeer.get_packet() #receive a single packet
		if result:
			match result[0]: #switch statement for header byte
				0: #input received
					if result.size() == 3: #check for complete packet (no bytes lost)
						input_array_mutex.lock()
						if input_arrival_array[result[1]] == false: #if a non-duplicate input arrives for a frame
							input_array[result[1]].net_input = [
									bool(result[2] & 1),
									bool(result[2] & 2),
									bool(result[2] & 4),
									bool(result[2] & 8),
									bool(result[2] & 16)]
							input_arrival_array[result[1]] = true
							input_received_mutex.lock()
							input_received = true
							if game == Game.WAITING:
								game = Game.PLAYING
							input_received_mutex.unlock()
						input_array_mutex.unlock()
				
				1: #request for input received
					if result.size() == 3: #check for complete packet (no bytes lost)
						var frame = result[1]
						input_viable_request_array_mutex.lock()
						while (frame != result[2]): #send inputs for requested frame and newer past frames
							if input_viable_request_array[frame] == false: 
								break #do not send invalid inputs from future frames
							for _x in range(packet_amount):
								UDPPeer.put_packet(PoolByteArray([0, frame, input_array[frame].encoded_local_input]))
							frame = (frame + 1)%256
						input_viable_request_array_mutex.unlock()
				
				2: #game start
					if result.size() == 2: #check for complete packet (no bytes lost)
						if game == Game.WAITING:
							input_received_mutex.lock()
							input_received = true
							game = Game.PLAYING
							input_received_mutex.unlock()
						elif (result[1] == 0):
							#input_received_mutex.unlock()
							for _x in range(packet_amount):
								UDPPeer.put_packet(PoolByteArray([2, 1])) #send ready handshake to opponent
				
				3: #game end
					if game == Game.PLAYING:
						input_received_mutex.lock()
						game = Game.END
						input_received_mutex.unlock()
		else:
			UDPPeer.wait()

func _ready():
	#initialize arrays
	for _x in range (0, 256):
		input_array.append(Inputs.new())
		input_arrival_array.append(false)
		input_viable_request_array.append(false)
	
	#initialize state queue
	for _x in range (0, rollback):
		#empty local input, empty net input, frame 0, inital game state, treat initial empty inputs as true
		state_queue.append(Frame_State.new([], [], 0, get_game_state(), true))
	
	for i in range (1, rollback + 100):
		input_arrival_array[-i] = true # for initialization, pretend all "previous" inputs arrived
		
	for i in range (0, input_delay):
		input_arrival_array[i] = true # assume empty inputs at game start input_delay window
		input_viable_request_array[i] = true
		
	for _x in range(0,CANT_PRUEBAS):
		var row = []
		for _y in range(0,MINUTO_FPS):
			var column = []
			row.append(column)
		frame_ms_array.append(row)
	
	input_received = false #network thread will set to true when a networked player is found.
	
	#set up networking thread
	UDPPeer.listen(7700, "*")
	UDPPeer.set_dest_address("::1", 7701) #::1 is localhost
	input_thread = Thread.new()
	input_thread.start(self, "thr_network_inputs", null, 2)


func _physics_process(_delta):
	input_received_mutex.lock()
	if (input_received):
		#if the net input for the current frame has not arrived, then DELAY
		if input_arrival_array[frame_num] == false:
			input_received = false #wait until actual net input is received
			input_received_mutex.unlock()
			for _x in range(packet_amount):
				UDPPeer.put_packet(PoolByteArray([1, state_queue[0].frame, (frame_num + 1)%256])) #send request for needed input
			status = "DELAY: Waiting for net input. frame_num: " + str(frame_num)
			frame_count_test += 1
		else:
			input_received_mutex.unlock()
			status = ""
			#Recopilar datos de prueba
			if flag_ms_array == true:
				if frame_count_test < MINUTO_FPS:
					frame_ms_array[nro_prueba-1][frame_count_test] = 25*nro_prueba #el 1 es un holder, cambiar por valor de ms obtenido en conexion
					print("Se recopilo dato de Frame: "+ str(frame_count_test))
				else:
					print("Prueba Concluida")
					
				frame_count_test += 1
			handle_input()
	#else:
	#	input_received_mutex.unlock()
	#	if (game == Game.WAITING): #search for networked player
	#		UDPPeer.put_packet(PoolByteArray([2, 0])) #send ready handshake to opponent
	#	else:#send request for needed inputs for past frames
	#		UDPPeer.put_packet(PoolByteArray([1, state_queue[0].frame, (frame_num + 1)%256])) #send request for needed input
	elif (game == Game.PLAYING):#send request for needed inputs for past frames
		input_received_mutex.unlock()
		for _x in range(packet_amount):
			UDPPeer.put_packet(PoolByteArray([1, frame_num, (frame_num + input_delay)%256])) #send request for needed input
	elif (game == Game.WAITING): #search for networked game instance
		input_received_mutex.unlock()
		UDPPeer.put_packet(PoolByteArray([2, 0])) #send ready handshake to networked player
	else:
		input_received_mutex.unlock()
	
	#Seteo y modificacion por Frame del Contador de Frames y FPS
	var Frame_Counter_Label = get_parent().get_node("Frame_Counter_Label")
	var FPS = get_parent().get_node("FPS")
	Frame_Counter_Label.text = "Frame Counter: " + str(frame_count)
	FPS.text = "FPS: " + str(Engine.get_frames_per_second())
	

func handle_input(): #get inputs, call child functions
	var pre_game_state = get_game_state()
	var actual_input = true
	
	var current_input = null

	var local_input = [false, false, false, false]
	var encoded_local_input = 0
	frame_start_all()
	
	#record local inputs
	if Input.is_key_pressed(KEY_A): #Posible error en encoded_local_input
		local_input[0] = true
		encoded_local_input += 2
	if Input.is_key_pressed(KEY_D):
		local_input[1] = true
		encoded_local_input += 8
	if Input.is_key_pressed(KEY_W):
		local_input[2] = true
		encoded_local_input += 1
	if Input.is_key_pressed(KEY_SPACE):
		local_input[3] = true
		encoded_local_input += 16
	if Input.is_key_pressed(KEY_ESCAPE):
		game = Game.END
		UDPPeer.put_packet(PoolByteArray([3])) #send game end signal to peer
	if Input.is_action_just_pressed("test_inicio"):
		nro_prueba += 1
		print("Prueba Nro: "+ str(nro_prueba))
		flag_ms_array = true
	if Input.is_action_just_pressed("test_fin"):
		print("Fin de la prueba Nro: "+ str(nro_prueba))
		frame_count_test = 0
		flag_ms_array = false
	if Input.is_action_just_pressed("GuardarDatos"):
		GuardarDatos()
	
	input_array_mutex.lock()
	
	input_array[(frame_num + input_delay) % 256].local_input = local_input
	input_array[(frame_num + input_delay) % 256].encoded_local_input = encoded_local_input
	frame_count += 1
	
	#send inputs over network
	for i in dup_send_range + 1: #send inputs for current frame as well as duplicates of past frame inputs
		for _x in packet_amount: #Posiblemente distinto
			UDPPeer.put_packet(PoolByteArray([0, (frame_num + input_delay - i) % 256,
					input_array[(frame_num + input_delay - i) % 256].encoded_local_input]))
	
	input_array_mutex.unlock()
	
	#the input from the current frame can now be sent by request
	input_viable_request_array_mutex.lock()
	input_viable_request_array[(frame_num + input_delay) % 256] = true
	input_viable_request_array_mutex.unlock()
	
	current_input = Inputs.new()
	input_array_mutex.lock()
	
	current_input.local_input = input_array[frame_num].local_input.duplicate()
	current_input.net_input = input_array[frame_num].net_input.duplicate()
	input_arrival_array[frame_num - (256 - (input_delay*2 + rollback + 1))] = false #reset input arrival boolean for old frame
	input_array_mutex.unlock()
	
	input_viable_request_array_mutex.lock()
	input_viable_request_array[frame_num - (rollback*2 + input_delay + 1)] = false #old input is not viable for requests
	input_viable_request_array_mutex.unlock()
	
	input_update_all(current_input, pre_game_state) #update with current input
	execute_all() #implement all applied updates/inputs to all child objects
	
	#store current frame state into queue
	state_queue.append(Frame_State.new(current_input.local_input, current_input.net_input, frame_num, pre_game_state, actual_input))
	
	#remove oldest state from queue
	state_queue.pop_front()
	
	frame_num = (frame_num + 1)%256 #increment frame_num

func frame_start_all():
	for child in get_children():
		child.frame_start()


func reset_state_all(game_state : Dictionary):
	for child in get_children():
		child.reset_state(game_state)


func input_update_all(input : Inputs, game_state : Dictionary):
	for child in get_children():
		child.input_update(input, game_state)


func execute_all():
	for child in get_children():
		child.execute()


func get_game_state():
	var state = {}
	for child in get_children():
		state[child.name] = child.get_state()
	return state.duplicate(true) #deep duplicate to copy all nested dictionaries by value instead of by reference

func GuardarDatos():
	var texto = ""
	for x in range (0,nro_prueba):
		texto = texto + "Prueba " + str(x+1) + "\n"
		for y in range(0, MINUTO_FPS):
			texto = texto + "Frame: "+ str(y+1)+ " Ping: "+ str(frame_ms_array[x][y]) + "\n"
		texto = texto + "\n"
	var file = File.new()
	file.open("res://Test.txt", File.WRITE)
	file.store_string(texto)
	file.close()
