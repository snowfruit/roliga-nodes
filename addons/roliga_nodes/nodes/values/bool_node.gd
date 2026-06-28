class_name BoolNode
extends Node
## Stores and manages a boolean value.
##
## Emits a signal when the value changes.

signal value_changed(new_value: bool)
signal changed_to_false
signal changed_to_true

@export var _is_true: bool:
	set = set_value


## Returns true if true.
func is_true():
	return _is_true


## Returns true if false.
func is_false():
	return not _is_true


## Return true if value was changed to true.
func set_to_true() -> bool:
	return set_value(true)


## Return true if value was changed to false.
func set_to_false() -> bool:
	return set_value(false)


## Returns true if value changed.
func set_value(new_value: bool) -> bool:
	if _is_true == new_value:
		return false

	_is_true = new_value

	# Signals.
	value_changed.emit(_is_true)

	if _is_true:
		changed_to_true.emit()
	else:
		changed_to_false.emit()

	return true
