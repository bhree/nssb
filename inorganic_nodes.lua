-- Inorganic Materials  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

minetest .register_node( 'nssb:memoryone',  {
  description  = 'Memoryone',
  tiles  = { 'very_mossy_stone_brick.png' },
  is_ground_content  = false,
  sounds  = default .node_sound_stone_defaults(),
  on_blast  = function() end,
})


minetest .register_node( 'nssb:stone_brick',  {
  description  = 'Stone Brick',
  tiles  = {'default_stone_brick.png'},
  is_ground_content  = false,
  groups  = { cracky = 2,  stone = 2 },
  sounds  = default .node_sound_stone_defaults(),
  on_blast  = function() end,
})


minetest .register_node( 'nssb:mossy_stone_brick',  {
  description  = 'Mossy Stone Brick',
  tiles  = { 'mossy_stone_brick.png' },
  is_ground_content  = false,
  groups  = { cracky = 2,  stone = 2 },
  sounds  = default .node_sound_stone_defaults(),
  on_blast  = function() end,
})


minetest .register_node( 'nssb:very_mossy_stone_brick',  {
  description  = 'Very Mossy Stone Brick',
  tiles  = {'very_mossy_stone_brick.png'},
  is_ground_content  = false,
  groups  = { cracky = 2,  stone = 2 },
  sounds  = default .node_sound_stone_defaults(),
  on_blast  = function() end,
})


minetest .register_node( 'nssb:stone_column', {
  description  = 'Stone Column',
  tiles  = {'stone_column.png'},
  is_ground_content  = false,
  groups  = { cracky = 2,  stone = 2 },
  sounds  = default .node_sound_stone_defaults(),
  on_blast  = function() end,
})


minetest .register_node( 'nssb:mossy_stone_column', {
  description  = 'Mossy Stone Column',
  tiles  = {'mossy_stone_column.png'},
  is_ground_content  = false,
  groups  = { cracky = 2,  stone = 2 },
  sounds  = default .node_sound_stone_defaults(),
  on_blast  = function() end,
})


minetest .register_node( 'nssb:marine_stone',  {
  description  = 'Seastone',
  tiles  = {'marine_stone.png'},
  is_ground_content  = false,
  groups  = { cracky = 1,  stone = 2 },
  sounds  = default .node_sound_stone_defaults(),
})


minetest .register_node( 'nssb:marine_brick',  {
  description  = 'Seastone Brick',
  tiles  = {'marine_brick.png'},
  is_ground_content  = false,
  groups  = { stone = 2 },
  sounds  = default .node_sound_stone_defaults(),
})


minetest .register_node( 'nssb:marine_meselamp',  {
  description  = 'Sea Meselamp',
  tiles  = {'marine_meselamp.png'},
  is_ground_content  = false,
  groups  = { cracky = 3 },
  drop  = '',
  light_source  = 15,
  sounds  = default .node_sound_glass_defaults(),
})


minetest .register_node( 'nssb:morlamp',  {
  description  = 'Morlamp',
  tiles  = { 'morlamp.png' },
  is_ground_content  = false,
  groups  = { cracky = 3 },
  drop  = '',
  light_source  = 15,
  sounds  = default .node_sound_glass_defaults(),
})


minetest .register_node( 'nssb:mantis_clay',  {
  description  = 'Mantis Clay',
  tiles  = { 'mantis_clay.png' },
  is_ground_content  = false,
  groups  = { cracky = 2 },
  sounds  = default .node_sound_stone_defaults(),
})


minetest .register_node( 'nssb:hardened_mantis_clay',  {
  description  = 'Hardened Mantis Clay',
  tiles  = { 'hard_mantis_clay.png' },
  is_ground_content  = false,
  groups  = { cracky = 1 },
  sounds  = default .node_sound_stone_defaults(),
})


minetest .register_node( 'nssb:ant_stone',  {
  description  = 'Ant Stone',
  tiles  = { 'ant_stone.png' },
  is_ground_content  = false,
  groups  = { cracky = 1,  stone = 1 },
  sounds  = default .node_sound_stone_defaults(),
})


minetest .register_craft({
  output  = 'nssb:marine_meselamp',
  recipe  = {
    {'default:glass',  'bucket:bucket_water',  'default:glass'},
    {'default:glass',  'default:mese_crystal',  'default:glass'},
    {'default:glass',  'bucket:bucket_water',  'default:glass'}
  }
})


minetest .register_craft({
  output  = 'nssb:morlamp',
  recipe  = {
    {  'nssb:morelentir_dust',  'nssb:morelentir_dust',  'nssb:morelentir_dust'  },
    {  'nssb:morelentir_dust',  'nssb:morelentir_dust',  'nssb:morelentir_dust'  },
    {  'nssb:morelentir_dust',  'nssb:morelentir_dust',  'nssb:morelentir_dust'  }
  }
})


