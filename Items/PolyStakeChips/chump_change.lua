local chump_change = {
	object_loader = PolychromeStake,
	object_type = "PolyStakeChip",
	order = 19,
	key = "chump_change",
	pos = { x = 8, y = 1 },
	atlas = "chips_atlas",
	unlocked = false,
	point_requirement = 1100,
	stack = 1,
	points = { 50 },
	apply = function(self, stack)
		G.GAME.hands["High Card"].l_chips = G.GAME.hands["High Card"].l_chips - 5
		G.GAME.hands["Pair"].l_chips = G.GAME.hands["Pair"].l_chips - 5
	end,
}
return { name = { "PolyStakeChips" }, items = { chump_change } }
