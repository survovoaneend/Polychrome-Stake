local atlases = {
	{
		key = "chips_atlas",
		path = "chips.png",
		px = 29,
		py = 29,
	},

	{
		key = "blank_card",
		path = "blank_card.png",
		px = 71,
		py = 95,
	},

	{
		key = "blind_drawn_replacement",
		path = "unknown_blind.png",
		px = 34,
		py = 34,
		frames = 21,
		atlas_table = "ANIMATION_ATLAS",
	},

	{
		key = "stickers_atlas",
		path = "stickers.png",
		px = 71,
		py = 95,
	},
}

for i = 1, #atlases do
	atlases[i].object_type = "Atlas"
end
return { name = { "Atlases" }, items = atlases }
