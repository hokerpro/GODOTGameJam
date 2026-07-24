extends Node2D

const QUEST_1 = preload("uid://cwtm6dvf6fxjr")
@onready var quests_table: QuestTable = %QuestsTable
@onready var player: Node2D = %Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	y_sort_enabled = true
	get_tree().debug_collisions_hint = true
	QuestSystem.player = player
	QuestSystem.quests_table = quests_table
	QuestSystem.addQuest(QUEST_1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
