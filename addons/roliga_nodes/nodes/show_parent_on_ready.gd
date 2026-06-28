class_name ShowParentOnReady
extends Node
## Show parent when _ready() is called if possible.

@export var enabled: bool = true


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if enabled:
		var parent := get_parent()

		if parent and parent.has_method("show"):
			parent.show()
