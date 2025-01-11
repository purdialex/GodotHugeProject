extends LevelParent


func _on_gate_player_entered_gate(_body: Variant) -> void:
	var tween = create_tween()
	tween.tween_property($Player,"speed",0,0.5)
	TransitionLayer.change_scene("res://scenes/levels/inside.tscn")


func _on_house_player_entered_house(body: Variant) -> void:
	get_tree().create_tween().tween_property($Player/Camera2D,"zoom", Vector2(1,1), 1)
	print(body)


func _on_house_player_exited_house(body: Variant) -> void:
	get_tree().create_tween().tween_property($Player/Camera2D,"zoom", Vector2(0.6,0.6), 1.5)
	print(body)
	
