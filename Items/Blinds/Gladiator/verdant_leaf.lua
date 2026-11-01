local verdant_leaf = {
	object_type = "Blind",
	key = "verdant_leaf_GL",
	boss = {
		showdown = true,
		pstake_gladiator = true,
	},
	mult = 2,
	attributes = { "xscore", "joker" },
	boss_colour = HEX("56a786"),
	pos = { x = 0, y = 28 },
	order = 52,
	dollars = 8,

	calculate = function(self, blind, context)
		if blind.disabled then
			return
		end

		if context.pstake_before_after then
			G.GAME.pstake_score_reduction = (G.GAME.pstake_score_reduction or 1) * 0.1
			blind:wiggle()
			blind.triggered = true
		end

		if context.selling_card and context.card.ability.set == "Joker" then
			G.E_MANAGER:add_event(Event({
				trigger = "immediate",
				func = function()
					blind:disable()
					return true
				end,
			}))
		end
	end,
}
return { name = { "Finisher Blinds" }, items = { verdant_leaf } }
