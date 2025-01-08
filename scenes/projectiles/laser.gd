extends Area2D

@export var speed:int = 1000
var direction = Vector2.UP

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$SelfDestructTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction * speed * delta

#AKA when laser hits something
func _on_body_entered(body) -> void:
	if "hit" in body:
		body.hit()
	queue_free()



func _on_timer_timeout() -> void:
	queue_free()
