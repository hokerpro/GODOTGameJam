extends Control
class_name QuestUI

@onready var quest: Label = %Quest
@onready var progress_bar: ProgressBar = %ProgressBar
@onready var quest_2: Label = %Quest2

func setText(text : String) -> void:
	quest.text = text

func setDescritiption(description : String) -> void:
	quest_2.text = description
	
func setRequirement(value : int) -> void:
	progress_bar.max_value = value

func updateResult(value : int) -> void:
	progress_bar.value = value
