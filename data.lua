data:extend{
	{
		type="tree",
		name="sprout",
		flags={"placeable-neutral","player-creation","placeable-off-grid"},
		icon="__island_spawn__/seedling.png",
		icon_size=32,
		pictures={sheet={
			filename="__island_spawn__/sprout.png",
			frame_count=1,
			width=39,
			height=64,
			variation_count=1
		}},
		collision_box = {{-1, -1}, {1, 1}},
		order=" "
	},
	{
		type="item",
		name="seedling",
		icon="__island_spawn__/seedling.png",
		icon_size=32,
		flags={"goes-to-quickbar"},
		subgroup="sludge-recipe",
		order=" ",
		place_result="sprout",
		stack_size=10
	},
	{
		type="recipe",
		name="seedling-from-wood",
		category='crafting',
		energy_required=0.1,
		ingredients={{"raw-wood", 1}},
		result="seedling",
		result_count=1,
		order=" ",
		enabled=true
	},
	{
		type="fluid",
		name="sludge",
		default_temperature=25,
		max_temperature=100,
		heat_capacity="0.2KJ",
		base_color={r=139, g=69, b=19},
		flow_color={r=160, g=82, b=45},
		icon="__island_spawn__/sludge.png",
		icon_size=32,
		order="a[fluid]-a[water]",
		pressure_to_speed_ratio=0.4,
		flow_to_energy_ratio=0.59
	},
	{
		type="item-subgroup",
		name="sludge-recipe",
		order="a",
		group="intermediate-products"
	},
	{
		type='recipe',
		name='sludge-creation',
		category='crafting-with-fluid',
		energy_required=3,
		ingredients={
			{type="fluid", name="water", amount=25}, 
			{"raw-wood", 5}
		},
		results={{type="fluid", name="sludge", amount=30}},
		enabled=true,
		order=" ",
	}, -- 1 offshore pump produces 1200 water/sec
	{
		type='recipe',
		name='stone-from-sludge',
		subgroup="sludge-recipe",
		main_product="",
		category='crafting-with-fluid',
		energy_required=3/2,
		ingredients={{type="fluid", name="sludge", amount=10}},
		icon="__island_spawn__/sludge-stone.png",
		icon_size=32,
		result="stone",
		result_count=40,
		order="d",
		enabled=true
	},
	{
		type='recipe',
		name='iron-from-sludge',
		subgroup="sludge-recipe",
        main_product="",
		category='crafting-with-fluid',
		energy_required=3/2,
		ingredients={{type="fluid", name="sludge", amount=10}},
		icon="__island_spawn__/sludge-iron.png",
		icon_size=32,
		result="iron-ore",
		result_count=40,
		order="a",
		enabled=true
	},
	{
		type='recipe',
		name='copper-from-sludge',
		subgroup="sludge-recipe",
        main_product="",
		category='crafting-with-fluid',
		energy_required=3/2,
		ingredients={{type="fluid", name="sludge", amount=10}},
		icon="__island_spawn__/sludge-copper.png",
		icon_size=32,
		result="copper-ore",
		result_count=40,
		order="b",
		enabled=true
	},
	{
		type='recipe',
		name='coal-from-sludge',
		main_product="",
		subgroup="sludge-recipe",
		category='crafting-with-fluid',
		energy_required=3/2,
		ingredients={{type="fluid", name="sludge", amount=10}},
		icon="__island_spawn__/sludge-coal.png",
		icon_size=32,
		result="coal",
		result_count=40,
		order="c",
		enabled=true
	},
	{
		type='recipe',
	    category="chemistry",
		subgroup="sludge-recipe",
		name='uranium-from-sludge',
        main_product="",
		energy_required=3/2,
		ingredients={{type="fluid", name="sludge", amount=10},
					 {type="fluid", name="sulfuric-acid", amount=40}}, --[[as much as there is ore produced]]
		icon="__island_spawn__/sludge-uranium.png",
		icon_size=32,
		result="uranium-ore",
		result_count=40,
		order="e",
		enabled=true
	},
	{
		type="item-subgroup",
		name="stone-processing",
		order="b",
		group="intermediate-products"
	},
	{
		type="item",
		name="gravel",
		subgroup="stone-processing",
		flags={},
		order="a-r",
		icon="__island_spawn__/gravel.png",
		icon_size=32,
		stack_size=50,
		enabled=true
	},
	{
		type="recipe",
		category="crafting",
		name="gravel-making",
		subgroup="stone-processing",
		energy_required=1,
		ingredients={{"stone", 2}},
		icon="__island_spawn__/gravel.png",
		icon_size=32,
		result="gravel",
		result_count=1,
		order="a-r",
		enabled=false
	},
	{
		type="item",
		name="sand",
		subgroup="stone-processing",
		flags={},
		order="b-r",
		icon="__island_spawn__/sand.png",
		icon_size=32,
		stack_size=50,
		enabled=true
	},
	{
		type="recipe",
		category="crafting",
		name="sand-making",
		subgroup="stone-processing",
		energy_required=1,
		ingredients={{"gravel", 2}},
		icon="__island_spawn__/sand.png",
		icon_size=32,
		result="sand",
		result_count=1,
		order="b-r",
		enabled=false
	},
	{
		type="item",
		name="dust",
		subgroup="stone-processing",
		flags={},
		order="c-r",
		icon="__island_spawn__/dust.png",
		icon_size=32,
		stack_size=50,
		enabled=true
	},
	{
		type="recipe",
		category="crafting",
		name="dust-making",
		subgroup="stone-processing",
		energy_required=1,
		ingredients={{"sand", 2}},
		icon="__island_spawn__/dust.png",
		icon_size=32,
		result="dust",
		result_count=1,
		order="c-r",
		enabled=false
	},
	{
		type="recipe",
		name="gravel-sludge",
		icon="__island_spawn__/sludge.png",
		icon_size=32,
		main_product="",
		category="crafting-with-fluid",
		subgroup="stone-processing",
		energy_required=3,
		ingredients={
			{type="fluid", name="water", amount=26}, 
			{"raw-wood", 3},
			{"gravel", 1}
		},
		results={{type="fluid", name="sludge", amount=30}},
		order="a-s",
		enabled=false
	},
	{
		type="recipe",
		name="sand-sludge",
		icon="__island_spawn__/sludge.png",
		icon_size=32,
		main_product="",
		category="crafting-with-fluid",
		subgroup="stone-processing",
		energy_required=3,
		ingredients={
			{type="fluid", name="water", amount=28}, 
			{"raw-wood", 1},
			{"sand", 1}
		},
		results={{type="fluid", name="sludge", amount=30}},
		order="b-s",
		enabled=false
	},
	{
		type="recipe",
		name="dust-sludge",
		icon="__island_spawn__/sludge.png",
		icon_size=32,
		main_product="",
		category="crafting-with-fluid",
		subgroup="stone-processing",
		energy_required=3,
		ingredients={
			{type="fluid", name="water", amount=29}, 
			{"dust", 1}
		},
		results={{type="fluid", name="sludge", amount=30}},
		order="c-s",
		enabled=false
	},
	{
		type="recipe",
		name="wood-pressing",
		icon="__island_spawn__/wood-pressing.png",
		icon_size=40,
--		main_product="",
		category="crafting-with-fluid",
--		subgroup="stone-processing",
		energy_required=30,
		ingredients={
			{"raw-wood", 10},
		},
		results={{type="fluid", name="crude-oil", amount=50}},
--		order="b-s",
		enabled=true
	},
	{
		type="technology",
		name="stone-processing-1",
		icon="__island_spawn__/stone-processing-one.png",
		icon_size=128,
		effects={
			{
				type="unlock-recipe",
				recipe="gravel-making"
			},
			{
				type="unlock-recipe",
				recipe="gravel-sludge"
			}
		},
		prerequisites = {"automation"},
		unit={
			count=1,
			ingredients={{"science-pack-1", 0}},
			time=1
		}
	},
	{
		type="technology",
		name="stone-processing-2",
		icon="__island_spawn__/stone-processing-two.png",
		icon_size=128,
		effects={
			{
				type="unlock-recipe",
				recipe="sand-making"
			},
			{
				type="unlock-recipe",
				recipe="sand-sludge"
			}
		},
		prerequisites = {"automation-2", "stone-processing-1"},
		unit={
			count=1,
			ingredients={{"science-pack-2", 0}},
			time=1
		}
	},
	{
		type="technology",
		name="stone-processing-3",
		icon="__island_spawn__/stone-processing-three.png",
		icon_size=128,
		effects={
			{
				type="unlock-recipe",
				recipe="dust-making"
			},
			{
				type="unlock-recipe",
				recipe="dust-sludge"
			}
		},
		prerequisites = {"automation-3","stone-processing-2"},
		unit={
			count=1,
			ingredients={{"science-pack-3", 0}},
			time=1
		}
	}
}











