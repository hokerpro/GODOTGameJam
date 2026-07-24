extends Node2D
class_name Player

var current_npc : Node2D = null

@onready var character_body_2d: CharacterBody2D = $CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $CharacterBody2D/AnimatedSprite2D

func flipSprite(flip : bool) -> void:
	animated_sprite_2d.flip_h = flip

func changePlayerAnimation(newAnimation : String, nextAnimation : String = "") -> void:
	if newAnimation != null:
		animated_sprite_2d.play(newAnimation)
	if nextAnimation != "":
		await animated_sprite_2d.animation_finished
		animated_sprite_2d.play(nextAnimation)


func walkTo(newPosition : Vector2, time : float) -> void:
	var tween := create_tween()
	tween.tween_property(character_body_2d, "global_position", newPosition, time)
	tween.play()
	await tween.finished

func getCharacterPosition() -> Vector2:
	return character_body_2d.global_position
