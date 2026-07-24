extends Control
class_name QuestTable

@onready var v_box_container: VBoxContainer = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer

func addChild(child : QuestUI) -> void:
	print(v_box_container.get_parent().name)
	v_box_container.add_child(child)
