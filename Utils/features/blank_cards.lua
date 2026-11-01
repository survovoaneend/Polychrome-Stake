function PolychromeStake.is_blank(card)
	return card and card.ability and card.ability.pstake_deadwood_blank and true or false
end

local function fix_nominal(card)
	if PolychromeStake.is_blank(card) and card.base and (card.base.nominal or 0) > 0 then
		card.base.nominal = 1
	end
end

-- Turn a card blank (or back to normal with blank = false)
function PolychromeStake.set_blank(card, blank)
	if not (card and card.ability) then
		return
	end
	card.ability.pstake_deadwood_blank = blank and true or nil
	if blank then
		fix_nominal(card)
	elseif card.base and card.base.value and SMODS.Ranks[card.base.value] then
		card.base.nominal = SMODS.Ranks[card.base.value].nominal or card.base.nominal
	end
	if card.config and card.config.card and card.children and card.children.front then
		card:set_sprites(nil, card.config.card)
	end
end

-- being drawn and swap in the blank face for blank cards
local pstake_sprite_card = nil

local set_sprites_ref = Card.set_sprites
function Card:set_sprites(_center, _front)
	local prev = pstake_sprite_card
	pstake_sprite_card = self
	local ret = set_sprites_ref(self, _center, _front)
	pstake_sprite_card = prev
	return ret
end

local get_front_spriteinfo_ref = get_front_spriteinfo
function get_front_spriteinfo(_front, ...)
	if PolychromeStake.is_blank(pstake_sprite_card) and G.ASSET_ATLAS["pstake_blank_card"] then
		return G.ASSET_ATLAS["pstake_blank_card"], { x = 0, y = 0 }
	end
	return get_front_spriteinfo_ref(_front, ...)
end

local has_no_rank_ref = SMODS.has_no_rank
function SMODS.has_no_rank(card)
	if PolychromeStake.is_blank(card) then
		return true
	end
	return has_no_rank_ref(card)
end

local has_no_suit_ref = SMODS.has_no_suit
function SMODS.has_no_suit(card)
	if PolychromeStake.is_blank(card) and not SMODS.has_any_suit(card) then
		return true
	end
	return has_no_suit_ref(card)
end

local set_base_ref = Card.set_base
function Card:set_base(card, initial, manual_sprites, ...)
	local ret = set_base_ref(self, card, initial, manual_sprites, ...)
	fix_nominal(self)
	return ret
end

local load_ref = Card.load
function Card:load(cardTable, other_card, ...)
	local ret = load_ref(self, cardTable, other_card, ...)
	if PolychromeStake.is_blank(self) then
		fix_nominal(self)
		if self.config and self.config.card then
			self:set_sprites(nil, self.config.card)
		end
	end
	return ret
end

local copy_card_ref = copy_card
function copy_card(other, new_card, ...)
	local ret = copy_card_ref(other, new_card, ...)
	if ret and ret.ability and other and other.ability then
		local want = other.ability.pstake_deadwood_blank and true or nil
		if (ret.ability.pstake_deadwood_blank and true or nil) ~= want or want then
			ret.ability.pstake_deadwood_blank = want
			if not want then
				ret.base.nominal = other.base and other.base.nominal or ret.base.nominal
			end
			fix_nominal(ret)
			if ret.config and ret.config.card then
				ret:set_sprites(nil, ret.config.card)
			end
		end
	end
	return ret
end
