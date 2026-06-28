class_name SpawnSceneNode
extends Node
## Spawn a PackedScene as child or as child of target.

signal spawned

@export var packed_scene: PackedScene
@export var target: Node


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
