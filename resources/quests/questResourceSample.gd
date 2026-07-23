@export var Text : String
@export var description : String
@export_range(0, 100, 1) var requirement : int
var result = 0

func Enter() -> void:
	pass

func Update() -> void:
	if result >= requirement:
		Exit()
	pass

func Exit() -> void:
	pass
