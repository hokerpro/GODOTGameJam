class_name NPC
extends Node2D

@export var interactData : Resource
@export var areaSize : Vector2

@onready var areaCollision : CollisionShape2D = $Area2D/CollisionShape2D
@onready var animatedSprite : AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	areaCollision.shape.size = areaSize

func _process(delta: float) -> void:
	pass

func changeAnimation(newAnimation : String) -> void:
	if newAnimation != null:
		animatedSprite.animation = newAnimation

func _on_area_2d_body_entered(body: Node2D) -> void:
	body.get_parent().current_npc = self

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.get_parent().current_npc == self:
		body.get_parent().current_npc = null
