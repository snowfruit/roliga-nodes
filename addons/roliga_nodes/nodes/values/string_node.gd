class_name StringNode
extends Node
## Stores and manages a String value.
##
## Emits a signal when the value changes.

signal value_changed(previous: String, new: String)

@export var value: String:
	set = set_value


## Returns true if value changed.
func set_value(new_value: String) -> bool:
	if value == new_value:
		return false

	var previous: String = value
	value = new_value

	value_changed.emit(previous, value)

	return true
