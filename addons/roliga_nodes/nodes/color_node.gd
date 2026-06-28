class_name ColorNode
extends Node
## Storing and manipulating colors.

signal color_changed(new_color: Color)

@export var color: Color:
	set = set_color


## Returns true of color was changed.
func set_color(new_color: Color) -> bool:
	if color == new_color:
		return false

	color = new_color

	color_changed.emit(color)

	return true


## Set color to random color.
func randomize_color(use_alpha: bool = false) -> void:
	if use_alpha:
		set_color(Color(randf(), randf(), randf(), randf()))
	else:
		set_color(Color(randf(), randf(), randf()))
