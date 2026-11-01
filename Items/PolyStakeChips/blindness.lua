local blindness = {
	object_loader = PolychromeStake,
	object_type = "PolyStakeChip",
	order = 16,
	key = "blindness",
	pos = { x = 9, y = 1 },
	atlas = "chips_atlas",
	unlocked = false,
	point_requirement = 1000,
	stack = 1,
	points = { 200 },
}
return { name = { "PolyStakeChips" }, items = { blindness } }
