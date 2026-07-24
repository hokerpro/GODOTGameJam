extends Node

const COURT = preload("uid://b4wh34ntntmah")

var nextStep := 0
var steps : Array[Callable] = [step0, step1]
const QUEST_1 = preload("uid://cwtm6dvf6fxjr")
const QUEST_2 = preload("uid://cpnuw7xy130y4")

func startNextStep() -> void:
	doStep(nextStep)
	nextStep += 1

func doStep(step : int) -> void:
	if steps[step]:
		steps[step].call()

func step0() -> void:
	TransitionSystem.changeScene("res://scenes/mainScenes/game.tscn")
	await TransitionSystem.transition
	QuestSystem.addQuest(QUEST_1)

func step1() -> void:
	TransitionSystem.changeScene("res://scenes/mainScenes/Court.tscn")
	await TransitionSystem.transition
	await get_tree().create_timer(2).timeout
	DialogueManager.show_dialogue_balloon(COURT, "", [])

func step2() -> void:
	TransitionSystem.changeScene("res://scenes/mainScenes/prison.tscn")
	await TransitionSystem.transition
