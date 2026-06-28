class_name IntNode
extends Node
## Stores and manages an int value.
##
## Emits a signal when the value changes.

signal value_changed(previous: int, new: int)

@export var value: int:
	set = set_value


## Returns true if value changed.
func set_value(new_value: int) -> bool:
	if value == new_value:
		return false

	var previous: int = value
	value = new_value

	value_changed.emit(previous, value)

	return true


## Returns true if value is negative.
func is_negative() -> bool:
	if value < 0:
		return true

	return false


## Returns true if value is positive.
func is_positive() -> bool:
	if value > 0:
		return true

	return false
