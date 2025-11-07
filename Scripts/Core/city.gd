class_name City
extends Node

var _population: int = 1000
var _budget: float = 50000.0
var _happiness: int = 70
var _safety: int = 60
var _environment: int = 50
var _turn: int = 0

const MAX_TURNS: int = 15
const MIN_HAPPINESS: int = 10
const MAINTENANCE_COST: float = 500.0

signal game_over(won: bool, reason: String)

func get_population() -> int: 
	return _population

func get_budget() -> float: 
	return _budget

func get_happiness() -> int: 
	return _happiness

func get_safety() -> int: 
	return _safety

func get_environment() -> int: 
	return _environment

func get_turn() -> int: 
	return _turn

func process_turn(decision: Decision) -> void:
	_turn += 1
	_budget += decision.get_budget_change()
	_happiness += decision.get_happiness_change()
	_safety += decision.get_safety_change()
	_environment += decision.get_environment_change()
	
	_happiness = clampi(_happiness, 0, 100)
	_safety = clampi(_safety, 0, 100)
	_environment = clampi(_environment, 0, 100)
	
	_budget -= MAINTENANCE_COST
	_happiness -= 1
	
	_check_game_over()

func _check_game_over() -> void:
	if _budget <= 0:
		game_over.emit(false, "Bankrutavote!")
	elif _happiness <= MIN_HAPPINESS:
		game_over.emit(false, "Gyventojai nepatenkinti!")
	elif _turn >= MAX_TURNS:
		game_over.emit(true, "Laimėjote! Valdėte %d turų." % MAX_TURNS)

func apply_random_event(event: RandomEvent) -> void:
	_budget += event.get_budget_impact()
	_happiness += event.get_happiness_impact()
	_safety += event.get_safety_impact()
	
	_happiness = clampi(_happiness, 0, 100)
	_safety = clampi(_safety, 0, 100)

func get_city_data() -> Dictionary:
	return {
		"population": _population,
		"budget": _budget,
		"happiness": _happiness,
		"safety": _safety,
		"environment": _environment,
		"turn": _turn
	}
