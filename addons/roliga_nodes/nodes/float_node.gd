class_name FloatNode
extends Node

signal value_changed(previous: float, new: float)

@export var value: float:
	set = set_value


## Returns true if value changed.
func set_value(new_value) -> bool:
	if value == new_value:
		return false

	var previous: float = value
	value = new_value

	value_changed.emit(previous, value)

	return true
