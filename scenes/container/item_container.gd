extends StaticBody2D
class_name ItemContainer


signal open(pos, direction)
#Before ready function
@onready var current_direction: Vector2 = Vector2.DOWN.rotated(rotation)

# ready:
# applying rotation
#creating the node
