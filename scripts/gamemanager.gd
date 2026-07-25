extends Node2D

const QUEST_2 := preload("uid://cpnuw7xy130y4")
const QUEST_1 := preload("uid://cwtm6dvf6fxjr")
var player: Node2D = get_node_or_null("%Player")
@onready var seahorseAnim: AnimationPlayer = get_node_or_null("%Horsy")

@export var pet: NPC

func _ready() -> void:
	process_mode = $".".PROCESS_MODE_ALWAYS
	updateLinks()
	y_sort_enabled = true
	get_tree().debug_collisions_hint = true
	TransitionSystem.transition.connect(sceneChanged)

func sceneChanged() -> void:
	print("SCENE")
	QuestSystem.clearAllQuests()
	updateLinks()

func updateLinks() -> void:
	player = get_node_or_null("%Player")
	seahorseAnim = get_node_or_null("%Horsy")
	if seahorseAnim != null:
		StorySystem.seahorseAnim = seahorseAnim
	if player != null:
		QuestSystem.player = player
		QuestSystem.playerInitialPosition = player.getCharacterPosition().x

func _physics_process(delta: float) -> void:
	if pet != null:
		if player == null or seahorseAnim == null:
			return
		if seahorseAnim.is_playing():
			print("ADSDASDDSA")
			player.setCameraOffset(Vector2(0, 150))
			return
		if pet.onScreen and player.playerState == "idle":
			player.setCameraFocusVector(pet.getMarkerPosition())
		elif not pet.onScreen and player.playerState == "idle":
			player.resetCameraOffset()

func _on_area_2d_body_entered(body: Node2D) -> void:
	player.setCharacterPosition(Vector2(-635.0, 40.0 ))
	player.setCameraPosition(Vector2(-635.0, 40.0 ))
