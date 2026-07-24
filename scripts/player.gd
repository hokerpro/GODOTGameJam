extends Node2D
class_name Player

var current_npc : Node2D = null
@onready var character_body_2d: CharacterBody2D = $CharacterBody2D


func getCharacterPosition() -> Vector2:
	return character_body_2d.position
