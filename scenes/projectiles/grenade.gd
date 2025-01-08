extends RigidBody2D

const speed = 400

func explode():
	$AnimationPlayer.play("Explosion")
