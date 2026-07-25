extends State
class_name playerInteract

@export var player : Node2D

func transitionToIdle(resource : DialogueResource):
	Transitioned.emit("playerIdle")

func Enter() -> void:
	player.playerState = "interact"
	DialogueManager.dialogue_ended.connect(transitionToIdle, CONNECT_ONE_SHOT)
