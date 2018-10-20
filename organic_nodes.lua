-- Organic Materials  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- thistle
minetest .register_node( 'nssb:morlote',  {
  description  = 'Morlote',
  drawtype  = 'plantlike',
  visual_scale  = 1.0,
  tiles  = { 'morlote.png' },
  inventory_image  = 'morlote.png',
  wield_image  = 'morlote.png',
  paramtype  = 'light',
  light_source  = 14,
  sunlight_propagates  = true,
  walkable  = false,
  buildable_to  = false,
  groups  = { snappy = 3,  attached_node = 1 },
  sounds  = default .node_sound_leaves_defaults(),
  selection_box  = {  type = 'fixed',
          fixed  = { -0.5,  -0.5,  -0.5,  0.5,  -5/16,  0.5 }
                   }
})


minetest .register_node( 'nssb:vine',  {
  description  = 'Vine',
  drawtype  = 'signlike',
  tiles  = { 'climbing_plant.png' },
  inventory_image  = { 'vine.png' },
  walkable  = false,
  climbable  = true,
  paramtype  = 'light',
  paramtype2  = 'wallmounted',
  selection_box  = { type = 'wallmounted' },
  legacy_wallmounted  = true,
  groups  = { flammable = 3,  snappy = 3 },
  sounds  = default .node_sound_leaves_defaults()
})


minetest .register_node( 'nssb:liana',  {
  description  = 'Liana',
  drawtype  = 'plantlike',
  inventory_image  = { 'liana.png' },
  tiles  = { 'liana.png' },
  paramtype  = 'light',
  walkable  = false,
  climbable  = true,
  groups  = { flammable = 3,  snappy = 3 },
  sounds  = default .node_sound_leaves_defaults()
})


minetest .register_node( 'nssb:vertical_web',  {
  description  = 'Vertical Web',
  inventory_image  = 'vertical_web.png',
  tile_images  = { 'vertical_web.png' } ,
    drawtype  = 'plantlike',
  paramtype  = 'light',
  walkable  = false,
  pointable  = true,
  diggable  = true,
  buildable_to  = false,
  drop  = 'nssm:web',
  drowning  = 0,
  liquid_renewable  = false,
  liquidtype  = 'source',
  liquid_range  = 0,
  liquid_alternative_flowing  = 'nssb:vertical_web',
  liquid_alternative_source  = 'nssb:vertical_web',
  liquid_viscosity  = 4,
  groups  = { flammable = 2,  snappy = 1,  liquid = 1 },
})


minetest .register_node( 'nssb:web_cone_up',  {
  description  = 'Web Cone Up',
  inventory_image  = 'web_cone_up.png',
  tile_images  = { 'web_cone_up.png' } ,
    drawtype  = 'plantlike',
  paramtype  = 'light',
  walkable  = false,
  pointable  = true,
  diggable  = true,
  buildable_to  = false,
  drop  = 'nssm:web',
  drowning  = 0,
  liquid_renewable  = false,
  liquidtype  = 'source',
  liquid_range= 0,
  liquid_alternative_flowing  = 'nssb:web_cone_up',
  liquid_alternative_source  = 'nssb:web_cone_up',
  liquid_viscosity  = 5,
  groups  = { flammable = 2,  snappy = 1,  liquid = 1 },
})


minetest .register_node( 'nssb:web_cone_down',  {
  description  = 'Web Cone Down',
  inventory_image  = 'web_cone_down.png',
  tile_images  = { 'web_cone_down.png' } ,
  drawtype  = 'plantlike',
  paramtype  = 'light',
  walkable  = false,
  pointable  = true,
  diggable  = true,
  buildable_to  = false,
  drop  = 'nssm:web',
  drowning  = 0,
  liquid_renewable  = false,
  liquidtype  = 'source',
  liquid_range= 0,
  liquid_alternative_flowing  = 'nssb:web_cone_down',
  liquid_alternative_source  = 'nssb:web_cone_down',
  liquid_viscosity  = 5,
  groups  = { flammable = 2,  snappy = 1,  liquid = 1 },
})


