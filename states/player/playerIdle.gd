extends State
class_name playerIdle

const SPEED = 300.0

@export var player : Node2D
@onready var character : CharacterBody2D = player.get_node("CharacterBody2D")
@onready var animationSprite : AnimatedSprite2D = character.get_node("AnimatedSprite2D")

func transitionToInteract(resource : DialogueResource):
	animationSprite.animation = "player_idle"
	Transitioned.emit("playerInteract")

func Enter() -> void:
	if not DialogueManager.dialogue_started.is_connected(transitionToInteract):
		DialogueManager.dialogue_started.connect(transitionToInteract, CONNECT_ONE_SHOT)

func updateAnimation() -> void:
	if abs(character.velocity.length()) > 0.5:
		if character.velocity.x > 0.25:
			animationSprite.flip_h = false
		elif character.velocity.x < 0.25:
			animationSprite.flip_h = true
		animationSprite.animation = "player_move"
	else:
		animationSprite.animation = "player_idle"

func Update(delta: float) -> void:
	updateAnimation()
	if Input.is_action_just_pressed("interact"):
		if player.current_npc != null:
			player.current_npc.interactData.interact(player, player.current_npc)

func Physics_Update(delta: float) -> void:
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if direction != Vector2.ZERO:
		character.velocity = direction * SPEED
	else:
		character.velocity = character.velocity.move_toward(Vector2.ZERO, SPEED * 0.2)
	character.move_and_slide()
