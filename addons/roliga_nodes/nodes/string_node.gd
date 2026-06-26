class_name StringNode
extends Node

signal value_changed(previous: String, new: String)

@export var value: String:
	set = set_value


## Returns true if value changed.
func set_value(new_value) -> bool:
	if value == new_value:
		return false

	var previous: String = value
	value = new_value

	value_changed.emit(previous, value)

	return true
