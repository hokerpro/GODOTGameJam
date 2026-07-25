extends Node

signal transition

var isTransitioning := false

func changeDay(day : int) -> void:
	isTransitioning = true
	SceneTransition.beginTransition(1, false, true, 0.2, 2, str(day) + "Day(s) Until The Execution")
	await SceneTransition.transition
	transition.emit()
	SceneTransition.endTransition.emit()

func changeScene(newScene : String, text : String = "") -> void:
	var addText : bool = false
	if text != "":
		addText = true
	isTransitioning = true
	SceneTransition.beginTransition(1, false, addText, 0.2, 4, text)
	await SceneTransition.transition
	get_tree().change_scene_to_file(newScene)
	transition.emit()
	await get_tree().scene_changed
	SceneTransition.endTransition.emit()
