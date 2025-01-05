extends CharacterBody2D

var can_laser: bool = true
var can_grenade: bool = true

#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
@onready var timer_laser = $LaserReloadTimer
@onready var timer_grenade = $GrenadeReloadTimer

signal laser(pos)
signal grenade(pos)

var speed = 800

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	#direction input
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * speed
	move_and_slide()
	
	#laser shooting input
	if(Input.is_action_pressed("primary action") && can_laser == true):
		#Randomly select a marker2d for the laser start
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers.pick_random()
		
		can_laser = false
		timer_laser.start()
		#emit the position we selected
		laser.emit(selected_laser.global_position)
		
		
	#grenade throwing input
	if(Input.is_action_pressed("secondary action") && can_grenade == true):
		can_grenade = false	
		timer_grenade.start()
		var pos = $LaserStartPositions.get_children()[1].global_position
		grenade.emit(pos)
		
	


func _on_timer_timeout() -> void:
	can_laser = true


func _on_grenade_reload_timer_timeout() -> void:
	can_grenade = true 
	
	
