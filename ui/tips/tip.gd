extends PanelContainer
class_name Tip

@onready var label: Label = %Label

func addAnimation() -> void:
	DialogueManager.dialogue_started.connect(duringInteraction)
	DialogueManager.dialogue_ended.connect(afterInteraction)
	self.modulate.a = 0
	var tween := create_tween()
	tween.tween_property(self, "modulate:a", 1, 0.35)
	tween.play()
	await tween.finished

func deleteAnimation() -> void:
	var tween := create_tween()
	tween.tween_property(self, "modulate:a", 0, 0.35)
	tween.play()
	await tween.finished

func duringInteraction(_resource) -> void:
	print("DURING")
	var tween := create_tween()
	tween.tween_property(self, "modulate:a", 0, 0.35)
	tween.play()

func afterInteraction(_resource) -> void:
	print("AFTER")
	var tween := create_tween()
	tween.tween_property(self, "modulate:a", 1, 0.35)
	tween.play()

func setText(text : String) -> void:
	label.text = text
