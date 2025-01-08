extends CharacterBody2D	


const drone_speed = 1000


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#direction
	var direction = Vector2(1,0)
	#velocity
	velocity = direction * drone_speed
	#move and slide
	move_and_slide()

func hit():
	print("Ive been hit")
