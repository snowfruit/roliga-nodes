class_name OnOffNode
extends Node
## For objects that turns on and off.

signal toggled(new_value: bool)
signal turned_on
signal turned_off
signal value_changed(new_value: bool)

@export var _is_on: bool:
	set = set_value


## Return true if on.
func is_on() -> bool:
	return _is_on


## Return true if off.
func is_off() -> bool:
	return not _is_on


## Returns state after toggle.
func toggle_on_off() -> bool:
	if is_on():
		turn_off()
	else:
		turn_on()

	toggled.emit(is_on())

	return is_on()


## Returns true if value changed.
func turn_on() -> bool:
	return set_value(true)


## Returns true if value changed.
func turn_off() -> bool:
	return set_value(false)


## Returns true if value changed.
func set_value(new_value: bool) -> bool:
	if _is_on == new_value:
		return false

	_is_on = new_value

	# Signals.
	value_changed.emit(_is_on)

	if is_on():
		turned_on.emit()
	else:
		turned_off.emit()

	return true
