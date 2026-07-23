extends Node
@export var Text : String
@export var description : String
@export_range(0, 100, 1) var requirement : int
@export var player : Node2D

var result = 0
var targetX = -500

func Enter() -> void:
	pass

func Update() -> void:
	
	if result >= requirement:
		Exit()
	pass

func Exit() -> void:
	pass
