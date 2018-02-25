local tree={
	"dead-dry-hairy-tree",-- 2
	"dead-grey-trunk",    -- 2
	"dead-tree-desert",          -- 2 nadelig, unschön
	"dry-hairy-tree",     -- 2
	"dry-tree",           -- 4
--	"green-coral",        -- 1 ist halt ne koralle
	"tree-01",            -- 4
	"tree-02",            -- 4
	"tree-02-red",        -- 4
	"tree-03",            -- 4 sieht mau aus
	"tree-04",            -- 4
	"tree-05",            -- 4
	"tree-06",            -- 4 hat was runterhängen hier drunter auch
	"tree-06-brown",      -- 4
	"tree-07",            -- 4
	"tree-08",            -- 4
	"tree-08-brown",      -- 4
	"tree-08-red",        -- 4
	"tree-09",            -- 4 rot
	"tree-09-brown",      -- 4
	"tree-09-red"         -- 4 rot
}

script.on_event(defines.events.on_built_entity, function(event)
	if not event.stack or event.stack.name~="seedling" then
		return
	end
	
	pos=event.created_entity.position
	event.created_entity.destroy()
	
	game.surfaces.nauvis.create_entity({
		name=tree[math.floor(math.random()*21+1)], -- randomly from [1, 21]
		position=pos
	})
	
end)

local radius=100 -- size of starting circle
local tile = {} -- what each tile gets replaced with
--tile["concrete"]="water",
tile["deepwater"]="deepwater"
tile["deepwater-green"]="deepwater-green"
tile["dirt-1"]="water"
tile["dirt-2"]="water"
tile["dirt-3"]="water"
tile["dirt-4"]="water"
tile["dirt-5"]="water"
tile["dirt-6"]="water"
tile["dirt-7"]="water"
tile["dry-dirt"]="deepwater"
tile["grass-1"]="water"
tile["grass-2"]="water"
tile["grass-3"]="water"
tile["grass-4"]="water"
tile["hazard-concrete-left"]="water"
tile["hazard-concrete-right"]="water"
tile["lab-dark-1"]="water"
tile["lab-dark-2"]="water"
tile["out-of-map"]="water"
tile["red-desert-0"]="water"
tile["red-desert-1"]="water"
tile["red-desert-2"]="water"
tile["red-desert-3"]="water"
tile["sand-1"]="water"
tile["sand-2"]="water"
tile["sand-3"]="water"
tile["stone-path"]="water"
tile["water"]="water"
tile["water-green"]="water"


-- inspired by "Water World", "author": "FuzzCat927"
script.on_event(defines.events.on_chunk_generated, function(event)

    area=event.area
    surface=event.surface
	--local contains_0 = false
    local tiles={}
	--game.print(tprint(event.area))
	if area.left_top.x==0 and area.left_top.y==0 then
		local chest = surface.create_entity({name = "wooden-chest", position={0,0}, force = game.forces.neutral})
		chest.insert{name="seedling", count=1}
		chest.insert{name="offshore-pump", count = 1}
		chest.insert{name="assembling-machine-2", count=1}
		chest.insert{name="landfill", count=42}
		chest.insert{name="small-electric-pole", count=1}
		chest.insert{name="solar-panel", count=1}
		chest.insert{name="storage-tank", count=1}
	end
	
	for x=area.left_top.x, area.right_bottom.x do
		for y=area.left_top.y, area.right_bottom.y do
			if x*x+y*y<radius then
				for _, entity in ipairs(game.surfaces[1].find_entities_filtered{area = {{-40, -40}, {40, 40}}, type= "resource"}) do -- gets all resources in the rectangle
					entity.destroy() --delete all ores
				end
				for _, entity in ipairs(game.surfaces[1].find_entities_filtered{area = {{-40, -40}, {40, 40}}, type= "tree"}) do -- gets all resources in the rectangle
					entity.destroy() --delete all trees
				end
				table.insert(tiles, {name="grass-1", position={x, y}})
			else
				--table.insert(tiles, {name=tile[surface.get_tile(x,y).name], position={x, y}})
				table.insert(tiles, {name="water", position={x, y}})
			end
		end
	end

	--surface.set_tiles(tiles, contains_0)
	surface.set_tiles(tiles)
end)

script.on_event(defines.events.on_player_created, function(event)
	player = game.players[event.player_index]
	player.clear_items_inside()
	player.insert{name="steel-axe", count=1, durability=100}
	player.force.set_spawn_position({x=10,y=1}, player.surface) 
end)

-- spawn all trees:
--/c tree={"dead-dry-hairy-tree", "dead-grey-trunk", "dead-tree", "dry-hairy-tree", "dry-tree", "green-coral", "tree-01", "tree-02", "tree-02-red", "tree-03", "tree-04", "tree-05", "tree-06", "tree-06-brown", "tree-07", "tree-08", "tree-08-brown", "tree-08-red", "tree-09", "tree-09-brown", "tree-09-red"}pos=game.player.position for i=1, 22 do game.surfaces.nauvis.create_entity({name=tree[i], position={pos.x+2*i, pos.y}})end


-- taken from: https://stackoverflow.com/questions/41942289/display-contents-of-tables-in-lua
-- useful for debugging
function tprint (tbl, indent)
	if not indent then indent = 0 end
	local toprint = string.rep(" ", indent) .. "{\r\n"
	indent = 0--indent + 2 
	for k, v in pairs(tbl) do
		toprint = toprint .. string.rep(" ", indent)
		if (type(k) == "number") then
			toprint = toprint .. "[" .. k .. "] = "
		elseif (type(k) == "string") then
			toprint = toprint	.. k ..	"= "	 
		end
		if (type(v) == "number") then
			toprint = toprint .. v .. ", \r\n"
		elseif (type(v) == "string") then
			toprint = toprint .. "\"" .. v .. "\", \r\n"
		elseif (type(v) == "table") then
			toprint = toprint .. tprint(v, indent + 2) .. ", \r\n"
		else
			toprint = toprint .. "\"" .. tostring(v) .. "\", \r\n"
		end
	end
	toprint = toprint .. string.rep(" ", indent-2) .. "}"
	return toprint
end
