class_name FireEvent
extends RandomEvent

const DAMAGE: float = 5000.0

func _init():
	super("Gaisras!", "Miestas patyrė gaisrą. Nuostoliai: %.0f€" % DAMAGE)

func get_budget_impact() -> float: return -DAMAGE
func get_happiness_impact() -> int: return -10
func get_safety_impact() -> int: return -5
