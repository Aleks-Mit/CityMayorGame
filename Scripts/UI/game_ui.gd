class_name GameUI
extends Control

@onready var turn_label = $MarginContainer/VBoxContainer/StatusPanel/VBoxContainer/TurnLabel
@onready var population_label = $MarginContainer/VBoxContainer/StatusPanel/VBoxContainer/PopulationLabel
@onready var budget_label = $MarginContainer/VBoxContainer/StatusPanel/VBoxContainer/BudgetLabel
@onready var happiness_label = $MarginContainer/VBoxContainer/StatusPanel/VBoxContainer/HappinessLabel
@onready var safety_label = $MarginContainer/VBoxContainer/StatusPanel/VBoxContainer/SafetyLabel
@onready var environment_label = $MarginContainer/VBoxContainer/StatusPanel/VBoxContainer/EnvironmentLabel
@onready var event_label = $MarginContainer/VBoxContainer/EventLabel

@onready var button1 = $MarginContainer/VBoxContainer/DecisionsContainer/Button1
@onready var button2 = $MarginContainer/VBoxContainer/DecisionsContainer/Button2
@onready var button3 = $MarginContainer/VBoxContainer/DecisionsContainer/Button3
@onready var button4 = $MarginContainer/VBoxContainer/DecisionsContainer/Button4
@onready var reset_button = $MarginContainer/VBoxContainer/DecisionsContainer/ResetButton

signal decision_made(decision_type: int)
signal reset_game_requested

func _ready():
	button1.pressed.connect(_on_button1_pressed)
	button2.pressed.connect(_on_button2_pressed)
	button3.pressed.connect(_on_button3_pressed)
	button4.pressed.connect(_on_button4_pressed)
	reset_button.pressed.connect(_on_reset_pressed)
	
	_update_button_texts()

func _update_button_texts():
	var decisions = DecisionFactory.get_all_decisions()
	button1.text = "1. %s\n%s" % [decisions[0].get_name(), decisions[0].get_description()]
	button2.text = "2. %s\n%s" % [decisions[1].get_name(), decisions[1].get_description()]
	button3.text = "3. %s\n%s" % [decisions[2].get_name(), decisions[2].get_description()]
	button4.text = "4. %s\n%s" % [decisions[3].get_name(), decisions[3].get_description()]

func update_status(city_data: Dictionary):
	turn_label.text = "Turas: %d / %d" % [city_data.turn, 15]
	population_label.text = "👥 Gyventojai: %d" % city_data.population
	budget_label.text = "💰 Biudžetas: %.0f€" % city_data.budget
	happiness_label.text = "😊 Laimė: %d%%" % city_data.happiness
	safety_label.text = "🛡️ Saugumas: %d%%" % city_data.safety
	environment_label.text = "🌳 Aplinka: %d%%" % city_data.environment

func show_event(event_name: String, event_description: String):
	event_label.text = "🔥 %s\n%s" % [event_name, event_description]
	await get_tree().create_timer(3.0).timeout
	event_label.text = ""

func clear_event():
	event_label.text = ""

func disable_buttons():
	button1.disabled = true
	button2.disabled = true
	button3.disabled = true
	button4.disabled = true

func enable_buttons():
	button1.disabled = false
	button2.disabled = false
	button3.disabled = false
	button4.disabled = false

func show_game_over(won: bool, reason: String):
	disable_buttons()
	var message = "🎉 LAIMĖJOTE!\n%s" if won else "💀 PRALAIMĖJOTE!\n%s"
	event_label.text = message % reason

func _on_button1_pressed():
	decision_made.emit(DecisionFactory.DecisionType.BUILD_PARK)

func _on_button2_pressed():
	decision_made.emit(DecisionFactory.DecisionType.BUILD_POLICE)

func _on_button3_pressed():
	decision_made.emit(DecisionFactory.DecisionType.INCREASE_TAXES)

func _on_button4_pressed():
	decision_made.emit(DecisionFactory.DecisionType.DO_NOTHING)

func _on_reset_pressed():
	reset_game_requested.emit()
