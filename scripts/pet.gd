extends Node2D

@export var areaSize : Vector2

@onready var areaCollision : CollisionShape2D = $Area2D/CollisionShape2D

func _ready() -> void:
	areaCollision.shape.size = areaSize

func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body.name)


func _on_area_2d_body_exited(body: Node2D) -> void:
	print(body.name)
