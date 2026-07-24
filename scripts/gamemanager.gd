extends Node2D

const QUEST_2 := preload("uid://cpnuw7xy130y4")
const QUEST_1 := preload("uid://cwtm6dvf6fxjr")

func _ready() -> void:
	process_mode = $".".PROCESS_MODE_ALWAYS
	updateLinks()
	y_sort_enabled = true
	get_tree().debug_collisions_hint = true
	TransitionSystem.transition.connect(sceneChanged)

func sceneChanged() -> void:
	QuestSystem.clearAllQuests()
	updateLinks()

func updateLinks() -> void:
	var player: Node2D = get_node_or_null("Player")
	if player != null:
		QuestSystem.player = player

func _process(delta: float) -> void:
	pass
