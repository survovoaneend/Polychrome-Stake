local lust = {
	object_loader = PolychromeStake,
	object_type = "PolyStakeChip",
	order = 17,
	key = "lust",
	pos = { x = 4, y = 1 },
	atlas = "chips_atlas",
	unlocked = false,
	point_requirement = 1000,
	stack = 1,
	points = { 80 },
	apply = function(self, stack)
		G.GAME.modifiers.enable_pstake_demanding = true
	end,
}
return { name = { "PolyStakeChips" }, items = { lust } }
