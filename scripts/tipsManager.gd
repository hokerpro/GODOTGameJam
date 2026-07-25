extends Node

var tips : Dictionary[String, Tip] = {}

const TIP := preload("uid://c0np1xedyi58n")

func addTip(name : String, text : String) -> void:
	var newTip : Tip = TIP.instantiate()
	tips[name.to_lower()] = newTip
	TipsTable.addTip(newTip)
	newTip.setText(text)
	await newTip.addAnimation()

func deleteTip(name: String) -> void:
	if tips[name.to_lower()] != null:
		await tips[name.to_lower()].deleteAnimation()
		tips[name.to_lower()].queue_free()
		tips[name.to_lower()] = null
