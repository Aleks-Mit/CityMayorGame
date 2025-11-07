class_name ProtestEvent
extends RandomEvent

func _init():
	super("Protestas!", "Gyventojai protestuoja.")

func get_happiness_impact() -> int: return -15
func get_safety_impact() -> int: return -10
