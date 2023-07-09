extends Node2D

var player_scene = preload("res://player.tscn")

func _ready():
	
	Network.game = self
	
	create_player(Network.unique_id)

func create_player(id):
	var p = player_scene.instantiate()
	p.name = str(id)
	p.global_position = Vector2(500,0)
	p.set_multiplayer_authority(id)
	add_child(p)
