class_name DestroyTarget
extends Node
## Destroy target node with queue_free().

signal target_destroyed

@export var target: Node


## Destroy target node with queue_free() if possible.
func destroy_target():
	if target:
		target.queue_free()
		target_destroyed.emit()
