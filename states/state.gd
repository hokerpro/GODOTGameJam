extends Node
class_name State

signal Transitioned(newState : State)

func Enter() -> void:
	pass

func Exit() -> void:
	pass

func Update(delta: float) -> void:
	pass
	
func Physics_Update(delta: float) -> void:
	pass
