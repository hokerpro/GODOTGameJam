class_name NPC
extends Node2D

var onScreen : bool = false

@export var interactData : Resource
@export var areaSize : Vector2
@export var tipMessage : String
@export var autoactivation : bool

@onready var pet: NPC = $"."
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var areaCollision : CollisionShape2D = $Area2D/CollisionShape2D
@onready var animatedSprite : AnimatedSprite2D = $AnimatedSprite2D
@onready var marker_2d: Marker2D = %Marker2D

func _ready() -> void:
	areaCollision.shape.size = areaSize

func changeAnimation(newAnimation : String) -> void:
	if newAnimation != null:
		animatedSprite.animation = newAnimation

func getNPCPosition() -> Vector2:
	return pet.position

func getMarkerPosition() -> Vector2:
	return marker_2d.global_position

func _on_area_2d_body_entered(body: Node2D) -> void:
	body.get_parent().current_npc = self
	if autoactivation:
		Input.action_press("interact")
	else:
		TipsManager.addTip(self.name, tipMessage)

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.get_parent().current_npc == self:
		body.get_parent().current_npc = null
	if not autoactivation:
		TipsManager.deleteTip(self.name)

func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	onScreen = true

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	onScreen = false
