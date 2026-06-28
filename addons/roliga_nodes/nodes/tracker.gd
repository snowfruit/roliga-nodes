class_name Tracker
extends Node
## Keep track of a node in the scene tree even as it moves or change name.

signal target_changed(new_target)

@export var target: Node:
	set = set_target


## Set target. Returns true if target changed.
func set_target(new_target: Node) -> bool:
	if target == new_target:
		return false

	target = new_target

	target_changed.emit(target)

	return true