minetest .register_node(  'nssb:web_cocoon',  {
  description  = 'Web Cocoon',
  tiles  = { 'web_cocoon.png' },
  drop  = {
         max_items  = 1,
         items  = {{  items  = { "node 'nssm:spider_leg' 2" },
                      rarity  = 4

                 },{  items  = { "node 'nssm:web' 1" },
                      rarity  = 4

                 },{  items  = { "node 'nssm:ant_sword' 1" },
                      rarity  = 20

                 },{  items  = { "node 'nssm:sun_sword' 1 "},
                      rarity  = 100

                 },{  items  = { "node 'nssm:night_sword' 1" },
                      rarity  = 100

                 },{  items  = { "node 'nssm:spear_ant' 1" },
                      rarity  = 20

                 },{  items  = { "node 'nssm:spear_mantis' 1" },
                      rarity  = 20

                 },{  items  = { "node 'nssm:spear_manticore' 1" },
                      rarity  = 22

                 },{  items  = { "node 'nssm:spear_little_ice_tooth' 1" },
                      rarity  = 20

                 },{  items  = { "node 'nssm:spear_duck_beak' 1" },
                      rarity  = 20

                 },{  items  = { "node 'default:sword_wood' 1" },
                      rarity  = 14

                 },{  items  = { "node 'default:sword_steel' 1" },
                      rarity  = 20

                 },{  items  = { "node 'default:sword_mese' 1" },
                      rarity  = 20

                 },{  items  = { "node 'default:axe_bronze' 1" },
                      rarity  = 20

                 },{  items  = { "node 'nssm:raw_scrausics_wing' 2" },
                      rarity  = 20

                 },{  items  = { "node 'nssm:mantis_claw' 1" },
                      rarity  = 20

                 },{  items  = { "node 'default:axe_mese' 1" },
                      rarity  = 20

                 },{  items  = { "node 'nssm:mantis_sword' 1" },
                      rarity  = 20

                 },{  items  = { "node 'default:axe_steel' 1" },
                      rarity  = 20

                 },{  items  = { "node 'nssm:crab_light_mace' 1" },
                      rarity  = 20

                 },{  items  = { "node 'nssm:masticone_fang_sword' 1" },
                      rarity  = 20
             }}
          },
  is_ground_content  = false,
  groups  = { snappy = 1,  flammable = 2 },
}) -- .register_node(  'nssb:web_cocoon'


-- Eggs  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function nssb_register_eggs(
  name, -- name of the mobs and the eggs
  descr, -- Description of the mob and eggs
  int,   -- time interval between each birth
  wide,  -- the radius in wich mobs are generated
  troppi, -- maximun number of mobs spawned
  neigh,  -- block that need to be near for spawning the mobs
  night,  -- if only at night
  lumin  ) -- luminosity parameter of the egg_block

  minetest .register_node( 'nssb:' ..name ..'_eggs', {
    description  = descr ..' Eggs',
    tiles  = { name ..'_eggs.png' },
    light_source  = lumin,
    is_ground_content  = false,
    groups  = { choppy = 1 },
  }) -- register_node()


  minetest .register_abm(  {
    nodenames  = { 'nssb:' ..name ..'_eggs' },
    neighbors  = { neigh },
    interval  = int,
    chance  = 1,
    action  = function(  pos,  node,  active_object_count,
                                      active_object_count_wider  )

      local pos1  = { x  = pos.x +math.random( -wide,  wide ),
                      y  = pos.y +0.5,
                      z  = pos.z +math.random( -wide,  wide )  }
      local nodename  = minetest .env :get_node( pos1 ) .name

      if nodename ~= 'air' and nodename ~= 'default:water_source' then
        return
      end

      local count  = 0
      local objects  = minetest .env :get_objects_inside_radius( pos, 12 )
      for _,obj in ipairs(objects) do
        count  = count +1
        --minetest .chat_send_all('Count: ' ..count)
      end -- ipairs

      local t  = minetest .get_timeofday()
      --minetest .chat_send_all('Time of day: ' ..t)

      if ( t >= 0.75 and t <= 1 )
      or ( t >= 0 and t <= 0.25 ) or night == false then
        if count < troppi then
          minetest .add_entity( pos1,  'nssm:' ..name )
        end -- if count < troppi
      end -- if t >= ...
    end -- action = function()
  }) -- .register_abm()

end -- nssb_register_eggs()


nssb_register_eggs(  'ant_worker',  'Ant Worker',
                      16,  2,  4,  'air',  false,  5  )

nssb_register_eggs(  'ant_soldier',  'Ant Soldier',
                      16,  2,  4,  'air',  false,  5  )

nssb_register_eggs(  'larva', 'Larva',
                      16,  2,  4,  'air',  false,  5  )

nssb_register_eggs(  'crab', 'Crab',
                      18,  2,  4,  'default:sand', false,  5  )

nssb_register_eggs(  'black_widow', 'Black Widow',
                      18,  2,  4,  'air',  false,  5  )

nssb_register_eggs(  'uloboros',  'Uloboros',
                      18,  2,  4,  'air',  false,  5  )

nssb_register_eggs(  'daddy_long_legs',  'Daddy Long Legs',
                      18,  2,  4,  'air',  false,  5  )

nssb_register_eggs(  'xgaloctopus',  'Xgaloctopus',
                      18,  2,  4,  'default:water_source',  false,  5  )

nssb_register_eggs(  'bloco', 'Bloco',
                      14,  2,  4,  'default:gravel',  false,  5  )

nssb_register_eggs(  'icesnake',  'Icesnake',
                      18,  2,  4,  'default:ice',  false,  5  )

nssb_register_eggs(  'snow_biter',  'Snowbiter',
                      18,  2,  4,  'default:ice',  false,  5  )

nssb_register_eggs(  'scrausics',  'Scrausics',
                      18,  2,  4,  'air',  false,  5  )

nssb_register_eggs(  'moonheron',  'Moonheron',
                      18,  2,  4,  'air',  true,  0  )


function nssb_register_eggboss (
  name, -- name of the mobs and the eggs
  descr, -- Description of the mob and eggs
  int,   -- time interval between each birth
  wide,  -- the radius in wich mobs are generated
  troppi, -- maximun number of mobs spawned
  neigh,  -- block that need to be near for spawning the mobs
  night,   -- if only at night
  lumin )  -- luminosity parameter of the egg_block

  minetest .register_node( 'nssb:' ..name ..'_eggboss',  {
    description  = descr ..' Eggs',
    tiles  = { name ..'_eggs.png' },
    light_source  = lumin,
    is_ground_content  = false,
    groups  = { choppy = 1 },
  })

  minetest .register_abm(  {
  nodenames  = { 'nssb:' ..name ..'_eggboss' },
  neighbors  = { neigh },
  interval  = int,
  chance  = 1,
  action  = function(  pos,  node,  active_object_count,
                                    active_object_count_wider  )

    local pos1  = {  x  = pos.x +math.random( -wide, wide ),
                     y  = pos.y +0.5, -- slightly above?
                     z  = pos.z +math.random( -wide, wide )  }

    local nodename  = minetest .env :get_node(pos1) .name
    if nodename ~= 'air' and nodename ~= 'default:water_source' then
      return
    end

    local count  = 0
    local objects  = minetest .env :get_objects_inside_radius( pos, 12 )
    for _, obj in ipairs(objects) do
      count  = count +1
    end

    local t  = minetest .get_timeofday()
    if (t >= 0.75 and t <= 1) or (t >= 0 and t <= 0.25) or night == false then
      if count < troppi then
        minetest .add_entity( pos1,  'nssm:' ..name )
      end
    end
  end
  })

end -- nssb_register_eggboss()


-- Bosses of the eggs:
-- ( name,  description,
--  interval,  radius,  max spawned,  neighbor,  night,  luminosity )

nssb_register_eggboss(  'phoenix',  'Phoenix',
                        900,  10,  1,  'air',  false,  15  )

nssb_register_eggboss(  'tarantula',  'Tarantula',
                        900,  2,  1,  'air',  false,  5  )

nssb_register_eggboss(  'night_master', 'Night Master',
                        900,  10,  1,  'air',  true,  0  )

nssb_register_eggboss(  'ant_queen',  'Ant Queen',
                        900,  10,  1,  'air',  false,  5  )

nssb_register_eggboss(  'icelamander',  'Icelamander',
                        900,  10,  1,  'air',  false,  5  )


minetest .register_node( 'nssb:giant_sandworm_eggs',  {
  description  = 'Giant Sandworm Egg',
  tiles  = { 'giant_sandworm_eggs.png' },
  is_ground_content  = false,
  groups  = { choppy = 1 },
})


minetest .register_abm(  {
  nodenames  = { 'nssb:giant_sandworm_eggs' },
  neighbors  = { 'default:desert_stone' },
  interval  = 10, -- every 10 seconds
  chance  = 1,    -- 1:1  do it
  action  = function( pos,  node )
    local above  = { x = pos.x,  y = pos.y +1,  z = pos.z }
    local nodename  = minetest .env :get_node( above ) .name

    if nodename ~= 'air' then -- need a gap above
      return
    end

    minetest .add_entity( above,  'nssm:giant_sandworm' )
    minetest .remove_node( pos )
  end
})



minetest .register_node( 'nssb:life_energy_ore',  {
  description  = 'Life Energy Ore',
  tiles  = { 'morentir.png^life_energy_ore.png' },
  groups  = { cracky = 1 },
  light_source  = 4,
  drop  = 'nssm:energy_globe',
  sounds  = default .node_sound_stone_defaults(),
})


minetest .register_abm({  -- decay old webs
  nodenames = {  'nssb:vertical_web',
                 'nssb:web_cone_up',
                 'nssb:web_cone_down'  },
  interval = 20,  -- every 20 seconds
  chance = 3,     -- 1 in 3 chance
  action = function( pos,  node )
    minetest .set_node( { x = pos.x,  y = pos.y,  z = pos.z },
                        { name  = 'air' } )
  end
})

