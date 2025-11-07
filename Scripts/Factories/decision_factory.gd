class_name DecisionFactory
extends RefCounted

enum DecisionType {
	BUILD_PARK,
	BUILD_POLICE,
	INCREASE_TAXES,
	DO_NOTHING
}

static func create_decision(type: DecisionType) -> Decision:
	match type:
		DecisionType.BUILD_PARK:
			return BuildParkDecision.new()
		DecisionType.BUILD_POLICE:
			return BuildPoliceDecision.new()
		DecisionType.INCREASE_TAXES:
			return IncreaseTaxesDecision.new()
		DecisionType.DO_NOTHING:
			return DoNothingDecision.new()
		_:
			return DoNothingDecision.new()

static func get_all_decisions() -> Array[Decision]:
	var decisions: Array[Decision] = []
	decisions.append(create_decision(DecisionType.BUILD_PARK))
	decisions.append(create_decision(DecisionType.BUILD_POLICE))
	decisions.append(create_decision(DecisionType.INCREASE_TAXES))
	decisions.append(create_decision(DecisionType.DO_NOTHING))
	return decisions
