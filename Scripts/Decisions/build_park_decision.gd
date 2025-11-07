class_name BuildParkDecision
extends Decision

const COST: float = 10000.0

func _init():
	super("Statyti parką", "Kainuoja: %.0f€" % COST)

func get_budget_change() -> float: return -COST
func get_happiness_change() -> int: return 15
func get_environment_change() -> int: return 10
