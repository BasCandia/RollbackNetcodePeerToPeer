GDPC                                                                               @   res://.import/FondoC.png-f7f67968d42ffc7c7a56150789c211cc.stex  @`      �      +�od�P��r���sY�<   res://.import/TEST.png-fe3f75d1f9280a32f5d1196400c3b2ed.stex�p      F      T$K�6�y[�:��r�@   res://.import/TEST2.png-64c092c6b54f2671e6116279b7c768f4.stex   �u      �      �ir��<{�],uε�o@   res://.import/fondoA.png-9dd9472ccb4b5fad6972e461331aa66f.stex   {      �       ��̇�ô�ěgK7@   res://.import/fondoB.png-9cfda74e2071ddf83442690331b11ac2.stex  �~      @      i�q��w��Bk��멻<   res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex��      �      &�y���ڞu;>��.p<   res://.import/wall.png-9b0e8f0ce8f6ab21260c2b1286395d20.stex��      �       ���:Z{�g�a�   res://Scenes/Background.tscn 	      �      iy�����*�<��   res://Scenes/NetPlayer.tscn �      �      �jώ)��MG%򚗰�$   res://Scenes/Player2DCollisions.tscn�      �      �@I�&�U]`e���$   res://Scenes/Stage2DCollisions.tscn �      �      �5�D[�g[qy��ҋ �(   res://Scenes/Stage2DCollisionsCOPY.tscn P      5      <�Auu�-�ρ�m�$   res://Scenes/Wall2DCollisions.tscn  �$      �      �~�s9��L����ɣs$   res://Scripts/InputControl.gd.remap �      /       �y�"ׯ��O�^]��    res://Scripts/InputControl.gdc  p&      �&      $'��Z��U����IA�$   res://Scripts/LocalPlayer.gd.remap  @�      .       k���!Q2�;�PZ`    res://Scripts/LocalPlayer.gdc   M      �
      �{�s�D���+Dݹ�%�    res://Scripts/NetPlayer.gd.remapp�      ,       �v�!I<���S�8dH   res://Scripts/NetPlayer.gdc �W      O      +��Yj�� 8}���$   res://Scripts/StatusCheck.gd.remap  ��      .       .�b%���-{}0i�    res://Scripts/StatusCheck.gdc   @]      �      A�y��@�@X���^w~    res://Sprites/FondoC.png.import n      �      Kσ=P�������vU    res://Sprites/TEST.png.import   s      �      ��S�f���d�    res://Sprites/TEST2.png.import  px      �      J
�"���ț�Y6�    res://Sprites/fondoA.png.import �{      �      �7ژ���<�M-�O    res://Sprites/fondoB.png.import Ѐ      �      x=l�>���!¤Ah}9�    res://Sprites/wall.png.import    �      �      _0�j\m�����Ɔ#   res://default_env.tres  ��      �      �Y^%-�,^�͍6�   res://icon.png.import   `�      �      ��fe��6�B��^ U�   res://project.binaryБ             �O��67�e���ݞ\h    [gd_scene load_steps=4 format=2]

[ext_resource path="res://Sprites/fondoA.png" type="Texture" id=1]
[ext_resource path="res://Sprites/fondoB.png" type="Texture" id=2]
[ext_resource path="res://Sprites/FondoC.png" type="Texture" id=3]

[node name="Node2D" type="Node2D"]

[node name="FondoA" type="Sprite" parent="."]
visible = false
position = Vector2( 512, 301 )
scale = Vector2( 4, 4.18056 )
texture = ExtResource( 1 )

[node name="FondoB" type="Sprite" parent="."]
visible = false
position = Vector2( 512, 419 )
scale = Vector2( 4, 3.11806 )
texture = ExtResource( 2 )

[node name="FondoC" type="Sprite" parent="."]
position = Vector2( 500, 300 )
scale = Vector2( 1.1, 0.8 )
texture = ExtResource( 3 )
              [gd_scene load_steps=3 format=2]

[ext_resource path="res://Sprites/TEST2.png" type="Texture" id=1]

[sub_resource type="RectangleShape2D" id=1]
extents = Vector2( 40, 60 )

[node name="NetPlayer" type="KinematicBody2D"]

[node name="Test2" type="Sprite" parent="."]
position = Vector2( 0, -7 )
texture = ExtResource( 1 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="."]
position = Vector2( 0, 12 )
shape = SubResource( 1 )

[node name="Label" type="Label" parent="."]
margin_right = 40.0
margin_bottom = 36.0
custom_colors/font_color = Color( 0, 0, 0, 1 )

[node name="RayCastFloor" type="RayCast2D" parent="."]
position = Vector2( 0, 72 )
enabled = true
cast_to = Vector2( 0, 8 )
collision_mask = 3
 [gd_scene load_steps=3 format=2]

[ext_resource path="res://Sprites/TEST.png" type="Texture" id=1]

[sub_resource type="RectangleShape2D" id=1]
extents = Vector2( 40, 60.1875 )

[node name="KinematicBody2D" type="KinematicBody2D"]
collision_mask = 2

[node name="Test" type="Sprite" parent="."]
position = Vector2( 0, -7 )
texture = ExtResource( 1 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="."]
position = Vector2( 0, 12 )
shape = SubResource( 1 )

[node name="Label" type="Label" parent="."]
margin_right = 40.0
margin_bottom = 36.0
custom_colors/font_color = Color( 0, 0, 0, 1 )

[node name="RayCastFloor" type="RayCast2D" parent="."]
position = Vector2( 0, 72 )
enabled = true
cast_to = Vector2( 0, 8 )
collision_mask = 3
     [gd_scene load_steps=11 format=2]

[ext_resource path="res://Scripts/InputControl.gd" type="Script" id=1]
[ext_resource path="res://Scenes/Player2DCollisions.tscn" type="PackedScene" id=2]
[ext_resource path="res://Scripts/LocalPlayer.gd" type="Script" id=3]
[ext_resource path="res://Scenes/Background.tscn" type="PackedScene" id=4]
[ext_resource path="res://Scenes/Wall2DCollisions.tscn" type="PackedScene" id=5]
[ext_resource path="res://Sprites/wall.png" type="Texture" id=6]
[ext_resource path="res://Scenes/NetPlayer.tscn" type="PackedScene" id=7]
[ext_resource path="res://Scripts/NetPlayer.gd" type="Script" id=8]
[ext_resource path="res://Scripts/StatusCheck.gd" type="Script" id=9]

[sub_resource type="TileSet" id=1]
0/name = "wall.png 0"
0/texture = ExtResource( 6 )
0/tex_offset = Vector2( 0, 0 )
0/modulate = Color( 1, 1, 1, 1 )
0/region = Rect2( 0, 0, 64, 64 )
0/tile_mode = 0
0/occluder_offset = Vector2( 0, 0 )
0/navigation_offset = Vector2( 0, 0 )
0/shape_offset = Vector2( 0, 0 )
0/shape_transform = Transform2D( 1, 0, 0, 1, 0, 0 )
0/shape_one_way = false
0/shape_one_way_margin = 0.0
0/shapes = [  ]
0/z_index = 0

[node name="Node2D" type="Node2D"]
script = ExtResource( 9 )

[node name="InputControl" type="Node" parent="."]
script = ExtResource( 1 )

[node name="LocalPlayer" parent="InputControl" instance=ExtResource( 2 )]
position = Vector2( 212, 440 )
script = ExtResource( 3 )

[node name="NetPlayer" parent="InputControl" instance=ExtResource( 7 )]
position = Vector2( 812, 440 )
collision_mask = 3
script = ExtResource( 8 )

[node name="StaticBody2D" parent="." instance=ExtResource( 5 )]
visible = false
position = Vector2( 513, 30 )
scale = Vector2( 50, 1 )

[node name="StaticBody2D2" parent="." instance=ExtResource( 5 )]
visible = false
position = Vector2( 520, 557 )
scale = Vector2( 50, 1.5 )
collision_mask = 2

[node name="StaticBody2D3" parent="." instance=ExtResource( 5 )]
visible = false
position = Vector2( 1024, 300 )
scale = Vector2( 4, 10 )

[node name="StaticBody2D4" parent="." instance=ExtResource( 5 )]
visible = false
position = Vector2( 0, 300 )
scale = Vector2( 4, 10 )

[node name="Background" parent="." instance=ExtResource( 4 )]
light_mask = 2
z_index = -1

[node name="TileMap" type="TileMap" parent="."]
visible = false
tile_set = SubResource( 1 )
cell_custom_transform = Transform2D( 32, 0, 0, 32, 0, 0 )
format = 1
tile_data = PoolIntArray( 524288, 0, 0, 524289, 0, 0, 524290, 0, 0, 524291, 0, 0, 524292, 0, 0, 524293, 0, 0, 524294, 0, 0, 524295, 0, 0, 524296, 0, 0, 524297, 0, 0, 524298, 0, 0, 524299, 0, 0, 524300, 0, 0, 524301, 0, 0, 524302, 0, 0, 524303, 0, 0, 589824, 0, 0, 589825, 0, 0, 589826, 0, 0, 589827, 0, 0, 589828, 0, 0, 589829, 0, 0, 589830, 0, 0, 589831, 0, 0, 589832, 0, 0, 589833, 0, 0, 589834, 0, 0, 589835, 0, 0, 589836, 0, 0, 589837, 0, 0, 589838, 0, 0, 589839, 0, 0 )

[node name="Frame_Counter_Label" type="Label" parent="."]
margin_right = 40.0
margin_bottom = 14.0

[node name="FPS" type="Label" parent="."]
margin_top = 16.0
margin_right = 40.0
margin_bottom = 30.0

[node name="StatusLabel" type="Label" parent="."]
margin_left = 415.0
margin_top = 13.0
margin_right = 651.0
margin_bottom = 27.0
text = "WAITING FOR PEER TO CONNECT"
align = 1
[gd_scene load_steps=7 format=2]

[ext_resource path="res://Scripts/InputControl.gd" type="Script" id=1]
[ext_resource path="res://Scenes/Player2DCollisions.tscn" type="PackedScene" id=2]
[ext_resource path="res://Scripts/LocalPlayer.gd" type="Script" id=3]
[ext_resource path="res://Scripts/NetPlayer.gd" type="Script" id=4]
[ext_resource path="res://Scenes/Wall2DCollisions.tscn" type="PackedScene" id=5]
[ext_resource path="res://Scripts/StatusCheck.gd" type="Script" id=6]

[node name="Node2D" type="Node2D"]
script = ExtResource( 6 )

[node name="InputControl" type="Node" parent="."]
script = ExtResource( 1 )

[node name="LocalPlayer" parent="InputControl" instance=ExtResource( 2 )]
position = Vector2( 512, 490 )
script = ExtResource( 3 )

[node name="NetPlayer" parent="InputControl" instance=ExtResource( 2 )]
position = Vector2( 512, 110 )
script = ExtResource( 4 )

[node name="StaticBody2D" parent="." instance=ExtResource( 5 )]
position = Vector2( 513, 30 )
scale = Vector2( 50, 1 )

[node name="StaticBody2D2" parent="." instance=ExtResource( 5 )]
position = Vector2( 512, 570 )
scale = Vector2( 50, 1 )

[node name="StaticBody2D3" parent="." instance=ExtResource( 5 )]
position = Vector2( 984, 300 )
scale = Vector2( 4, 10 )

[node name="StaticBody2D4" parent="." instance=ExtResource( 5 )]
position = Vector2( 40, 300 )
scale = Vector2( 4, 10 )

[node name="StatusLabel" type="Label" parent="."]
margin_left = 357.0
margin_top = 559.0
margin_right = 668.0
margin_bottom = 587.0
text = "WAITING FOR CONNECTION TO PEER"
align = 1
__meta__ = {
"_edit_use_anchors_": false
}
           [gd_scene load_steps=2 format=2]

[sub_resource type="RectangleShape2D" id=1]
extents = Vector2( 10, 30 )

[node name="StaticBody2D" type="StaticBody2D"]
collision_layer = 2
collision_mask = 0

[node name="Polygon2D" type="Polygon2D" parent="."]
color = Color( 0.176471, 0.239216, 0.756863, 1 )
polygon = PoolVector2Array( -10, -30, 10, -30, 10, 30, -10, 30, -10, -0.740692 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="."]
shape = SubResource( 1 )
            GDSC   q   (   I  �     ���Ӷ���   ����������϶   �������ݶ���   �������������Ӷ�   ������������¶��   ���Ӷ���   �������   �������   ���   ���Ӷ���   �����Ŷ�   ����������϶   ����������Ӷ   ������������������϶   �������������������������϶�   ����������������ζ��   ����ζ��   ����$   �������������������������������ζ���   ��������۶��   �������������Ҷ�   �������������������ζ���   �����������Ҷ���   ������Ķ   ������������涶�   �������������϶�   ������������϶��   ���������׶�   ���������嶶   �����������嶶��   ���������������¶���   ����������¶   �����Ŷ�   ����������¶   ��������¶��   ������������������¶   ����������Ӷ   ����Ӷ��   ���������Ӷ�   �����������¶���   ����¶��   �����������¶���   ���������¶�   �����Ӷ�   ����������Ӷ   ������������¶��   �����������������Ŷ�   ��������׶��   �����¶�   ���������¶�   ���Ӷ���   ���ݶ���   �����ݶ�   �ζ�   ���������¶�   ���¶���   �����϶�   �����Ҷ�   �������������Ӷ�   ߶��   ����   �϶�   �����ض�   �����ض�   ���������������Ŷ���   �����Ҷ�   ����¶��   ���������������Ŷ���   �����׶�   �����������¶���   ������������������ڶ   ���������¶�   �������Ӷ���   ���   ���¶���   �����Ӷ�   ��������������������Ҷ��   �������������Ӷ�   ������������¶��   ��������������ڶ   ����¶��   �������������Ҷ�   ��������   ����򶶶   ����ᶶ�   ��������󶶶   ����������   ���������������������Ҷ�   �����������Ŷ���   ��������Ӷ��   ���������������ڶ���   ����������ڶ   ��������¶��   ����Ҷ��   �����������ض���   ����������¶   ��������������ڶ   ����������Ӷ   ����¶��   �����������Ӷ���   ������Ӷ   ����Ӷ��   ���Ӷ���   ��������Ӷ��   ����ٶ��   ζ��   ϶��   ���Ӷ���   ���Ӷ���   ���ض���   ����󶶶   �����������Ѷ���   ����Ӷ��                                             
                                                      d              *         192.168.1.101              thr_network_inputs     )   DELAY: Waiting for net input. frame_num:                Se recopilo dato de Frame:        Prueba Concluida      Frame_Counter_Label       FPS       Frame Counter:        FPS:          test_inicio       Prueba Nro:       test_fin      Fin de la prueba Nro:         GuardarDatos      Prueba        
         Frame:         Ping:        res://Test.txt                           
                     	      
                           (      /      4      5      ;      A      G      M      V      _      `      e      f      i      r      s      x      y       �   !   �   "   �   #   �   $   �   %   �   &   �   '   �   (   �   )   �   *   �   +   �   ,   �   -   �   .   �   /   �   0   �   1   �   2   �   3   �   4   �   5   �   6   �   7   �   8   �   9   �   :   �   ;   �   <   �   =   �   >   �   ?   �   @     A   	  B     C     D     E     F     G   #  H   $  I   %  J   ,  K   1  L   7  M   ?  N   C  O   J  P   M  Q   W  R   ]  S   i  T   u  U   �  V   �  W   �  X   �  Y   �  Z   �  [   �  \   �  ]   �  ^   �  _   �  `   �  a   �  b   �  c   �  d   �  e   �  f     g   
  h     i     j   *  k   4  l   :  m   ;  n   >  o   H  p   P  q   V  r   Z  s   `  t   f  u   q  v   r  w   {  x   �  y   �  z   �  {   �  |   �  }   �  ~   �     �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �     �     �     �     �     �   $  �   +  �   2  �   3  �   >  �   D  �   O  �   U  �   \  �   c  �   d  �   h  �   i  �   j  �   s  �   |  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �     �     �     �      �   %  �   &  �   *  �   .  �   /  �   0  �   1  �   2  �   3  �   4  �   >  �   D  �   M  �   c  �   m  �   s  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �     �     �     �     �   &  �   -  �   1  �   :  �   A  �   E  �   N  �   U  �   Y  �   b  �   h  �   t  �   }  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �     �    �    �    �                      	     
  &    3    9    :    B    H    I    X    g    |    �    �    �    �    �    �    �    �    �    �    �    �     �  !  �  "  �  #  �  $  �  %  �  &  �  '  �  (  �  )  �  *  �  +    ,    -  	  .  
  /    0    1  (  2  )  3  *  4  0  5  8  6  >  7  ?  8  @  9  F  :  L  ;  T  <  a  =  i  >  j  ?  p  @  u  A  �  B  �  C  �  D  �  E  �  F  �  G  �  H  �  I  �  J  Y3YYY;�  YY;�  �  YY;�  YY;�  YYY>�  N�  R�  R�  OY;�	  �  T�  Y;�
  �  YY;�  LMY;�  LMY;�  LMY;�  LMY;�  �  T�  PQY;�  �  T�  PQYY;�  �  YY;�  Y;�  �  T�  PQYY;�  �  YY;�  �  T�  PQYYYYY;�  LMYY;�  �  Y;�  �  Y:�  �  Y:�  �  Y;�  �  Y;�  �  YYYY1�   V�  �  �  ;�!  L�  R�  R�  R�  M�  �  ;�"  L�  R�  R�  R�  M�  ;�#  �  YYY1�$  V�  ;�!  �  ;�"  �  ;�%  �  ;�&  �  ;�'  Y�  0�(  P�)  V�  R�*  V�  R�+  V�  R�,  V�  R�-  V�  QV�  T�!  �)  �  T�"  �*  �  T�%  �+  �  T�&  �,  �  �  �  T�'  �-  YYY0�.  P�/  QV�  ;�0  �  �  *P�  QV�  �0  �  T�1  PQ�  &�0  V�  /�0  L�  MV�  �  V�  &�0  T�2  PQ�	  V�  �  T�3  PQ�  &�  L�0  L�
  MM�  V�  �  L�0  L�
  MMT�"  L�	  �  P�0  L�  M"�
  QR�	  �  P�0  L�  M"�  QR�	  �  P�0  L�  M"�  QR�	  �  P�0  L�  M"�  QR�	  �  P�0  L�  M"�  QM�  �  L�0  L�
  MM�  �  �  T�3  PQ�  �  �  �  &�	  �  T�  V�  �	  �  T�  �  �  T�4  PQ�  �  T�4  PQ�  �  �
  V�  &�0  T�2  PQ�	  V�  ;�%  �0  L�
  M�  �  T�3  PQ�  *P�%  �0  L�  MQV�  &�  L�%  M�  V�  +�  )�5  �K  P�  QV�  �  T�6  P�  PL�  R�%  R�  L�%  MT�#  MQQ�  �%  P�%  �
  Q�  �  �  T�4  PQ�  �  �  V�  &�0  T�2  PQ�  V�  &�	  �  T�  V�  �  T�3  PQ�  �  �  �  �	  �  T�  �  �  T�4  PQ�  'P�0  L�
  M�  QV�  �  )�5  �K  P�  QV�  �  T�6  P�  PL�  R�
  MQQ�  �  �	  V�  &�	  �  T�  V�  �  T�3  PQ�  �	  �  T�  �  �  T�4  PQ�  (V�  �  T�7  PQYY0�8  PQV�  �  )�5  �K  P�  R�  QV�  �  T�9  P�   T�  PQQ�  �  T�9  P�  Q�  �  T�9  P�  Q�  �  �  )�5  �K  P�  R�  QV�  �  �  T�9  P�$  T�  PLMRLMR�  R�:  PQR�  QQ�  �  )�;  �K  P�
  R�  �  QV�  �  L�;  M�  �  �  )�;  �K  P�  R�  QV�  �  L�;  M�  �  �  L�;  M�  �  �  )�5  �K  P�  R�  QV�  ;�<  LM�  )�=  �K  P�  R�  QV�  ;�>  LM�  �<  T�9  P�>  Q�  �  T�9  P�<  Q�  �  �  �  �  �  �  �  T�?  P�  R�  Q�  �  T�@  P�  R�  Q�  �  �A  T�  PQ�  �  T�B  PR�  R�  R�  QYYY0�C  P�D  QV�  �  T�3  PQ�  &P�  QV�  �  &�  L�  M�  V�  �  �  �  �  T�4  PQ�  )�5  �K  P�  QV�  �  T�6  P�  PL�
  R�  L�  MT�%  RP�  �
  Q�  MQQ�  �
  �  �>  P�  Q�  �  �
  �  (V�  �  T�4  PQ�  �
  �  �  �  &�  �  V�  &�  	�  V�  �  L�  �
  ML�  M�  �  �  �?  P�  �>  P�  QQ�  (V�  �?  P�  Q�  �  �  �
  �  �E  PQ�  �  �  �  �  �  �  'P�	  �  T�  QV�  �  T�4  PQ�  )�5  �K  P�  QV�  �  T�6  P�  PL�
  R�  RP�  �  Q�  MQQ�  'P�	  �  T�  QV�  �  T�4  PQ�  �  T�6  P�  PL�  R�  MQQ�  (V�  �  T�4  PQ�  �  �  ;�F  �G  PQT�H  P�  Q�  ;�I  �G  PQT�H  P�  Q�  �F  T�J  �  �>  P�  Q�  �I  T�J  �  �>  P�K  T�L  PQQ�  YY0�E  PQV�  ;�M  �:  PQ�  ;�'  �  �  �  ;�N  �  Y�  ;�!  L�  R�  R�  R�  M�  ;�#  �  �  �O  PQ�  �  �  &�P  T�Q  P�R  QV�  &P�P  T�Q  P�S  QQV�  �!  L�  M�  �  �#  �  �  &�P  T�Q  P�S  QV�  &P�P  T�Q  P�R  QQV�  �!  L�
  M�  �  �#  �  �  &�P  T�Q  P�T  QV�  �!  L�  M�  �  �#  �
  �  &�P  T�Q  P�U  QV�  �!  L�	  M�  �  �#  �  �  &�P  T�Q  P�V  QV�  �	  �  T�  �  �  T�6  P�  PL�	  MQQ�  &�P  T�W  P�  QV�  �  �
  �  �?  P�  �>  P�  QQ�  �  �  �  &�P  T�W  P�   QV�  �?  P�!  �>  P�  QQ�  �  �  �  �  �  �  &�P  T�W  P�"  QV�  �X  PQ�  �  �  T�3  PQ�  �  �  LP�  �  Q�  MT�!  �!  �  �  LP�  �  Q�  MT�#  �#  �  �  �
  �  �  �  )�;  �  �
  V�  )�5  �  V�  �  T�6  P�  PL�  RP�  �  �;  Q�  R�  �  LP�  �  �;  Q�  MT�#  MQQ�  �  �  T�4  PQ�  �  �  �  T�3  PQ�  �  LP�  �  Q�  M�  �  �  T�4  PQ�  �  �N  �   T�  PQ�  �  T�3  PQ�  �  �N  T�!  �  L�  MT�!  T�Y  PQ�  �N  T�"  �  L�  MT�"  T�Y  PQ�  �  L�  P�  P�  �  �  �
  QQM�  �  �  T�4  PQ�  �  �  T�3  PQ�  �  L�  P�  �  �  �
  QM�  �  �  T�4  PQ�  �  �Z  P�N  R�M  Q�  �[  PQ�  �  �  �  T�9  P�$  T�  P�N  T�!  R�N  T�"  R�  R�M  R�'  QQ�  �  �  �  T�\  PQ�  �  �  P�  �
  Q�  YY0�O  PQV�  )�]  �^  PQV�  �]  T�_  PQYYY0�`  P�&  V�  QV�  )�]  �^  PQV�  �]  T�a  P�&  QYYY0�Z  P�b  V�   R�&  V�  QV�  )�]  �^  PQV�  �]  T�c  P�b  R�&  QYYY0�[  PQV�  )�]  �^  PQV�  �]  T�d  PQYYY0�:  PQV�  ;�e  NO�  )�]  �^  PQV�  �e  L�]  T�f  M�]  T�g  PQ�  .�e  T�Y  P�  QYY0�X  PQV�  ;�h  �  �  )�i  �K  P�  R�  QV�  �h  �h  �#  �>  P�i  �
  Q�$  �  )�j  �K  P�  R�  QV�  �h  �h  �%  �>  P�j  �
  Q�&  �>  P�  L�i  ML�j  MQ�$  �  �h  �h  �$  �  ;�k  �l  T�  PQ�  �k  T�m  P�'  R�l  T�n  Q�  �k  T�o  P�h  Q�  �k  T�p  PQY`      GDSC   &      Z        ������������τ�   �������   �����������   ���¶���   ������Ķ   ������������Ķ��   ����������Ŷ   ������������ݶ��   ����ڶ��   ������ƶ   �����϶�   �������Ӷ���   ����Ӷ��   ����������Ŷ   �������ض���   ζ��   ϶��   ����������Ӷ   ���������Ӷ�   ��Ŷ   ���Ӷ���   ���Ӷ���   ����������¶   �����������Ӷ���   ����¶��   �����¶�   ���������Ŷ�   ����������¶   �����������Ķ���   �����������Ѷ���   ��������ض��   ���������������Ӷ���   ����Ӷ��   �����ڶ�   ������Ӷ   ���¶���   ��������Ҷ��   ��������Ӷ��                                         Label         CollisionShape2D            x         y         counter       collisionMask     ��UU�?                                      	                            	   %   
   *      /      4      5      6      ;      <      B      I      V      {      |      }      ~      �      �      �      �      �      �      �      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '   �   (   �   )     *     +     ,     -     .     /     0     1   *  2   .  3   /  4   8  5   ?  6   @  7   I  8   O  9   P  :   S  ;   Y  <   Z  =   e  >   i  ?   r  @   x  A   |  B   �  C   �  D   �  E   �  F   �  G   �  H   �  I   �  J   �  K   �  L   �  M   �  N   �  O   �  P   �  Q   �  R   �  S   �  T   �  U   �  V   �  W   �  X     Y     Z     [   Y3YY:�  Y:�  �  Y;�  �  P�  R�  QYY;�  �  Y;�  �  Y;�  �  Y;�  �  Y;�  �  YYY;�	  �  YY0�
  PQV�  �  �  P�  Q�  �  �  P�  QT�  T�  PQ�  �  �  P�  P�  T�  �  T�  R�  T�  �  T�  QR�  P�  T�  R�  T�  Q�  QYYYY0�  P�  V�  QV�  �  &�  T�  P�  QV�  �  T�  �  L�  ML�	  M�  �  T�  �  L�  ML�
  M�  �  �  L�  ML�  M�  �  �  L�  ML�  M�  (V�  �  PQYYY0�  PQV�  �  �  �  �  �  �  P�  P�  T�  �  T�  R�  T�  �  T�  QR�  P�  T�  R�  T�  Q�  QYYY0�  P�  R�  V�  QV�  �  �  T�  �  �  �  �  �  �  )�  �  V�  &�  �  V�  &�  T�  P�  L�  ML�  MQV�  �  �  �  �  &�  T�  L�  MV�  �  T�  �  �  �  '�  T�  L�  MV�  �  T�  �  �  �  (V�  �  T�  �  �  �  &PW�  T�  PQQV�  �	  �  �  &�  T�  L�  MV�  &P�	  QV�  �	  �  �  �  T�  �  �  &�  T�  L�  MV�  �  �  �  �  Y�  �  ;�  �  P�  Q�  &�  V�  �  �  T�   P�  T�!  Q�  �  P�  Q�  �  �  �  P�  P�  T�  �  T�  R�  T�  �  T�  QR�  P�  T�  R�  T�  Q�  QYY0�"  PQV�  �  �  �  �  �  T�#  �>  P�  QYY0�$  PQV�  �  �  T�#  �>  P�  QYY0�%  PQV�  �  .N�	  V�  T�  R�
  V�  T�  R�  V�  R�  V�  OY` GDSC      
   $   �      �����������Ӷ���   ����¶��   ���������Ӷ�   ���¶���   ϶��   �������   �����¶�   ���Ӷ���   ������������ݶ��   ���������Ŷ�   ������������Ķ��   ��������¶��   ζ��   �����������Ķ���   �����������Ѷ���   ������ƶ   �����������   ����������¶   ������Ķ   ��������ض��   ���������������Ӷ���   ����Ӷ��   �����ڶ�   �������ض���   ����������Ŷ      res://Scripts/LocalPlayer.gd  ��UU�?      collisionMask                                                                                             	      
         %      4      8      9      B      H      Q      X      [      a      l      p      y            �      �      �      �      �      �      �       �   !   �   "   �   #   �   $   �   %   Y3YY0P�  R�  QV�  �  �  T�  �  �  Y�  �  �  )�  �  V�  &�  �  V�  &�  T�	  P�  L�  ML�  MQV�  �
  �  Y�  &�  T�  L�  MV�  �  T�  �  �  '�  T�  L�  MV�  �  T�  �  �  (V�  �  T�  �  �  &PW�  T�  PQQV�  �  �  �  &�  T�  L�  MV�  &P�  QV�  �  �  �  �  T�  �  �  &�  T�  L�  MV�  �  �  �	  Y�  �  ;�  �  P�  Q�  &�  V�  �  �  T�  P�  T�  Q�  �  P�  QY�  �  �  P�  P�  T�  �  T�  R�  T�  �  T�  QR�  P�  T�  R�  T�  Q�	  QY` GDSC            a      ���Ӷ���   �����������ڶ���   ����������ڶ   ���Ӷ���   �������   �������   ���   �����϶�   �������Ӷ���   ���������������Ŷ���   �����׶�   ���Ӷ���   ���¶���   �����Ŷ�      InputControl      StatusLabel       WAITING FOR CONNECTION TO PEER        CONNECTED TO PEER.
    *   THE GAME HAS ENDED. DISCONNECTED FROM PEER                           
                     	   "   
   )      *      1      7      <      B      G      T      Y      _      Y3YY;�  Y;�  Y>�  N�  R�  R�  OYY0�  PQV�  �  �  PQ�  �  �  P�  QYY0�	  P�
  QV�  /�  T�  V�  �  T�  V�  �  T�  �  �  �  T�  V�  �  T�  �  �>  P�  T�  Q�  �  T�  V�  �  T�  �  Y`              GDST�  �           �  WEBPRIFF�  WEBPVP8L�  /�C� W�4  ��ݽz��G�(��]���ȶ�|���K����w2�aI��'���7�D��A�����βN�!��%%&Vp�SV���g������n�y?��$����	F��i�	��v%7��?2�!����Q��YQ$6i_*+]�(�����'Raj
��n�@A��F�t�wf��Zo���K (����In	�$_�WF,�[�u�ߢ���@��=�2���D���������������������������������������������R��^��S��Ŝ�{L�j�j�Y/�B2Wʆ�����M����#�T�ோ�C�+���L1�=Ũ�t�(v����)�s\.����2ˌ�k��G�z�K��y���b(�ϙ��m���Ka������)�Y��b\kc��g���O7gHGl\����-}L�����֌�q���5�V�灪?'wQ��U{��:bG޽ow��X��Ƈ�*F���Gy���OO��x�	Yc'�z����mf�kIr�Ȩ��a],2W��ʈ�'y����"c�yH�y���������q�]��R1�\k@W���p�I����E�U�	��֊6�;����!���ԩ�Ǹ��� �Y��.<���#$3��鬿��{�1�+�׶��5�}y��)$�UFb�i�3�Y�6	���Gsn����`L�f^ ��v��@ԾȗI�=gl\�[1��'��Y�zf]!㒕A�J:�����Ę?e���{�_��0͠�F�h�b�b��9������:u]�:�iҍ�xV�fX�h3^�Z�y���
x�A��;����^
T�>tu����ɭm��s�z��uo�-3�@� �A�yq�`�x� ��D��}�n�G�n���^��Q���m�����x�?D��l)1Q,'�$�Ύ}��;���R]t�n<����@<�z���g@X�.iOwAS�xڀ�+C��� ��`YWb܎���I��ʸ��ߔ�j���de��Ŝ��==V�Ζ�T2�7�.��\Ĺ� "�$�)Q�>ݭe�^���
��w)d���4���@�ز�!���V�z�,"7&���s�	yAO_�����[/i�'�(K�y�m�$�i:g������F�<$v��nc���X�9��!ޞ31<X�t��5��Gl`%��1Ϲ�Ү�ő�J����y�4ݠ3�S,�*.D�����I �խ��V,�I"����J&ӂ���a\���׶����O����U vŮ�����-��g�Ki���"J�	̀�+�Eg�]�1��eivqcG//��gĆ$�=�v�;ՊqS�0>��ۖ[���&�L-��f'��[c��V�%�4�����w��?"8.;�+���U\�] ���}W
u߬Q�`�>��=w)l*h>k���޹[IUQH|���;��[�SI+�hm����&p����}a}�R�O$���;��9X/�jݟż6(���S��9�;����,6t�?ۏ����֋� FZ��W��LҀ(�
��$��u���h��|�BBH���%�V��u�{�?"# ��
[�T���@,�*���?+:������C�v�d��?g�~V
����XGGs�B�?S������������u�p� c�(�c�]��Pl��I����"4V�Vj�^GlVEc�S�I4)�?E�wIH��NT�U�v��@G����4R^f�L�qCZ�Q��S�صQb��֝Ud#�4#��1m�%���@W	��-m���$(c��s����YU�����z��2hz2Jcd�J�����#�i��x�Ǹ�.�]�n�n[��ܬ��4H�}@��f�X��g� ʝ}����5h<��fU4��[�vyČ3�t(Esٟ3/��ڙ�J8�
��uao�s���pqk������>>'H2��?U���f\2p�!K�檒U��Ƈne��:�.Bb��B9������,Py����>�JV�b YZ�.轵�T�dU
I�O�p��
)� $��Zb�˪JL����������>@� 6��$�k&F��J�4u�[�OH1ܭ���Kl��O.�W��ꨗU�������������h����G���(�t��\,j��\#q���w4��>	�5~�і�zY�ƴ����)����@�?�Q�h���Hf롧��	�TV�K�Z�Z�Ÿ"0/��g�cZ``�U��U�4F��JŴm���� ������у&%6�4!���YEb�˪TL�T��4��E�g�m���,6.��}Wl�A��.A����4JV+1h��8���4��D!�U S�#t��+��UnL[I��>r �bQ��y�?��{].�b5Ӗ�:�dU ��G2t��Z��@�?�
)�,	rk���ة%��fU*�-�޶<'R���Tƭ��3ݦ�l�|��J�U��&��?@�?��J�^�37�1db�J���1�N����g�O)$[��R��V	�4go���j�)�K��?;����Į����\�p��brn�i�9�!u�`����j�*��;#)� �m�)�U\gj���z�Զ���F���\�j�rA�!n�����Jj�
 Ir�U�!C��>ǅ�i�)�{�y楺���*�?p����s�A������|��������������������?�����_�OyL3�ydj�9���*�V�O������ʩ�g,/�����6M��ʹ�tV��߸����#��A��h����5c���w��?+���瀀X�Kk�q��L0�4�~H���{li�;q�P�?��4�a�z����:z+�.��Ε�O@ۋ;�:�<����b)b��x���m��<m/����f�"P��>D��ˢb�~�gpk�J����j�Kr�s�mџ�����.�Bq]!bgw����֝���d�A�9b�����蹒�_���ط�����e_��=�m+Z�_~�o�����Ín�� �4Li�v�|)F�Fb]���'���tj�x:��r>(tUD����yҫE��_�B�����3b֞���\�sb��_�����5����L�v�Қ�L/�f�$_yz�)f�h�8ʥI���x�^�F禁<gd�>*<�ri�	�h���|�)�����k�M�8ʥ?�m�m���1�# ��X�:�Q.�9l3�㊁�U��u)��8ʥ]�mZ��إ'�B�E�^ J��ɥSǽwD�~c��v�Q`n��GO.�9�]6�Xji!�Kr>�r���h0�3��mc]��K9�r��A�]�w}nj�!6q��G���-�.�^y����:C����8ʥ5Y�[�����¾�C(�N�]�l������\:u�t��s��=zriЉ��Fpo�돸�t�t�:pri�!:G���p��B$.$�Ώ�\Zs$	��Ĭ��BB�.B��ʃ)���y���]k�P.-8�����ɥ�0Wk�=   [remap]

importer="texture"
type="StreamTexture"
path="res://.import/FondoC.png-f7f67968d42ffc7c7a56150789c211cc.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://Sprites/FondoC.png"
dest_files=[ "res://.import/FondoC.png-f7f67968d42ffc7c7a56150789c211cc.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
GDST�   �            *  WEBPRIFF  WEBPVP8L  /��'�&�m'�����:��iJ���V�F��j�����3y�;f���(�l'��-n9��/|�"�G`�{�$��J�Ǒ��/W5�q	���@WS�Ŵ լD������ɓ������E��V��H���������A�?�I"�?տʟ�%Λ)�wMʧ��Z���nw��v�-oji�u]/q�K|�	����+�\1Oxt���N#��bi)�$z|`ϼcv.!l&��a�M�m$p�d�����sM��]���
���ƸǒM���b$Ȓ�T�u��xSxf~!�
�^�M���M�ɹ�oA_x��T��E[�)<39{���=�lޜ9�g�
z��Ɲ�k*.ɺ�㒨kJ.�!�i�T	���{�/!�0ģ35Ĥ�4�e��yqg�Sk��3�����;̉u=w_�Ǒ��E1�C�Ϻ������6|���G�}�:�/����qi/-C� Zt-SU:�Ύ�xH����΍��΋1f�J?�]P�7###�LD�ø�����           [remap]

importer="texture"
type="StreamTexture"
path="res://.import/TEST.png-fe3f75d1f9280a32f5d1196400c3b2ed.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://Sprites/TEST.png"
dest_files=[ "res://.import/TEST.png-fe3f75d1f9280a32f5d1196400c3b2ed.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
      GDST�   �            �  WEBPRIFF�  WEBPVP8Ly  /��'��6�m%���[F�Ҽ4d��C�#�V��B�O�,I��ṻ��ض�j�N��[B�4@d��eE�� �ux� �Kz�����u wiSƻZ���� X�kI��l�J�x� ��>%`�� ^^w����y��@�)8*��=����c��{�/�g���b�z��Z��v4� �v�6�e�N&j_
�n&�u�k{_��1��D��� _�+���#l�Lؖ�;&�L_Y�e��Y�M&Sl#t��&�3������7<��8��d2	�f���pr���|�χ/x�����B얣���� �����c���U]r̭�cN58�RsƩ�����$06�q�9��Z*���Y��
k��q��:�����M���UW���Y�2+���n���
C�������2t즄Ϫ��ճ����ZW�KE���jp����^T�k���1��:�'v�)R�b�;�Ow��+OJ��:>���	���`00rbY����L�ul�b���i`�yl%���]��wAb��:&�2�����X�{�	F�p�	F� y�Q2��>6UC*t���;��_�D�֨��t ����Z8.B�U�ȉ��O=   [remap]

importer="texture"
type="StreamTexture"
path="res://.import/TEST2.png-64c092c6b54f2671e6116279b7c768f4.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://Sprites/TEST2.png"
dest_files=[ "res://.import/TEST2.png-64c092c6b54f2671e6116279b7c768f4.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
   GDST   �            �   WEBPRIFF�   WEBPVP8L�   /��# �p��zߢz���b�n���C��$h�^���� $��	X�ބ�E���"'����1��	@�$'�k�Y�`��7Z�z��;[B���=�G�_,¯e�j��d�E]}-��w���           [remap]

importer="texture"
type="StreamTexture"
path="res://.import/fondoA.png-9dd9472ccb4b5fad6972e461331aa66f.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://Sprites/fondoA.png"
dest_files=[ "res://.import/fondoA.png-9dd9472ccb4b5fad6972e461331aa66f.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
GDST   �            $  WEBPRIFF  WEBPVP8L  /��#� m��m�J$�Ӿ�@ ɟa��?�|��h��>�x9��������;я6��~���mcD�'���+��� �8;R�(�t�݉�H�T���HW�0u���.؉�05(��:�.��Q�ll�RC�`Sip��Np�5p��j��ͷT P��zIs�Np��jQeՆ�f�rKM2���@��6����6�Y�e���4�NP�5����$��Sq�BV�)|�i@'8����>��9����R58y �
�=�g�/Z���al�\��/�u�Y�zI��B
��	X��>c�A �+ ��}�rq�d��2(7�o���2�����8
H\�]�8)�_�:ନ�naꀳ�( e��$�k��f�h@���(��.OO
�RwZ�6v$��E�Uhkx���h�RJZ4���4���Lj���qT��>g����`o�kq��`6��Ӫŷg��i��>�Q������I{��A��)�]��cP�����*��}ț}���<IO{������ [remap]

importer="texture"
type="StreamTexture"
path="res://.import/fondoB.png-9cfda74e2071ddf83442690331b11ac2.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://Sprites/fondoB.png"
dest_files=[ "res://.import/fondoB.png-9cfda74e2071ddf83442690331b11ac2.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
GDST@   @            d   WEBPRIFFX   WEBPVP8LL   /?� @�m�/9���y��X0k�O��O�L�6%9��^���m�0r�Tπ+p��ZIzm�W�c���/W'N�Ot [remap]

importer="texture"
type="StreamTexture"
path="res://.import/wall.png-9b0e8f0ce8f6ab21260c2b1286395d20.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://Sprites/wall.png"
dest_files=[ "res://.import/wall.png-9b0e8f0ce8f6ab21260c2b1286395d20.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
      [gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]
sky_top_color = Color( 0.0470588, 0.454902, 0.976471, 1 )
sky_horizon_color = Color( 0.556863, 0.823529, 0.909804, 1 )
sky_curve = 0.25
ground_bottom_color = Color( 0.101961, 0.145098, 0.188235, 1 )
ground_horizon_color = Color( 0.482353, 0.788235, 0.952941, 1 )
ground_curve = 0.01
sun_energy = 16.0

[resource]
background_mode = 2
background_sky = SubResource( 1 )
GDST@   @            �  WEBPRIFF�  WEBPVP8L�  /?����m��������_"�0@��^�"�v��s�}� �W��<f��Yn#I������wO���M`ҋ���N��m:�
��{-�4b7DԧQ��A �B�P��*B��v��
Q�-����^R�D���!(����T�B�*�*���%E["��M�\͆B�@�U$R�l)���{�B���@%P����g*Ųs�TP��a��dD
�6�9�UR�s����1ʲ�X�!�Ha�ߛ�$��N����i�a΁}c Rm��1��Q�c���fdB�5������J˚>>���s1��}����>����Y��?�TEDױ���s���\�T���4D����]ׯ�(aD��Ѓ!�a'\�G(��$+c$�|'�>����/B��c�v��_oH���9(l�fH������8��vV�m�^�|�m۶m�����q���k2�='���:_>��������á����-wӷU�x�˹�fa���������ӭ�M���SƷ7������|��v��v���m�d���ŝ,��L��Y��ݛ�X�\֣� ���{�#3���
�6������t`�
��t�4O��ǎ%����u[B�����O̲H��o߾��$���f���� �H��\��� �kߡ}�~$�f���N\�[�=�'��Nr:a���si����(9Lΰ���=����q-��W��LL%ɩ	��V����R)�=jM����d`�ԙHT�c���'ʦI��DD�R��C׶�&����|t Sw�|WV&�^��bt5WW,v�Ş�qf���+���Jf�t�s�-BG�t�"&�Ɗ����׵�Ջ�KL�2)gD� ���� NEƋ�R;k?.{L�$�y���{'��`��ٟ��i��{z�5��i������c���Z^�
h�+U�mC��b��J��uE�c�����h��}{�����i�'�9r�����ߨ򅿿��hR�Mt�Rb���C�DI��iZ�6i"�DN�3���J�zڷ#oL����Q �W��D@!'��;�� D*�K�J�%"�0�����pZԉO�A��b%�l�#��$A�W�A�*^i�$�%a��rvU5A�ɺ�'a<��&�DQ��r6ƈZC_B)�N�N(�����(z��y�&H�ض^��1Z4*,RQjԫ׶c����yq��4���?�R�����0�6f2Il9j��ZK�4���է�0؍è�ӈ�Uq�3�=[vQ�d$���±eϘA�����R�^��=%:�G�v��)�ǖ/��RcO���z .�ߺ��S&Q����o,X�`�����|��s�<3Z��lns'���vw���Y��>V����G�nuk:��5�U.�v��|����W���Z���4�@U3U�������|�r�?;�
         [remap]

importer="texture"
type="StreamTexture"
path="res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://icon.png"
dest_files=[ "res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
              [remap]

path="res://Scripts/InputControl.gdc"
 [remap]

path="res://Scripts/LocalPlayer.gdc"
  [remap]

path="res://Scripts/NetPlayer.gdc"
    [remap]

path="res://Scripts/StatusCheck.gdc"
  ECFG      _global_script_classes             _global_script_class_icons             application/config/name      
   Juego Base     application/run/main_scene,      #   res://Scenes/Stage2DCollisions.tscn    debug/settings/fps/force_fps      <      debug/settings/stdout/print_fps         #   debug/gdscript/warnings/unsafe_cast         
   global/fps             global/frames             input/test_inicio�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode          physical_scancode      T      unicode           echo          script         input/test_fin�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode          physical_scancode      P      unicode           echo          script         input/GuardarDatos�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode          physical_scancode      Z      unicode           echo          script         layer_names/2d_physics/layer_1         Player     layer_names/2d_physics/layer_2         Wall)   rendering/environment/default_environment          res://default_env.tres  