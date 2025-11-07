class_name EventStrategy
extends RefCounted

func should_trigger_event(_turn: int) -> bool:
	return false

func create_event() -> RandomEvent:
	return null

class RandomEventStrategy extends EventStrategy:
	func should_trigger_event(_turn: int) -> bool:
		return randf() < 0.3  # 30% chance
	
	func create_event() -> RandomEvent:
		if randf() < 0.5:
			return FireEvent.new()
		else:
			return ProtestEvent.new()
