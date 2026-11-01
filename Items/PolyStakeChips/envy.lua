local envy = {
	object_loader = PolychromeStake,
	object_type = "PolyStakeChip",
	order = 13,
	key = "envy",
	pos = { x = 3, y = 1 },
	atlas = "chips_atlas",
	unlocked = false,
	point_requirement = 700,
	stack = 1,
	points = { 75 },
	apply = function(self, stack)
		G.GAME.modifiers.enable_pstake_introverted = true
	end,
}
return { name = { "PolyStakeChips" }, items = { envy } }
