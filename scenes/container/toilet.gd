extends ItemContainer

func hit():
	if not opened:
		var pos = $SpawnPositions.get_child(randi()%$SpawnPositions.get_child_count()).global_position
		open.emit(pos, current_direction)
		$LidSprite.hide()
		opened = true
