extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene : PackedScene = preload("res://scenes/projectiles/grenade.tscn")

func _on_gate_player_entered_gate(body) -> void:	
	print("player has entered gate")
	print(body)	


func _on_player_laser(pos, direction) -> void:
	#1. update laser position
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
	laser.direction = direction
	$Projectiles.add_child(laser)

func _on_player_grenade(pos, direction) -> void:
	#1 update grenade position
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	$Projectiles.add_child(grenade)



func _on_house_body_entered(body) -> void:
	get_tree().create_tween().tween_property($Player/Camera2D,"zoom", Vector2(1,1), 1)
	print(body)
	


func _on_house_body_exited(body: CharacterBody2D) -> void:
	get_tree().create_tween().tween_property($Player/Camera2D,"zoom", Vector2(0.6,0.6), 1.5)
	print(body)
