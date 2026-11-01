local cerulean_bell = {
	object_type = "Blind",
	key = "cerulean_bell_GL",
	boss = {
		showdown = true,
		pstake_gladiator = true,
	},
	mult = 2,
	boss_colour = HEX("009cfd"),
	pos = { x = 0, y = 26 },
	order = 55,
	dollars = 8,

	calculate = function(self, blind, context)
		if context.after then
			blind.pstake_discarded_card = nil
			for _, v in ipairs(G.playing_cards) do
				v.ability.pstake_bell_dont_add = nil
			end
		end
	end,
}
local play_cards_ref = G.FUNCS.play_cards_from_highlighted
function G.FUNCS.play_cards_from_highlighted(e)
	if G.GAME.blind and G.GAME.blind.config.blind.key == "bl_pstake_cerulean_bell_GL" and not G.GAME.blind.disabled then
		local removed = G.hand.highlighted[pseudorandom("bell_GL", 1, #G.hand.highlighted)]
		G.GAME.blind.pstake_discarded_card = removed
		G.hand:remove_from_highlighted(removed)
		local unselected = {}
		for _, v in ipairs(G.hand.cards) do
			local is_selected = false
			for _, highlighted in ipairs(G.hand.highlighted) do
				if v == highlighted then
					is_selected = true
					break
				end
			end
			if not is_selected then
				unselected[#unselected + 1] = v
			end
		end
		local new_selected = pseudorandom_element(unselected, pseudoseed("bell_GL_new"))
		if new_selected then -- nil when every card in hand was selected
			new_selected.ability.pstake_bell_dont_add = true
			G.hand:add_to_highlighted(new_selected)
		end
	end
	play_cards_ref(e)
end
local discard_cards_ref = G.FUNCS.discard_cards_from_highlighted
function G.FUNCS.discard_cards_from_highlighted(e, hook)
	if G.GAME.blind and G.GAME.blind.config.blind.key == "bl_pstake_cerulean_bell_GL" and not G.GAME.blind.disabled then
		local removed = G.hand.highlighted[pseudorandom("bell_GL", 1, #G.hand.highlighted)]
		G.hand:remove_from_highlighted(removed)
		local unselected = {}
		for _, v in ipairs(G.hand.cards) do
			local is_selected = false
			for _, highlighted in ipairs(G.hand.highlighted) do
				if v == highlighted then
					is_selected = true
					break
				end
			end
			if not is_selected then
				unselected[#unselected + 1] = v
			end
		end
		local new_selected = pseudorandom_element(unselected, pseudoseed("bell_GL_new"))
		if new_selected then -- nil when every card in hand was selected
			G.hand:add_to_highlighted(new_selected)
		end
	end
	discard_cards_ref(e, hook)
end
return { name = { "Blinds" }, items = { cerulean_bell } }
