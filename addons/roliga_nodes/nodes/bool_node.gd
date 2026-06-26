class_name BoolNode
extends Node

signal value_changed(previous: bool, new: bool)

@export var value: bool:
	set = set_value


## Returns true if value changed.
func set_value(new_value) -> bool:
	if value == new_value:
		return false

	var previous: bool = value
	value = new_value

	value_changed.emit(previous, value)

	return true
