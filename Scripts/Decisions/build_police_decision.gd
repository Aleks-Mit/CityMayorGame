class_name BuildPoliceDecision
extends Decision

const COST: float = 15000.0

func _init():
	super("Statyti policijos nuovadą", "Kainuoja: %.0f€" % COST)

func get_budget_change() -> float: return -COST
func get_happiness_change() -> int: return -5
func get_safety_change() -> int: return 20
