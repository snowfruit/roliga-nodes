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


## Set color to red. Return true if set to red.
func set_to_red() -> bool:
	if color == Color.RED:
		return false

	color = Color.RED

	color_changed.emit(color)

	return true


## Set color to green. Return true if set to green.
func set_to_green() -> bool:
	if color == Color.GREEN:
		return false

	color = Color.GREEN

	color_changed.emit(color)

	return true


## Set color to blue. Return true if set to blue.
func set_to_blue() -> bool:
	if color == Color.BLUE:
		return false

	color = Color.BLUE

	color_changed.emit(color)

	return true


## Set color to random color.
func randomize_color(use_alpha: bool = false) -> void:
	if use_alpha:
		set_color(Color(randf(), randf(), randf(), randf()))
	else:
		set_color(Color(randf(), randf(), randf()))
