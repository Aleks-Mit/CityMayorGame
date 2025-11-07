class_name RandomEvent
extends RefCounted

var _name: String
var _description: String

func _init(name: String, description: String):
	_name = name
	_description = description

func get_name() -> String: return _name
func get_description() -> String: return _description

func get_budget_impact() -> float: return 0.0
func get_happiness_impact() -> int: return 0
func get_safety_impact() -> int: return 0
