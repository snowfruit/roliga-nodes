class_name FloatNode
extends Node
## Stores and manages a float value.
##
## Emits a signal when the value changes.

signal value_changed(previous: float, new: float)

@export var value: float:
	set = set_value


## Returns true if value changed.
func set_value(new_value: float) -> bool:
	if value == new_value:
		return false

	var previous: float = value
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
