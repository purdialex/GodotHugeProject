extends Area2D

signal player_entered
signal player_exited

func _on_area_entered(CharacterBody2D) -> void:
	print("Player has entered")


func _on_mouse_entered() -> void:
	player_entered.emit()
	


func _on_mouse_exited() -> void:
	player_exited.emit()
