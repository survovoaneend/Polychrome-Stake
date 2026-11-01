local the_window = {
	object_type = "Blind",
	key = "the_window_GL",
	boss = {
		min = 1,
		pstake_gladiator = true,
	},
	mult = 2,
	attributes = { "xscore", "diamonds", "suit" },
	boss_colour = HEX("a9a295"),
	pos = { x = 0, y = 6 },
	order = 12,
	dollars = 5,
	calculate = function(self, blind, context)
		local temp = G.GAME.blind and G.GAME.blind.disabled
		if temp then
			return
		end
		if context.pstake_before_after then
			local diamonds = 0
			for _, card in ipairs(context.full_hand) do
				if card:is_suit("Diamonds") then
					diamonds = diamonds + 1
				end
			end
			if diamonds > 0 then
				G.GAME.pstake_score_reduction = (G.GAME.pstake_score_reduction or 1) * math.max(1 - 0.2 * diamonds, 0)
				blind:wiggle()
				blind.triggered = true
			end
		end
	end,
}
return { name = { "Blinds" }, items = { the_window } }
