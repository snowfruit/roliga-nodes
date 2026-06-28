class_name CounterNode
extends Node
## Node for counting a value.

signal on_add
signal on_reset
signal on_subtract
signal value_changed(new_value: int)

@export var value: int = 0


## Reset counter to 0 and return value.
func reset() -> int:
	value = 0

	value_changed.emit(value)

	return value


## Add 1 to counter and return value.
func add() -> int:
	value += 1

	# Signals.
	on_add.emit()
	value_changed.emit(value)

	return value


## Subtract 1 from counter and return value.
func subtract() -> int:
	value -= 1

	# Signals.
	on_subtract.emit()
	value_changed.emit(value)

	return value
