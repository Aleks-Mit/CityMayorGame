class_name GameManager
extends Node

var city: City
var event_strategy: EventStrategy
var is_game_over: bool = false
var ui: GameUI

func _ready():
	# Create city
	city = City.new()
	add_child(city)
	city.game_over.connect(_on_game_over)
	
	# Create event strategy
	event_strategy = EventStrategy.RandomEventStrategy.new()
	
	# Load and add UI
	var ui_scene = preload("res://scenes/game_ui.tscn")
	ui = ui_scene.instantiate()
	add_child(ui)
	ui.decision_made.connect(_on_decision_made)
	ui.reset_game_requested.connect(_on_reset_requested)
	
	# Initial update
	_update_ui()

func _on_decision_made(decision_type: int):
	if is_game_over:
		return
	
	var decision = DecisionFactory.create_decision(decision_type)
	_process_turn(decision)

func _process_turn(decision: Decision):
	ui.disable_buttons()
	ui.clear_event()
	
	city.process_turn(decision)
	
	# Check for random events
	if event_strategy.should_trigger_event(city.get_turn()):
		var random_event = event_strategy.create_event()
		await ui.show_event(random_event.get_name(), random_event.get_description())
		city.apply_random_event(random_event)
	
	_update_ui()
	
	if not is_game_over:
		ui.enable_buttons()

func _update_ui():
	ui.update_status(city.get_city_data())

func _on_game_over(won: bool, reason: String):
	is_game_over = true
	ui.show_game_over(won, reason)

func _on_reset_requested():
	# Remove old city
	city.queue_free()
	
	# Create new city
	city = City.new()
	add_child(city)
	city.game_over.connect(_on_game_over)
	
	# Reset game state
	is_game_over = false
	
	# Update UI
	ui.clear_event()
	ui.enable_buttons()
	_update_ui()
