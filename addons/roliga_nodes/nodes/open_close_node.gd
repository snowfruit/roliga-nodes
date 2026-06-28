class_name OpenCloseNode
extends Node
## For objects that opens and closes.

signal closed
signal opened
signal toggled(new_value: bool)
signal value_changed(new_value: bool)

@export var _is_open: bool:
	set = set_value


## Return true if open.
func is_open() -> bool:
	return _is_open


## Return true if closed.
func is_closed() -> bool:
	return not _is_open


## Returns state after toggle.
func toggle_open_closed() -> bool:
	if is_open():
		close()
	else:
		open()

	toggled.emit(is_open())

	return is_open()


## Returns true if value changed.
func open() -> bool:
	return set_value(true)


## Returns true if value changed.
func close() -> bool:
	return set_value(false)


## Returns true if value changed.
func set_value(new_value: bool) -> bool:
	if _is_open == new_value:
		return false

	_is_open = new_value

	# Signals.
	value_changed.emit(_is_open)

	if is_open():
		opened.emit()
	else:
		closed.emit()

	return true
