@export var dialogue : DialogueResource

func interact(_player : Player, NPC : Node2D) -> void:
	DialogueManager.show_dialogue_balloon(dialogue, "", [NPC])
