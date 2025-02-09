extends CharacterBody2D

var player_nearby: bool = false
var can_laser: bool = true
var vulnerable: bool = true
var right_gun_use: bool = true
var health: int = 30

signal laser(pos, direction)




func hit():
	if vulnerable:
		health -= 10
		vulnerable = false
		$HitTimer.start()
		if health <=0:
			queue_free()

func _process(_delta: float) -> void:
	if(player_nearby):
		look_at(Globals.player_position)
		if can_laser == true:
			var marker_node = $LaserSpawnPositions.get_child(right_gun_use)
			right_gun_use = not right_gun_use
			var pos: Vector2 = marker_node.global_position
			var direction: Vector2 = (Globals.player_position - position).normalized()
			laser.emit(pos,direction)
			can_laser = false
			$LaserCooldown.start()

func _on_attack_area_body_entered(_body: Node2D) -> void:
	player_nearby = true


func _on_attack_area_body_exited(_body: Node2D) -> void:
	player_nearby = false


func _on_laser_cooldown_timeout() -> void:
	can_laser = true


func _on_hit_timer_timeout() -> void:
	vulnerable = true
