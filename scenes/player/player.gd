extends CharacterBody2D


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
	if(Input.is_action_pressed("primary action")):
		print("Shoot laser")
		
	#grenade throwing input
	if(Input.is_action_pressed("secondary action")):
		print("Throw grenade")
		
	
