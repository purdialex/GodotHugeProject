extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene : PackedScene = preload("res://scenes/projectiles/grenade.tscn")

func _on_gate_player_entered_gate(body) -> void:	
	print("player has entered gate")
	print(body)	


func _on_player_laser(pos) -> void:
	#1. update laser position
	var laser = laser_scene.instantiate()
	laser.position = pos
	#2. we have to move the laser
	#DONE IN THE LASER SCrIPT
	#3. I want to add the laser instance to a Node2d
	$Projectiles.add_child(laser)

func _on_player_grenade(pos) -> void:
	#1 update grenade position
	var grenade = grenade_scene.instantiate()
	grenade.position = pos
	$Projectiles.add_child(grenade)
