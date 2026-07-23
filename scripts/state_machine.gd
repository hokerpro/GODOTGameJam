extends Node

@export var initial_state : State

var currentState : State
var states : Dictionary = {}

func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.Transitioned.connect(on_child_transitioned)
			
	if initial_state:
		initial_state.Enter()
		currentState = initial_state

func _process(delta: float) -> void:
	if currentState:
		currentState.Update(delta)

func _physics_process(delta: float) -> void:
	if currentState:
		currentState.Physics_Update(delta)

func on_child_transitioned(new_state_name : String) -> void:
	#if state == currentState:
		#return
	var newState = states[new_state_name.to_lower()]
	if !newState:
		return
	
	if currentState:
		currentState.Exit()
	newState.Enter()
	currentState = newState
