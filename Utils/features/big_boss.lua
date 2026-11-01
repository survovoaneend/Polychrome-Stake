local get_new_blind_ref = SMODS.get_new_blind
function SMODS.get_new_blind(blind_type, ...)
	if blind_type == "big_boss" then
		blind_type = "boss"
	end
	return get_new_blind_ref(blind_type, ...)
end

function PolychromeStake.enable_big_boss()
	G.GAME.pstake_has_big_boss = true
	G.GAME.round_resets.blind_states.Big = "Hide"
	G.GAME.round_resets.blind_states.Big_Boss = "Upcoming"
	G.GAME.round_resets.blind_choices.Big_Boss = SMODS.get_new_blind("big_boss")
	-- Skipping the extra boss gives the Big Blind's tag (no extra tag roll, so the seed is unaffected)
	G.GAME.round_resets.blind_tags.Big_Boss = G.GAME.round_resets.blind_tags.Big
end
