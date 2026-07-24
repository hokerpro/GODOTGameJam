extends Node

signal transition

var isTransitioning := false

func changeScene(newScene : String) -> void:
	isTransitioning = true
	SceneTransition.beginTransition(2)
	await SceneTransition.transition
	get_tree().change_scene_to_file(newScene)
	transition.emit()
	await get_tree().scene_changed
	SceneTransition.endTransition.emit()
