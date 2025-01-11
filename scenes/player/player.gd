extends CharacterBody2D

var can_laser: bool = true
var can_grenade: bool = true



#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
@onready var timer_laser = $LaserReloadTimer
@onready var timer_grenade = $GrenadeReloadTimer

signal laser(pos, direction)
signal grenade(pos, direction)



var speed = 800



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	
	#rotate
	look_at(get_global_mouse_position())
	
	
	#direction input
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * speed
	
	move_and_slide()
	Globals.player_position = global_position
	var player_direction = (get_global_mouse_position() - position).normalized()
	#laser shooting input
	if(Input.is_action_pressed("primary action") && can_laser == true and Globals.laser_amount > 0):
		Globals.laser_amount -=1
		$GPUParticles2D.emitting = true
		#Randomly select a marker2d for the laser start
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers.pick_random()
		can_laser = false
		$LaserReloadTimer.start()
		#emit the position we selected
		laser.emit(selected_laser.global_position, player_direction)
		
		
		
	#grenade throwing input
	if(Input.is_action_pressed("secondary action") && can_grenade == true and Globals.grenade_amount > 0):
		Globals.grenade_amount -=1
		can_grenade = false	
		$GrenadeReloadTimer.start()
		var pos = $LaserStartPositions.get_children()[1].global_position
		grenade.emit(pos, player_direction)
		
	


func _on_timer_timeout() -> void:
	can_laser = true


func _on_grenade_reload_timer_timeout() -> void:
	can_grenade = true 
	
