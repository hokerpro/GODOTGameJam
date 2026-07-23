extends State
class_name playerInteract

@export var player : Node2D

func transitionToIdle(resource : DialogueResource):
	print("INTERACTION END")
	Transitioned.emit("playerIdle")


func Enter() -> void:
	print("Interact")
	DialogueManager.dialogue_ended.connect(transitionToIdle, CONNECT_ONE_SHOT)
