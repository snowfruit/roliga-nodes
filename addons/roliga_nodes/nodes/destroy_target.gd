class_name DestroyTarget
extends Node
## Destroy target node with queue_free().

signal target_changed(new_target)
signal target_destroyed

@export var target: Node:
	set = set_target


## Set target. Returns true if target changed.
func set_target(new_target: Node) -> bool:
	if target == new_target:
		return false

	target = new_target

	target_changed.emit(target)

	return true


## Destroy target node with queue_free() if possible.
func destroy_target():
	if target:
		target.queue_free()
		target_destroyed.emit()
