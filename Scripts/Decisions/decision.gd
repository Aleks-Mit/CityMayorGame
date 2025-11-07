class_name Decision
extends RefCounted

var _name: String
var _description: String

func _init(name: String, description: String):
	_name = name
	_description = description

func get_name() -> String: return _name
func get_description() -> String: return _description

# Abstract methods
func get_budget_change() -> float: return 0.0
func get_happiness_change() -> int: return 0
func get_safety_change() -> int: return 0
func get_environment_change() -> int: return 0
