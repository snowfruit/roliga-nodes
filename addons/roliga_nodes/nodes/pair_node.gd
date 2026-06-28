class_name PairNode
extends Node
## Keep track of a pair of nodes. Can be used to trigger one or both nodes.

signal triggered_node_a
signal triggered_node_b
signal triggered_nodes

@export var node_a: Node
@export var node_b: Node


## Returns true if both nodes triggered. Both nodes needed to trigger.
func trigger_nodes() -> bool:
	if node_a and node_b:
		triggered_nodes.emit()

		trigger_node_a()
		trigger_node_b()

		return true

	return false


## Returns true if triggered.
func trigger_node_a() -> bool:
	if node_a:
		triggered_node_a.emit()
		return true

	return false


## Returns true if triggered.
func trigger_node_b() -> bool:
	if node_b:
		triggered_node_b.emit()
		return true

	return false
