extends Node
class_name Quest

@export var text : String
@export var description : String
@export_range(0, 100, 1) var requirement : int
@export var player : Node2D
@export var targetX := -500

const QUEST = preload("uid://cvbpksdahe48b")
@onready var quests_table: Control = $CanvasLayer/Control2/QuestsTable
var quest : QuestUI

var progress = 0

func Enter() -> void:
	quest = QUEST.instantiate()
	quests_table.add_child(quest)
	quest.setText(text)
	quest.setDescritiption(description)
	quest.setRequirement(requirement)

func addProgress(value : int) -> void:
	progress += value

func Update() -> void:
	progress = remap(abs(targetX - player.position.x), 1000 + abs(targetX), 100, 0, 100)
	quest.updateResult(progress)
	if progress >= requirement:
		Exit()

func Exit() -> void:
	pass
