function PolychromeStake.gladiator_active()
	return (G.GAME and G.GAME.pstake_poly_chips and (G.GAME.pstake_poly_chips["pstake_gladiator"] or 0) > 0)
		or false
end

function PolychromeStake.is_gladiator(blind)
	return (blind and blind.boss and blind.boss.pstake_gladiator) and true or false
end

G.FUNCS.pstake_gladiator_blinds = function(e)
	G.GAME.pstake_gladiator_tab = not G.GAME.pstake_gladiator_tab
	G.FUNCS.overlay_menu({
		definition = create_UIBox_your_collection_blinds(),
		config = { offset = { x = 0, y = 0 } },
	})
end

local set_discover_tallies_ref = set_discover_tallies
function set_discover_tallies()
	PolychromeStake.hide_gladiator_blinds = true
	for _, v in pairs(G.P_BLINDS) do
		if PolychromeStake.is_gladiator(v) and v.discovered then
			PolychromeStake.hide_gladiator_blinds = false
			break
		end
	end
	return set_discover_tallies_ref()
end

local hide_from_collection_ref = SMODS.hide_from_collection
function SMODS.hide_from_collection(obj, args)
	if PolychromeStake.hide_gladiator_blinds and PolychromeStake.is_gladiator(obj) then
		return true
	end
	return hide_from_collection_ref(obj, args)
end


local mod_calculate_ref = PolychromeStake.calculate
function PolychromeStake.calculate(self, context)
	if context.before then
		G.GAME.pstake_score_reduction = 1
		G.GAME.pstake_apply_score_reduction = false
	end
	if mod_calculate_ref then
		return mod_calculate_ref(self, context)
	end
end

local calculate_round_score_ref = SMODS.calculate_round_score
function SMODS.calculate_round_score(flames)
	local ret = calculate_round_score_ref(flames)
	if G.GAME and G.GAME.pstake_apply_score_reduction then
		return ret * (G.GAME.pstake_score_reduction or 1) + 0.5 -- +0.5 rounds the floored total correctly
	end
	return ret
end


local update_hand_text_ref = update_hand_text
function update_hand_text(config, vals)
	if
		G.GAME
		and G.GAME.pstake_apply_score_reduction
		and vals
		and vals.chip_total == math.floor(SMODS.calculate_round_score())
	then
		G.GAME.pstake_apply_score_reduction = false
		vals.chip_total = math.floor(SMODS.calculate_round_score())
		G.GAME.pstake_apply_score_reduction = true
	end
	return update_hand_text_ref(config, vals)
end
