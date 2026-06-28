class_name SpawnPackedScene
extends Node
## Spawn a PackedScene as child or as child of target.

signal spawned
signal target_changed(new_target)

@export var packed_scene: PackedScene
@export var target: Node:
	set = set_target


## Set target. Returns true if target changed.
func set_target(new_target: Node) -> bool:
	if target == new_target:
		return false

	target = new_target

	target_changed.emit(target)

	return true


# Returns true if node was spawned.
func spawn() -> bool:
	if not packed_scene:
		return false

	var ps := packed_scene.instantiate()

	if target:
		target.add_child(ps)
	else:
		add_child(ps)

	spawned.emit()

	return true
