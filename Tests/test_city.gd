extends GutTest

func test_city_starts_with_correct_values():
	var city = City.new()
	assert_eq(city.get_population(), 1000)
	assert_eq(city.get_budget(), 50000.0)
	assert_eq(city.get_happiness(), 70)

func test_process_turn_applies_decision():
	var city = City.new()
	var decision = BuildParkDecision.new()
	city.process_turn(decision)
	assert_eq(city.get_budget(), 50000.0 - 10000.0 - 500.0)

func test_game_over_when_budget_zero():
	var city = City.new()
	watch_signals(city)
	city._budget = 100.0
	city.process_turn(DoNothingDecision.new())
	assert_signal_emitted(city, "game_over")

func test_decision_factory_creates_correct_types():
	var decision = DecisionFactory.create_decision(DecisionFactory.DecisionType.BUILD_PARK)
	assert_true(decision is BuildParkDecision)

func test_fire_event_reduces_budget():
	var event = FireEvent.new()
	assert_eq(event.get_budget_impact(), -5000.0)

func test_happiness_clamped_to_100():
	var city = City.new()
	city._happiness = 95
	city.process_turn(BuildParkDecision.new())
	assert_true(city.get_happiness() <= 100)
