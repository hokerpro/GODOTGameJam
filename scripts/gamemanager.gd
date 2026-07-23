extends Node2D

@export var dialogueResource : DialogueResource
var characterName : String = "HOKER"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DialogueManager.show_dialogue_balloon(dialogueResource)
	get_tree().debug_collisions_hint = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
