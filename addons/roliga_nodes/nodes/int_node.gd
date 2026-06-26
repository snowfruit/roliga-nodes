class_name IntNode
extends Node

signal value_changed(previous: int, new: int)

@export var value: int:
	set = set_value


## Returns true if value changed.
func set_value(new_value) -> bool:
	if value == new_value:
		return false

	var previous: int = value
	value = new_value

	value_changed.emit(previous, value)

	return true
