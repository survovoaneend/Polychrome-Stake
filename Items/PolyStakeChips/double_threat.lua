local double_threat = {
	object_loader = PolychromeStake,
	object_type = "PolyStakeChip",
	order = 18,
	key = "double_threat",
	pos = { x = 1, y = 1 },
	atlas = "chips_atlas",
	unlocked = false,
	point_requirement = 1100,
	stack = 1,
	points = { 300 },
	apply = function(self, stack)
		PolychromeStake.enable_big_boss()
	end,
}
return { name = { "PolyStakeChips" }, items = { double_threat } }
