
PolychromeStake.UnBlind_current_blinds_ref = G.UIDEF.UnBlind_current_blinds
function G.UIDEF.UnBlind_current_blinds() 
	local ret = PolychromeStake.UnBlind_current_blinds_ref()
	local pstake_blindness = PolychromeStake.blindness_active()
	if pstake_blindness and (ret.nodes and ret.nodes[1] and ret.nodes[1].nodes and ret.nodes[1].nodes[3]) then
		ret.nodes[1].nodes[3] = G.GAME.round_resets.blind_states["Boss"] ~= "Hide"
				and UnBlind_create_UIBox_blind("pstake_Hidden")
			or nil
	end
	return ret
end

PolychromeStake.UnBlind_create_UIBox_blind_ref = UnBlind_create_UIBox_blind
function UnBlind_create_UIBox_blind(type) 
	if type == "pstake_Hidden" then
		local hidden_blind_animation =
			SMODS.create_sprite(0, 0, 0.75, 0.75, "pstake_blind_drawn_replacement", { x = 0, y = 0 })
		hidden_blind_animation:define_draw_steps({
			{ shader = "dissolve", shadow_height = 0.05 },
			{ shader = "dissolve" },
		})
		hidden_blind_animation.float = true
		hidden_blind_animation.states.hover.can = true
		hidden_blind_animation.states.drag.can = false
		hidden_blind_animation.states.collide.can = true
		hidden_blind_animation.config = { force_focus = true }
		local stake_sprite = get_stake_sprite(G.GAME.stake or 1, 0.5)

		local t = --mix_colours(G.C.BLACK, G.C.L_BLACK, 0.5)		--G.C.DYN_UI.MAIN (red)		--G.C.DYN_UI.DARK (very similar to boss_main)		--black is too close to boss_main			--l_dark is too light
			{
				n = G.UIT.R,
				config = {
					align = "cm",
					colour = G.C.DYN_UI.BOSS_DARK,
					r = 0.1,
					outline = 1,
					outline_colour = G.C.DYN_UI.BOSS_MAIN,
				},
				nodes = {
					{
						n = G.UIT.R,
						config = { align = "cm", padding = 0.09 },
						nodes = {
							{
								n = G.UIT.C,
								config = { id = "blind_extras", align = "cl" },
								nodes = {
									{
										n = G.UIT.R,
										config = { id = "tag_container", align = "cm" },
										nodes = {
											{
												n = G.UIT.R,
												config = {
													id = "empty_tag_replacement",
													align = "cm",
													r = 0.1,
													padding = 0.05,
													can_collide = true,
												},
												nodes = {
													{
														n = G.UIT.B,
														config = { id = "tag_desc", align = "cm", w = 0.75, h = 0.1 },
														nodes = {},
													},
												},
											},
										},
									},
								},
							},
							--blind tag and desc container
							{
								n = G.UIT.C,
								config = { align = "cl", padding = 0 },
								nodes = {
									{
										n = G.UIT.C,
										config = { id = "blind_desc", align = "cm", padding = 0.05 },
										nodes = {
											--blind tag pos + boss desc
											--BLIND CHIP animation here btw ♥
											{
												n = G.UIT.O,
												config = { object = hidden_blind_animation, focus_with_object = true },
											},
										},
									},
								},
							},
							--select blind container
							{
								n = G.UIT.C,
								config = { align = "cl", padding = 0.05 },
								nodes = {
									--select blind "button" (defeated or upcoming)
									{
										n = G.UIT.C,
										config = {
											id = "select_blind_button",
											align = "cm",
											ref_table = {},
											colour = G.C.UI.TEXT_INACTIVE,
											minh = 0.75,
											minw = 0.3,
											padding = 0.0,
											r = 3,
											emboss = 0.08,
										},
										nodes = {
											--min score
											{
												n = G.UIT.R,
												config = { align = "cm", minw = 2.5 },
												nodes = {
													--"reward: ???
													{
														n = G.UIT.C,
														config = { align = "cm" },
														nodes = {
															{
																n = G.UIT.T,
																config = {
																	text = "???",
																	scale = 0.32,
																	colour = G.C.WHITE,
																	shadow = true,
																},
															},
														},
													},
													{ n = G.UIT.B, config = { w = 0.1, h = 0.1 } },
													--"? ???"
													{
														n = G.UIT.C,
														config = { align = "cm", minh = 0.4 },
														nodes = {
															{
																n = G.UIT.O,
																config = {
																	w = 0.3,
																	h = 0.3,
																	colour = G.C.BLUE,
																	object = stake_sprite,
																	hover = true,
																	can_collide = false,
																},
															},
															{ n = G.UIT.B, config = { h = 0.1, w = 0.05 } },
															{
																n = G.UIT.T,
																config = {
																	text = "???",
																	scale = 0.47 * 0.45,
																	colour = G.C.WHITE,
																	shadow = true,
																},
															},
														},
													},
												},
											},
										},
									},
								},
							},
						},
					},
				},
			}
		return t
	else
		return PolychromeStake.UnBlind_create_UIBox_blind_ref(type)
	end
end
