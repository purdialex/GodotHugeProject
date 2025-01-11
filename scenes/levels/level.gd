extends Node2D
class_name LevelParent

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene : PackedScene = preload("res://scenes/projectiles/grenade.tscn")
var item_scene: PackedScene = preload("res://scenes/items/item.tscn")

func _ready():
	for container in get_tree().get_nodes_in_group("Container"):
		container.connect("open", _on_container_opened)
	for container in get_tree().get_nodes_in_group("Container"):
		container.connect("open", _on_toilet_opened)
		
func _on_container_opened(pos, direction):
	var item = item_scene.instantiate()
	item.position = pos
	item.direction = direction
	$Items.call_deferred('add_child',item)

func _on_toilet_opened(pos, direction):
	var item = item_scene.instantiate()
	item.position = pos
	item.direction = direction
	$Items.call_deferred('add_child',item)

func _on_player_laser(pos, direction) -> void:
	$UI.update_laser_text()
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
	laser.direction = direction
	$Projectiles.add_child(laser)

func _on_player_grenade(pos, direction) -> void:
	$UI.update_grenade_text()
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
