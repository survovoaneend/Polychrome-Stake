-- All in Jest + Polychrome stake is redundant, so don't load poly stake if aij is present
if next(SMODS.find_mod("allinjest")) then
	sendInfoMessage(
		"All in Jest is enabled and already includes Polychrome Stake; Polychrome Stake will not load.",
		"Polychrome Stake"
	)
	return
end

PolychromeStake = SMODS.current_mod

PolychromeStake.active = true
local mod_path = "" .. SMODS.current_mod.path

local function collect_item_files(base_fs, rel, out)
	for _, name in ipairs(NFS.getDirectoryItems(base_fs)) do
		local abs = base_fs .. "/" .. name
		local info = NFS.getInfo(abs)
		if info and info.type == "directory" then
			collect_item_files(abs, rel .. "/" .. name, out)
		elseif info and info.type == "file" and name:match("%.lua$") then
			table.insert(out, rel .. "/" .. name)
		end
	end
end

-- Load util files
local util_fils = {}
collect_item_files(mod_path .. "Utils", "Utils", util_fils)

for _, rel in ipairs(util_fils) do
	assert(SMODS.load_file(rel))()
end

local function load_items(curr_obj)
	if curr_obj.init then
		curr_obj:init()
	end
	if not curr_obj.items then
		print("Warning: curr_obj has no items")
		return
	end
	for _, item in ipairs(curr_obj.items) do
		item.ignore = item.ignore or false
		if SMODS[item.object_type] and not item.ignore then
			SMODS[item.object_type](item)
		elseif item.object_loader and not item.ignore then
			if item.object_loader == "Global" then -- Just for Malverk atm
				item.object_type(item)
			else
				item.object_loader[item.object_type](item)
			end
		elseif not item.ignore then
			print("Error loading item " .. item.key .. " of unknown type " .. item.object_type)
		end
	end
end

-- Collect item files
local files = {}
collect_item_files(mod_path .. "Items", "Items", files)
local objects = {}
for _, rel in ipairs(files) do
	local f, err = SMODS.load_file(rel)
	if not f then
		print("Error loading item file '" .. rel .. "': " .. tostring(err))
	else
		local ok, curr_obj = pcall(f)
		if ok then
			table.insert(objects, curr_obj)
		else
			print("Error running item file '" .. rel .. "': " .. tostring(curr_obj))
		end
	end
end

-- Sort loaded objects by defined order
table.sort(objects, function(a, b)
	local function get_lowest_order(obj)
		if not obj.items then
			return math.huge
		end
		local lowest = math.huge
		for _, item in ipairs(obj.items) do
			if item.order and item.order < lowest then
				lowest = item.order
			end
		end
		return lowest
	end
	return get_lowest_order(a) < get_lowest_order(b)
end)

-- Load all the items
for _, curr_obj in ipairs(objects) do
	load_items(curr_obj)
end
