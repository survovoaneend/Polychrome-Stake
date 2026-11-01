
function PolychromeStake.blindness_active()
	return G.GAME
			and G.GAME.pstake_poly_chips
			and (G.GAME.pstake_poly_chips["pstake_blindness"] or 0) > 0
		or false
end

-- The hidden blind UI greys out the boss colour on the blind's definition while it's hidden.
-- Put the real colours back when a run starts, in case a run ended while a boss was still hidden.
local function restore_boss_colours()
	for _, blind in pairs(G.P_BLINDS or {}) do
		if blind.pstake_old_boss_colour ~= nil then
			blind.boss_colour = blind.pstake_old_boss_colour
			blind.pstake_old_boss_colour = nil
		end
	end
end

local start_run_ref = Game.start_run
function Game:start_run(...)
	restore_boss_colours()
	return start_run_ref(self, ...)
end

-- UnBlind compatibility: only loaded when UnBlind is installed, and hooked once every mod has loaded
local inject_items_ref = SMODS.injectItems
function SMODS.injectItems(...)
	local ret = inject_items_ref(...)
	if not PolychromeStake.unblind_hooked and next(SMODS.find_mod("unBlindShopGUI")) then
		PolychromeStake.unblind_hooked = true
		assert(SMODS.load_file("compat/UnBlind.lua"))()
	end
	return ret
end