-- Morlavala nodes  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- default stone
minetest .register_node( 'nssb:morentir',  {
  description  = 'Dark Stone',
  tiles  = { 'morentir.png' },
  is_ground_content  = true,
  groups  = { cracky = 1 },
  sounds  = default .node_sound_stone_defaults(),
})

-- bedrock
minetest .register_node( 'nssb:indistructible_morentir',  {
  description  = 'Dark Indistructible Stone',
  tiles  = { 'morentir.png' },
  is_ground_content  = false,
  sounds  = default .node_sound_stone_defaults(),
  on_blast  = function() end,
})

-- lighter purple dirt than default stone
minetest .register_node( 'nssb:morkemen',  {
  description  = 'Dark Dirt',
  tiles  = { 'morkemen.png' },
  is_ground_content  = true,
  groups  = { crumbly = 1 },
  sounds  = default .node_sound_dirt_defaults(),
})

-- sand
minetest .register_node( 'nssb:fall_morentir',  {
  description  = 'Falling Dark Stone',
  tiles  = { 'morentir.png' },
  is_ground_content  = true,
  groups  = { cracky = 1,  falling_node = 1 },
  drop  = 'nssb:morentir',
  sounds  = default .node_sound_stone_defaults(),
})

-- meselamp
minetest .register_node( 'nssb:morelentir',  {
  description  = 'Dark Starred Stone',
  inventory_image  = minetest .inventorycube( 'morelentir.png' ),
  light_source  = 10,
  drop  = 'nssm:morelentir_dust',
  tiles  = {{  name  = 'morelentir_animated.png',
          animation  = { type  = 'vertical_frames',
                         aspect_w  = 16,  aspect_h  = 16,
                         length  = 6.0 },
           }},
  is_ground_content  = false,
  groups  = { cracky = 1 },
  sounds  = default .node_sound_stone_defaults(),
})

-- white flame, blue tips
minetest .register_node(  'nssb:mornar',  {
  description  = 'Black Flame',
  drawtype  = 'firelike',
  tiles  = {{  name  = 'mornar_animated.png',
               animation  = {  type  = 'vertical_frames',
                               aspect_w  = 16,  aspect_h  = 16,
                               length  = 1  },
           }},
  inventory_image  = 'mornar.png',
  light_source  = 12,
  groups  = { igniter  = 2 },
  drop  = '',
  walkable  = false,
  buildable_to  = false,
  damage_per_second  = 4,
})

-- bomb
minetest .register_node( 'nssb:boum_morentir',  {
  description  = 'Exploding Dark Stone',
  tiles  = { 'morentir.png' },
  is_ground_content  = true,
  groups  = { cracky = 1 },
  drop  = 'nssb:morentir',
  sounds  = default .node_sound_stone_defaults(),
})

-- funk
minetest .register_node( 'nssb:morvilya',  {
  description  = 'Dark Air',
  drawtype  = 'airlike',
  tiles  = { 'morvilya.png' },
  paramtype  = 'light',
  walkable  = false,
  sunlight_propagates  = true,
  pointable  = false,
  diggable  = false,
  buildable_to  = true,
  drop  = '',
  drowning  = 1,
  damage_per_second  = 2,
  post_effect_color  = { a=3,  r =1,  g=1,  b=1 },
})

-- dirty water source
minetest .register_node(  'nssb:mornen',  {
  description  = 'Black Water',
  inventory_image  = minetest .inventorycube( 'mornen.png' ),
  drawtype  = 'liquid',
  tiles  = {{  name  = 'mornen_animated.png',
               animation  = {  type  = 'vertical_frames',
                               aspect_w  = 16,  aspect_h  = 16,
                               length  = 2.0  },
           }},
  alpha  = 220,
  paramtype  = 'light',
  walkable  = false,
  pointable  = false,
  diggable  = false,
  buildable_to  = true,
  is_ground_content  = true,
  drop  = '',
  light_source  = 14,
  liquid_range  = 4,
  drowning  = 1,
  liquid_renewable  = true,
  damage_per_second  = 2,
  liquidtype  = 'source',
  liquid_alternative_flowing  = 'nssb:mornen_flowing',
  liquid_alternative_source  = 'nssb:mornen',
  liquid_viscosity  = 6,
  post_effect_color  = { a=2,  r=1,  g=1,  b=1 },
  groups  = { liquid = 3,  puts_out_fire = 1 },
})

