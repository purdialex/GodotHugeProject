extends Node

signal health_change
signal laser_change
signal grenade_change




var health = 60:
	get:
		return health
	set(value):
		health = value
		health_change.emit()
		

var laser_amount = 20:
	get:
		return laser_amount
	set(value):
		laser_amount = value
		laser_change.emit()


var grenade_amount = 5:
	get:
		return grenade_amount
	set(value):
		grenade_amount = value
		grenade_change.emit()
		
var player_position: Vector2
