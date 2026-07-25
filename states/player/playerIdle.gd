extends State
class_name playerIdle

const SPEED = 300.0

@export var player : Player
@onready var character : CharacterBody2D = player.get_node("CharacterBody2D")
@onready var animationSprite : AnimatedSprite2D = character.get_node("AnimatedSprite2D")

func transitionToInteract(resource : DialogueResource):
	player.setPlayerMovementAnimation("idle")
	Transitioned.emit("playerInteract")

func Enter() -> void:
	player.playerState = "idle"
	if not DialogueManager.dialogue_started.is_connected(transitionToInteract):
		DialogueManager.dialogue_started.connect(transitionToInteract, CONNECT_ONE_SHOT)

func updateAnimation() -> void:
	if abs(character.velocity.length()) > 0.5:
		if character.velocity.x > 0.25:
			player.flipSprite(false)
		elif character.velocity.x < 0.25:
			player.flipSprite(true)
		player.setPlayerMovementAnimation("move")
	else:
		player.setPlayerMovementAnimation("idle")

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
	player.setCameraPositionBetweenPlayerAndVector()