-- dirty water
minetest .register_node( 'nssb:mornen_flowing',  {
  description  = 'Flowing Dark Water',
  inventory_image  = minetest .inventorycube( 'mornen.png' ),
  drawtype  = 'flowingliquid',
  tiles  = {{  name  = 'mornen_animated.png',
               backface_culling  = false,
               animation  = {  type = 'vertical_frames',
                               aspect_w = 16,  aspect_h = 16,
                               length = 3.3,
                             }
    }},
  special_tiles  = {{  name  = 'mornen_animated.png',
                       backface_culling  = true,
                       animation  = {  type  = 'vertical_frames',
                                       aspect_w  = 16,  aspect_h  = 16,
                                       length  = 3.3,
                                    }
    }},
  paramtype  = 'light',
  paramtype2  = 'flowingliquid',
  light_source  = 10,
  alpha  = 220,
  walkable  = false,
  pointable  = false,
  diggable  = false,
  buildable_to  = true,
  is_ground_content  = false,
  drop  = '',
  drowning  = 1,
  liquidtype  = 'flowing',
  liquid_alternative_flowing  = 'nssb:mornen_flowing',
  liquid_alternative_source  = 'nssb:mornen',
  liquid_viscosity  = 6,
  liquid_renewable  = true,
  damage_per_second  = 2,
  post_effect_color  = { a=2,  r=1,  g=1,  b=1 },
  groups  = {  liquid = 3,  puts_out_fire = 1,
                water = 1,  not_in_creative_inventory = 1  },
})

-- blue flow
minetest .register_node( 'nssb:portal',  {
  description  = 'Morlendor Portal',
  inventory_image  = minetest .inventorycube( 'mornen.png' ),
  drawtype  = 'liquid',
  tiles  = {{  name  = 'mornen_animated.png',
               animation  = {  type  = 'vertical_frames',
                               aspect_w = 16,  aspect_h = 16,
                               length = 2.0  },
           }},
  alpha  = 220,
  paramtype  = 'light',
  walkable  = false,
  pointable  = false,
  diggable  = false,
  buildable_to  = true,
  is_ground_content  = false,
  drop  = '',
  light_source  = 15,
  liquid_range  = 0,
  drowning  = 1,
  liquid_renewable  = false,
  liquidtype  = 'source',
  liquid_alternative_flowing  = 'nssb:portal',
  liquid_alternative_source  = 'nssb:portal',
  liquid_viscosity  = 0,
  post_effect_color  = { a=10,  r=1,  g=1,  b=1 },
  groups  = { liquid = 3,  puts_out_fire = 1 },
  on_blast  = function() end,
})

-- green flow
minetest .register_node( 'nssb:portalhome',  {
  description  = 'Home Portal',
  inventory_image  = minetest .inventorycube( 'portalhome.png' ),
  drawtype  = 'liquid',
  tiles  = {{  name  = 'portalhome_animated.png',
          animation  = {  type  = 'vertical_frames',
                          aspect_w = 16,  aspect_h = 16,
                          length = 2.0  },
           }},
  alpha  = 220,
  paramtype  = 'light',
  walkable  = false,
  pointable  = false,
  diggable  = false,
  buildable_to  = true,
  is_ground_content  = false,
  drop  = '',
  light_source  = 15,
  liquid_range  = 0,
  drowning  = 1,
  liquid_renewable  = false,
  liquidtype  = 'source',
  liquid_alternative_flowing  = 'nssb:portalhome',
  liquid_alternative_source  = 'nssb:portalhome',
  liquid_viscosity  = 0,
  post_effect_color  = { a=10,  r=1,  g=1,  b=1 },
  groups  = { liquid = 3,  puts_out_fire = 1 },
  on_blast  = function() end,
})


minetest .register_node( 'nssb:moranga',  {
  description  = 'Moranga Ore',
  tiles  = { 'morentir.png^moranga.png' },
  groups  = { cracky = 1 },
  drop  = 'nssb:moranga_lump',
  sounds  = default .node_sound_stone_defaults(),
})


minetest .register_craftitem( 'nssb:moranga_lump',  {
  description  = 'Moranga Lump',
  image  = 'moranga_lump.png',
})


minetest .register_craft(  {
  type  = 'cooking',
  output  = 'nssb:moranga_ingot',
  recipe  = 'nssb:moranga_lump',
  cooktime  = 160,
})


minetest .register_craftitem( 'nssb:moranga_ingot',  {
  description  = 'Moranga Ingot',
  image  = 'moranga_ingot.png',
})


minetest .register_node( 'nssb:morvalar_block',  {
  description  = 'Morvalar Block',
  tiles  = { 'morvalar_block.png' },
  light_source  = 13,
})


minetest .register_node( 'nssb:dis_morvalar_block',  {
  description  = 'Disactivated Morvalar Block',
  tiles  = { 'dis_morvalar_block.png' },
  on_punch  = function( pos,  node,  puncher )
    if puncher :get_wielded_item() :get_name() == 'nssm:superior_energy_globe' then
      minetest .set_node( pos,  { name = 'nssb:morvalar_block' })
    end -- if puncher
  end -- on_punch
})


minetest .register_abm({ -- spawn a monster
  nodenames  = { 'nssb:morvalar_block' },
  neighbors  = { 'nssb:indistructible_morentir' },
  interval  = 10,  -- every 10 seconds
  chance  = 1,     -- 1:1  do it
  action  = function( pos,  node )
    minetest .remove_node(pos)
    minetest .add_entity( pos,  'nssm:morvalar' )
  end
})

