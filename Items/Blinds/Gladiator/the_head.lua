local the_head = {
	object_type = "Blind",
	key = "the_head_GL",
	boss = {
		min = 1,
		pstake_gladiator = true,
	},
	mult = 2,
	attributes = { "xscore", "hearts", "suit" },
	boss_colour = HEX("ac9db4"),
	pos = { x = 0, y = 21 },
	order = 8,
	dollars = 5,
	calculate = function(self, blind, context)
		local temp = G.GAME.blind and G.GAME.blind.disabled
		if temp then
			return
		end
		if context.pstake_before_after then
			local hearts = 0
			for _, card in ipairs(context.full_hand) do
				if card:is_suit("Hearts") then
					hearts = hearts + 1
				end
			end
			if hearts > 0 then
				G.GAME.pstake_score_reduction = (G.GAME.pstake_score_reduction or 1) * math.max(1 - 0.2 * hearts, 0)
				blind:wiggle()
				blind.triggered = true
			end
		end
	end,
}
return { name = { "Blinds" }, items = { the_head } }
