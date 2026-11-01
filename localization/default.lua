if next(SMODS.find_mod("allinjest")) then
	return {}
end
return {
	descriptions = {
		Blind = {
			bl_pstake_amber_acorn_GL = {
				name = "Amber Acorn",
				text = {
					"Shuffle all Jokers",
					"and played cards",
					"each hand played",
				},
			},
			bl_pstake_cerulean_bell_GL = {
				name = "Cerulean Bell",
				text = {
					"On Play or Discard,",
					"deselect 1 random card",
					"and select another in hand",
				},
			},
			bl_pstake_crimson_heart_GL = {
				name = "Crimson Heart",
				text = {
					"One additional Joker",
					"debuffed each hand",
				},
			},
			bl_pstake_the_arm_GL = {
				name = "The Arm",
				text = {
					"Decrease level of",
					"all poker hands",
					"each hand played",
				},
			},
			bl_pstake_the_club_GL = {
				name = "The Club",
				text = {
					"Reduce score by 20%",
					"per Club played",
				},
			},
			bl_pstake_the_fish_GL = {
				name = "The Fish",
				text = {
					"Cards drawn face down",
					"after each discard",
				},
			},
			bl_pstake_the_flint_GL = {
				name = "The Flint",
				text = {
					"Base chips are",
					"scored as level 0",
				},
			},
			bl_pstake_the_goad_GL = {
				name = "The Goad",
				text = {
					"Reduce score by 20%",
					"per Spade played",
				},
			},
			bl_pstake_the_head_GL = {
				name = "The Head",
				text = {
					"Reduce score by 20%",
					"per Heart played",
				},
			},
			bl_pstake_the_hook_GL = {
				name = "The Hook",
				text = {
					"Discard 1 random",
					"scoring card in",
					"each played hand",
				},
			},
			bl_pstake_the_manacle_GL = {
				name = "The Manacle",
				text = {
					"-1 Hand Size",
					"each hand played",
				},
			},
			bl_pstake_the_needle_GL = {
				name = "The Needle",
				text = {
					"Play only 1 hand",
				},
			},
			bl_pstake_the_ox_GL = {
				name = "The Ox",
				text = {
					"Set money to $0 if",
					"poker hand has been",
					"played 5 or more times",
				},
			},
			bl_pstake_the_plant_GL = {
				name = "The Plant",
				text = {
					"Reduce score by 20%",
					"per Face card played",
				},
			},
			bl_pstake_the_serpent_GL = {
				name = "The Serpent",
				text = {
					"After Play or Discard",
					"always draw a max of",
					"3 cards",
				},
			},
			bl_pstake_the_tooth_GL = {
				name = "The Tooth",
				text = {
					"Lose $1 per card",
					"drawn",
				},
			},
			bl_pstake_the_wall_GL = {
				name = "The Wall",
				text = {
					"Very large blind",
				},
			},
			bl_pstake_the_wheel_GL = {
				name = "The Wheel",
				text = {
					"#1# in #2# cards get",
					"drawn face down",
				},
			},
			bl_pstake_the_window_GL = {
				name = "The Window",
				text = {
					"Reduce score by 20%",
					"per Diamond played",
				},
			},
			bl_pstake_verdant_leaf_GL = {
				name = "Verdant Leaf",
				text = {
					"Reduce score each",
					"hand by 90% until",
					"1 Joker sold",
				},
			},
			bl_pstake_violet_vessel_GL = {
				name = "Violet Vessel",
				text = {
					"Massive blind",
				},
			},
		},
		Stake = {
			stake_pstake_polychrome = {
				name = "Polychrome Stake",
				text = {
					"{C:dark_edition}Customizable{} difficulty",
				},
			},
		},
		Other = {
			pstake_polychrome_sticker = {
				name = "Polychrome Sticker",
				text = {
					"Used this Joker",
					"to win with {C:attention}#1#{} Points",
					"on {C:attention}Polychrome Stake",
				},
			},
			pstake_mint_condition = {
				name = "Mint Condition",
				text = {
					"Costs an",
					"additional {C:money}$10",
				},
			},
			pstake_blank_playing_card = {
				text = {
					" Blank ",
				},
			},
			pstake_indecisive = {
				name = "Indecisive",
				text = {
					"{C:green}#1# in #2#{} chance",
					"to not score",
				},
			},
			pstake_introverted = {
				name = "Introverted",
				text = {
					"{C:red}Self-destructs{} if",
					"Blind is selected",
					"with full Joker slots",
				},
			},
			pstake_demanding = {
				name = "Demanding",
				text = {
					"Debuffed until a",
					"{C:attention}#1#{} is played",
					"each round",
				},
			},
			pstake_spade = {
				name = "Spade",
				text = {
					"Debuffed if a",
					"{C:spades}Spade{} is played",
					"this round",
				},
			},
			pstake_diamond = {
				name = "Diamond",
				text = {
					"Debuffed if a",
					"{C:diamonds}Diamond{} is played",
					"this round",
				},
			},
			pstake_heart = {
				name = "Heart",
				text = {
					"Debuffed if a",
					"{C:hearts}Heart{} is played",
					"this round",
				},
			},
			pstake_club = {
				name = "Club",
				text = {
					"Debuffed if a",
					"{C:clubs}Club{} is played",
					"this round",
				},
			},
			pstake_face = {
				name = "Face",
				text = {
					"Debuffed if a",
					"{C:attention}Face Card{} is",
					"played this round",
				},
			},
		},
		PolyStakeChips = {
			locked = {
				name = "Locked",
				text = {
					"Win a run with",
					"{C:attention}#1#+{} Points",
					"to unlock",
				},
			},
			pstake_up_the_ante = {
				name = "Up The Ante",
				text = {
					"Required score scales",
					"faster for each {C:attention}Ante",
				},
			},
			pstake_sloth = {
				name = "Sloth",
				text = {
					"{C:attention}30%{} chance for Jokers",
					"in shops or booster packs",
					"to have an {C:attention}Eternal{} sticker",
					"{C:inactive,s:0.8}(Can't be sold or destroyed)",
				},
			},
			pstake_gluttony = {
				name = "Gluttony",
				text = {
					"{C:attention}30%{} chance for Jokers",
					"in shops or booster packs",
					"to have a {C:attention}Perishable{} sticker",
					"{C:inactive,s:0.8}(Debuffed after 5 Rounds)",
				},
			},
			pstake_greed = {
				name = "Greed",
				text = {
					"{C:attention}30%{} chance for Jokers",
					"in shops or booster packs",
					"to have a {C:attention}Rental{} sticker",
					"{C:inactive,s:0.8}(Costs {C:money,s:0.8}$3{C:inactive,s:0.8} per round)",
				},
			},
			pstake_red_challenge = {
				name = "Red Challenge",
				text = {
					"{C:attention}Small Blind{} gives",
					"no reward money",
				},
			},
			pstake_broken_foot = {
				name = "Broken Foot",
				text = {
					"{C:red}-1{} Discard",
					"per round",
				},
			},
			pstake_broken_hand = {
				name = "Broken Hand",
				text = {
					"{C:red}-1{} Hand",
					"per round",
				},
			},
			pstake_pride = {
				name = "Pride",
				text = {
					"{C:attention}10%{} chance for Jokers",
					"in the {C:attention}shop{} to have a",
					"{C:attention}Mint Condition{} sticker",
					"{C:inactive,s:0.8}(Costs an additional {C:money,s:0.8}$10{C:inactive,s:0.8})",
				},
			},
			pstake_pricey_packs = {
				name = "Pricey Packs",
				text = {
					"Booster Packs cost",
					"{C:money}$1{} more per {C:attention}Ante",
				},
			},
			pstake_in_the_dark = {
				name = "In the Dark",
				text = {
					"{C:attention}1{} random card in",
					"each {C:attention}opening hand",
					"is drawn {C:attention}face down",
				},
			},
			pstake_chump_change = {
				name = "Chump Change",
				text = {
					"{C:attention}High Card{} and {C:attention}Pair",
					"gain {C:attention}5{} less {C:chips}Chips",
					"when upgraded",
				},
			},
			pstake_journey = {
				name = "Journey",
				text = {
					"{C:attention}+1{} Win Ante",
				},
			},
			pstake_envy = {
				name = "Envy",
				text = {
					"{C:attention}30%{} chance for Jokers",
					"in shops or booster packs",
					"to have an {C:attention}Introverted{} sticker",
					"{C:inactive,s:0.8}(Self-destructs when selecting",
					"{C:inactive,s:0.8}Blind with full Joker slots)",
				},
			},
			pstake_wrath = {
				name = "Wrath",
				text = {
					"{C:attention}30%{} chance for {C:attention}scoring{} Jokers",
					"in shops or booster packs",
					"to have an {C:attention}Indecisive{} sticker",
					"{C:inactive,s:0.8}({C:green,s:0.8}1 in 4{C:inactive,s:0.8} chance to not score)",
				},
			},
			pstake_blindness = {
				name = "Blindness",
				text = {
					"Cannot see {C:attention}Boss Blind{} or",
					"its effects until selected",
				},
			},
			pstake_lust = {
				name = "Lust",
				text = {
					"{C:attention}30%{} chance for Jokers",
					"in shops or booster packs",
					"to have a {C:attention}Demanding{} sticker",
					"{C:inactive,s:0.8}(Debuffed until a specific poker hand",
					"{C:inactive,s:0.8}is played each round)",
				},
			},
			pstake_double_threat = {
				name = "Double Threat",
				text = {
					"{C:attention}Big Blinds{} are replaced",
					"with {C:attention}Boss Blinds",
				},
			},
			pstake_vainglory = {
				name = "Vainglory",
				text = {
					"{C:attention}30%{} chance for Jokers",
					"in shops or booster packs",
					"to have a {C:attention}Suit{} or {C:attention}Face{} sticker",
					"{C:inactive,s:0.8}(Debuffed if the suit or a",
					"{C:inactive,s:0.8}face card is played that round)",
				},
			},
			pstake_deadwood = {
				name = "Deadwood",
				text = {
					"Start with {C:attention}6{} additional",
					"{C:attention}Blank{} cards in your deck",
				},
			},
			pstake_gladiator = {
				name = "Gladiator",
				text = {
					"{C:attention}Boss Blinds{} have",
					"tougher effects",
				},
			},
		},
	},
	misc = {
		dictionary = {
			k_pstake_points = "Points",
			pstake_gladiator_blinds = "Gladiator Blinds",
			k_pstake_destroyed_ex = "Destroyed!",
			k_pstake_total_points = "Current Total",
			k_pstake_pb = "Personal Best",
			k_pstake_all_time = "All Time",
			k_pstake_disable_all = "Disable All",
			run_select_pstake_polychrome_settings = "Customize",
		},
		v_dictionary = {
			a_pstake_points = "#1# Points",
			a_pstake_score_reduction = "-#1#% Score",
			a_pstake_applied_stake = "(Applied #1# times)",
		},
		labels = {
			pstake_indecisive = "Indecisive",
			pstake_mint_condition = "Mint Condition",
			pstake_introverted = "Introverted",
			pstake_demanding = "Demanding",
			pstake_spade = "Spade",
			pstake_diamond = "Diamond",
			pstake_heart = "Heart",
			pstake_club = "Club",
			pstake_face = "Face",
		}
	},
}
