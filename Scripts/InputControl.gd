#By Jon Chau
extends Node

#amount of input delay in frames
var input_delay = 1 
#number of frame states to save in order to implement rollback (max amount of frames able to rollback)
var rollback = 7

var frame_num = 0 #ranges between 0-255 per circular input array cycle (cycle is every 256 frames)
var frame_count = 0 #contador de frames

var input_array = [] #array to hold 256 Inputs
var state_queue = [] #queue for Frame_States of past frames (for rollback)

#Pruebas
var frame_ms_array = [] #Index es el numero de frame guardado, valor ping en ms 
#[NroPrueba][Frame] = valor de ms
var flag_ms_array = false #Si este cambia a true, se comenzara a guardar datos
var nro_prueba = 0
const MINUTO_FPS = 3600 #3600 frames a 60 fps es un minuto, para realizar pruebas y guardar valores de ping
const CANT_PRUEBAS = 10 # 1-> 50ms 2->100ms 30->150ms y asi
var frame_count_test = 0

var canReset = true #for testing state reset

#---classes---
class Inputs:
	#Indexing [0]: A, [1]: D, [2]: SPACE
	#inputs by local player for a single frame
	var local_input = [false, false, false]
	
	func duplicate():
		var duplicate = Inputs.new()
		duplicate.local_input = self.local_input.duplicate()
		return duplicate


class Frame_State:
	var inputs #the Inputs of this state's frame
	var frame #state's frame number according to 256 frame cycle number
	var game_state #holds the values needed for tracking a game's state at a given frame.

	func _init(_inputs : Inputs, _frame : int, _game_state : Dictionary):
		inputs = _inputs
		frame = _frame
		game_state = _game_state #Dictionary of dictionaries
		#game_state keys are child names, values are their individual state dictionaries
		#state dicts: Keys are state var names (e.g. x, y), values are the var values 

#---functions---
func _ready():
	#initialize input array
	for _x in range (0, 256):
		input_array.append(Inputs.new()) 
	
	#initialize state queue
	for _x in range (0, rollback):
		#empty input, frame 0, inital game state
		state_queue.append(Frame_State.new(Inputs.new(), 0, get_game_state()))
	
	for _x in range(0,CANT_PRUEBAS):
		var row = []
		for _y in range(0,MINUTO_FPS):
			var column = []
			row.append(column)
		frame_ms_array.append(row)


func _physics_process(_delta):
	handle_input() 
	#Seteo y modificacion por Frame del Contador de Frames y FPS
	var Frame_Counter_Label = get_parent().get_node("Frame_Counter_Label")
	var FPS = get_parent().get_node("FPS")
	Frame_Counter_Label.text = "Frame Counter: " + str(frame_count)
	FPS.text = "FPS: " + str(Engine.get_frames_per_second())
	#Recopilar datos de prueba
	if flag_ms_array == true:
		if frame_count_test < MINUTO_FPS:
			frame_ms_array[nro_prueba-1][frame_count_test] = 1 #el 1 es un holder, cambiar por valor de ms obtenido en conexion
			print("Se recopilo dato de Frame: "+ str(frame_count_test))
		else:
			print("Prueba Concluida")
			
		frame_count_test += 1

func handle_input(): #get inputs, call child functions
	var pre_game_state = get_game_state()
	
	frame_start_all()
	
	#record local inputs
	var local_input = [false, false, false]
	if Input.is_key_pressed(KEY_A):
		local_input[0] = true
	if Input.is_key_pressed(KEY_D):
		local_input[1] = true
	if Input.is_key_pressed(KEY_SPACE):
		local_input[2] = true
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
	

	input_array[(frame_num + input_delay) % 256].local_input = local_input
	frame_count += 1

	var current_input = input_array[frame_num].duplicate()
	
	#testing resetting of state
	if Input.is_key_pressed(KEY_ENTER):
# warning-ignore:standalone_expression
		canReset && reset_state_all(state_queue[0].game_state)
		canReset = false
	else:
		canReset = true
	
	input_update_all(current_input) #update children with current input
	frame_end_all()
	
	#store current frame state into queue
	state_queue.append(Frame_State.new(current_input, frame_num, pre_game_state))
	
	#remove oldest state from queue
	state_queue.pop_front()

	frame_num = (frame_num + 1)%256 #increment frame_num cycle


func frame_start_all():
	for child in get_children():
		child.frame_start()


func reset_state_all(game_state : Dictionary):
	for child in get_children():
		child.reset_state(game_state)


func input_update_all(input : Inputs):
	for child in get_children():
		child.input_update(input)


func frame_end_all():
	for child in get_children():
		child.frame_end()


func get_game_state():
	var state = {}
	for child in get_children():
		state[child.name] = child.get_state()
	return state.duplicate(true) #deep duplicate to copy all nested dictionaries by value

func GuardarDatos():
	var texto = ""
	for x in range (0,nro_prueba):
		texto = texto + "Prueba " + str(x+1) + "\n"
		for y in range(0, MINUTO_FPS):
			texto = texto + "Frame: "+ str(y+1)+ " Ping: "+ str(frame_ms_array[nro_prueba-1][y]) + "\n"
		texto = texto + "\n"
	var file = File.new()
	file.open("res://Test.txt", File.WRITE)
	file.store_string(texto)
	file.close()
