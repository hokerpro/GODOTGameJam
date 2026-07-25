extends Node2D
class_name Player

var current_npc : Node2D = null
var playerState : String = "idle"
@export var cameraLimitTop : int = -10000000
@export var cameraLimitBottom : int = -10000000
@export var playerIdleAnimation : String = "player_idle"
@export var playerMoveAnimation : String = "player_move"

@onready var camera_2d: Camera2D = $CharacterBody2D/Camera2D
@onready var character_body_2d: CharacterBody2D = $CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $CharacterBody2D/AnimatedSprite2D

var cameraFocusVector

func _ready() -> void:
	setCameraLimits()

func flipSprite(flip : bool) -> void:
	animated_sprite_2d.flip_h = flip

func setCameraLimits() -> void:
	camera_2d.limit_top = cameraLimitTop
	camera_2d.limit_bottom = cameraLimitBottom

func setPlayerMovementAnimation(animation : String) -> void:
	if animation == "idle":
		animated_sprite_2d.play(playerIdleAnimation)
	elif animation == "move":
		animated_sprite_2d.play(playerMoveAnimation)

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

func setCharacterPosition(vector : Vector2) -> void:
	character_body_2d.global_position = vector

func getCameraPosition() -> Vector2:
	return camera_2d.global_position

func setCameraPosition(vector : Vector2) -> void:
	camera_2d.global_position = vector

func setCameraOffset(vector : Vector2) -> void:
	camera_2d.offset = vector

func setCameraFocusVector(vector : Vector2) -> void:
	cameraFocusVector = vector

func setCameraPositionBetweenPlayerAndVector() -> void:
	if cameraFocusVector == null:
		return
	
	var characterGlobalPosition = character_body_2d.global_position
	var centralX = (characterGlobalPosition.x + cameraFocusVector.x)/2
	if abs(camera_2d.position.x - (centralX - characterGlobalPosition.x)) > 150:
		var tween := create_tween()
		tween.tween_property(camera_2d, "position:x", centralX - characterGlobalPosition.x, 1)
		tween.play()
		await tween.finished
	else: 
		camera_2d.position.x = centralX - characterGlobalPosition.x

func resetCameraOffset() -> void:
	cameraFocusVector = null
	camera_2d.position.x = 0
