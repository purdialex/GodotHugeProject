extends Area2D


signal player_entered_house(body)
signal player_exited_house(body)

#func _on_area_entered(body) -> void:
	#player_entered_house.emit(body)


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:  
		player_entered_house.emit(body)


func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D: 
		player_exited_house.emit(body)
