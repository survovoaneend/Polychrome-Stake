local the_plant = {
	object_type = "Blind",
	key = "the_plant_GL",
	boss = {
		min = 4,
		pstake_gladiator = true,
	},
	mult = 2,
	attributes = { "xscore", "face" },
	boss_colour = HEX("709284"),
	pos = { x = 0, y = 19 },
	order = 14,
	dollars = 5,
	calculate = function(self, blind, context)
		local temp = G.GAME.blind and G.GAME.blind.disabled
		if temp then
			return
		end
		if context.pstake_before_after then
			local faces = 0
			for _, card in ipairs(context.full_hand) do
				if card:is_face() then
					faces = faces + 1
				end
			end
			if faces > 0 then
				G.GAME.pstake_score_reduction = (G.GAME.pstake_score_reduction or 1) * math.max(1 - 0.2 * faces, 0)
				blind:wiggle()
				blind.triggered = true
			end
		end
	end,
}
return { name = { "Blinds" }, items = { the_plant } }
