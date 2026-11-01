local the_club = {
	object_type = "Blind",
	key = "the_club_GL",
	boss = {
		min = 1,
		pstake_gladiator = true,
	},
	mult = 2,
	attributes = { "xscore", "clubs", "suit" },
	boss_colour = HEX("b9cb92"),
	pos = { x = 0, y = 4 },
	order = 10,
	dollars = 5,
	calculate = function(self, blind, context)
		if blind.disabled then
			return
		end
		if context.pstake_before_after then
			local clubs = 0
			for _, card in ipairs(context.full_hand) do
				if card:is_suit("Clubs") then
					clubs = clubs + 1
				end
			end
			if clubs > 0 then
				G.GAME.pstake_score_reduction = (G.GAME.pstake_score_reduction or 1) * math.max(1 - 0.2 * clubs, 0)
				blind:wiggle()
				blind.triggered = true
			end
		end
	end,
}
return { name = { "Blinds" }, items = { the_club } }
