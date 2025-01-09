extends LevelParent



func _on_exit_gate_area_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file.call_deferred("res://scenes/levels/outside.tscn")
