@export var dialogue : DialogueResource

func interact(player : Player, NPC : Node2D) -> void:
	DialogueManager.show_dialogue_balloon(dialogue, "", [player, NPC])
