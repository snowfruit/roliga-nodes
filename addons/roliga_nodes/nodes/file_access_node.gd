class_name FileAccessNode
extends Node
## Reading and writing text to file.

signal file_was_read
signal file_was_written

@export var path: String = "user://file.txt"
@export_multiline() var text: String = "Hello, World!"


## Returns true if text was read from file.
func read_from_file() -> bool:
	var file = FileAccess.open(path, FileAccess.READ)

	if file:
		text = file.get_as_text()
		file.close()
		file_was_read.emit()

		return true

	return false


## Returns true if text was written to file.
func write_to_file() -> bool:
	var file = FileAccess.open(path, FileAccess.WRITE)

	if file:
		var success: bool = file.store_string(text)
		file.close()

		if success:
			file_was_written.emit()

			return true
		else:
			return false

	return false
