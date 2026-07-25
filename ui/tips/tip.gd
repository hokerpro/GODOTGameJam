extends PanelContainer
class_name Tip

@onready var label: Label = %Label

func addAnimation() -> void:
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

func setText(text : String) -> void:
	label.text = text
