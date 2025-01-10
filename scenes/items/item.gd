extends Area2D

var rotation_speed: float = 5
var available_options = ['laser','laser','laser','grenade','health']
var type = available_options.pick_random()

func _ready():
	if type == 'laser':
		$Sprite2D.modulate = Color("00f1f4")
	if type == 'grenade':
		$Sprite2D.modulate = Color("ff442b")
	if type == 'health':
		$Sprite2D.modulate = Color("08ff3f")

func _process(delta: float) -> void:
	rotation += rotation_speed * delta


func _on_body_entered(_body: Node2D) -> void:
	if type == 'health':
		Globals.health += 10
	if type == 'laser':
		Globals.laser_amount += 5
	if type == 'grenade':
		Globals.grenade_amount += 1
	queue_free()
