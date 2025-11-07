class_name IncreaseTaxesDecision
extends Decision

const GAIN: float = 8000.0

func _init():
	super("Didinti mokesčius", "Gauna: +%.0f€" % GAIN)

func get_budget_change() -> float: return GAIN
func get_happiness_change() -> int: return -10
