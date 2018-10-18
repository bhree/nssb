local moreores
if minetest .get_modpath('moreores') then
  moreores = true
end


nssb .mymapgenis  = tonumber( minetest .setting_get('mymapgenis')) or 7
if nssb .mymapgenis < 6 then
  nssb .mymapgenis  = 7
end


-- schematics generation
local posplace  = { x = 0,  y = -30093,  z = 0 }
local posmemory = { x = 0,  y = -30092,  z = 0 }
local postest   = { x = 5,  y = -30091,  z = 6 }


function nssb_register_buildings(
  build,      -- name of schematic
  rand,      -- 1/rand is probability of spawning
  posschem,    -- required block to to spawn on
  down,      -- useful in finding flat surfaces, number below
  downblock,    -- name of block below
  above,      -- when placing schem under something (water, air, jungleleaves...) above is the number of blocks above posschem
  aboveblock,    -- name of block above
  radius,      -- radius to search for 'near' block
  near,      -- block that is necessary to spawn schem in the radius
  side,      -- width of schematic, necessary to put dirt / ice under
  underground,  -- if true, schematic spawns underground
  height,      -- under this heigh the schematic can spawn. If nil the schematic can spawn everywhere underground
  ice,      -- fill underneath schem with ice, not dirt as standard
  exact_height,   -- exact_height = exact_eight under the surface in the correct place
  portal  )      -- is this schematic a portal for the morlendor?

  minetest .register_on_generated(  function( minp,  maxp,  seed )
    if underground == false then

      local i, j, k
      local flag  = 0
      local posd

      i  = math.random( minp.x,  maxp.x )
      k  = math.random( minp.z,  maxp.z )

      for j = minp.y,  maxp.y do
        local pos1 = { x = i,  y = j,  z = k }
        local pos2 = { x = i +down,  y = j -1,  z = k +down }
        local pos3 = { x = i,  y = j +above,  z = k }

        local n = minetest.env :get_node(pos1) .name
        local u = minetest.env :get_node(pos2) .name
        local d = minetest.env :get_node(pos3) .name

        if (downblock == nil) then
          u = downblock
        end

        if (aboveblock == nil) then
          d = aboveblock
        end

        if n == posschem and u == downblock and d == aboveblock
        and flag == 0 and math.random( 1,  rand ) == 1 then

          if minetest .find_node_near( pos3,  radius,  near ) then

              minetest .place_schematic( pos1,  minetest .get_modpath('nssb') ..'/schems/' ..build ..'.mts',  '0',  {},  true )
              --minetest.chat_send_all('Added schematic in '..(minetest.pos_to_string(pos1)))
              posd = pos1
              flag = 1
          end -- find_node_near()
        end -- if n == posschem and...
      end -- for y = minp.y,  maxp.y do

      -- Puts dirt/ice under schem to fill space below
      if flag == 1 and side > 0 then
        for dx  = 0,  side do
          for dz  = 0,  side do
            local dy  = posd.y -1
            local f  = { x = posd.x +dx,  y = dy,  z = posd.z +dz }
            local nodename  = minetest .env :get_node(f) .name

            if ice == false then
              while nodename == 'air' do
                minetest .env :set_node(f, {name='default:dirt'})
                f.y  = f.y -1
                nodename  = minetest .env :get_node(f) .name
              end -- while air
            else
              while nodename == 'air' do
                  minetest .env :set_node( f,  {name='default:ice'} )
                  f.y  = f.y -1
                  nodename  = minetest .env :get_node(f) .name
              end -- while air
            end -- if not ice
          end -- dz
        end -- dx
      end -- if flag == 1 and side > 0
    else  -- underground == true

      if minp.y < 0 then
        --minetest.chat_send_all('Posmin: '..(minetest.pos_to_string(minp))..' Posmax: '..(minetest.pos_to_string(maxp)))
        local i, j, k
        local flag  = 0

        local height  = height or 0
        if maxp.y > height then maxp.y  = height end

        i  = math.random( minp.x,  maxp.x )
        j  = math.random( minp.y,  maxp.y )
        k  = math.random( minp.z,  maxp.z )

        local pos1 = { x = i,  y = j,  z = k }
        local nodename = minetest.env :get_node(pos1) .name

        if minetest .find_node_near( pos1,  radius,  'default:lava_source' ) or flag == 1 then
          return
        else
          if nodename == posschem and math.random( 1, rand ) == 1 then
            minetest .place_schematic( pos1,  minetest .get_modpath('nssb') ..'/schems/' ..build ..'.mts',  '0',  {},  true)
            flag  = 1
            --minetest.chat_send_all('Added schematic in '..(minetest.pos_to_string(pos1)))
          end -- if nodename == posschem
        end -- if .find_node_near()
      end
    end
  end)
end


--  (  buildname,  random chance,  nodename,
--  numberdown,  namedown,  numberabove,  nameabove,
--  radius,  near,  width2fill,  underground,
--  height,  ice,  exact_height,  portal  )

if nssb .mymapgenis == 6 then  --~~~~~~~~~~~~~~~~~~~~~~~~~~
  nssb_register_buildings(
        'spiaggiagranchius',  2,  'default:sand',
        3,  'default:sand',  2,  'air',
        3, 'air',  0,  false,
        nil,  false,  false,  false  )

  nssb_register_buildings(
        'acquagranchius',  3,  'default:sand',
        3,  'default:sand',  12,  'default:water_source',
        3,  'default:water_source',  0,  false,
        nil,  false,  false,  false  )

  nssb_register_buildings(
  'ooteca', 6, 'default:dirt_with_grass', 3, 'default:dirt', 2, 'air', 24, 'default:tree', 8, false, nil, false, false, false)

  nssb_register_buildings ('minuscolaooteca', 6, 'default:dirt_with_grass',3 , 'default:dirt', 2, 'air', 24, 'default:tree', 2, false, nil, false, false, false)

  nssb_register_buildings ('piccolaooteca', 6, 'default:dirt_with_grass', 2, 'default:dirt', 2, 'air', 24, 'default:tree', 4, false, nil, false, false, false)

  nssb_register_buildings ('arcate', 8, 'default:sand', 3, 'default:sand', 13, 'default:water_source', 3, 'default:water_source',0, false, nil, false, false, false)

  nssb_register_buildings ('grandepiramide', 8, 'default:dirt', 3, 'default:dirt', 20, 'default:water_source', 3, 'default:water_source', 0, false, nil, false, false, false)

  nssb_register_buildings ('collina', 5, 'default:dirt_with_grass', 3, 'default:dirt', 2, 'air', 3, 'air', 12, false, nil, false, false, false)

  nssb_register_buildings ('megaformicaio', 7, 'default:dirt_with_grass', 4, 'default:dirt', 2, 'air', 3, 'air', 25, false, nil, false, false, false)

  nssb_register_buildings ('antqueenhill', 8, 'default:dirt_with_grass', 4, 'default:dirt', 2, 'air', 3, 'air', 21, false, nil, false, false, false)

  nssb_register_buildings ('rovine1', 4, 'default:dirt_with_grass', 3, 'default:dirt',  2, 'air', 8, 'default:jungletree', 10, false, nil, false, false, false)

  nssb_register_buildings ('rovine3', 4, 'default:dirt_with_grass', 1, 'default:dirt',  2, 'air', 8, 'default:jungletree', 10, false, nil, false, false, false)

  nssb_register_buildings ('rovine4', 4, 'default:dirt_with_grass', 1, 'default:dirt',  2, 'air', 8, 'default:jungletree', 10, false, nil, false, false, false)

  nssb_register_buildings ('rovine5', 4, 'default:dirt_with_grass', 1, 'default:dirt',  2, 'air', 8, 'default:jungletree', 10, false, nil, false, false, false)

  nssb_register_buildings ('rovine6', 4, 'default:dirt_with_grass', 1, 'default:dirt',  2, 'air', 8, 'default:jungletree', 10, false, nil, false, false, false)

  nssb_register_buildings ('rovine7', 4, 'default:dirt_with_grass', 1, 'default:dirt',  2, 'air', 8, 'default:jungletree', 10, false, nil, false, false, false)

  nssb_register_buildings ('rovine8', 4, 'default:dirt_with_grass', 1, 'default:dirt',  2, 'air', 8, 'default:jungletree', 10, false, nil, false, false, false)

  nssb_register_buildings ('rovine9', 4, 'default:dirt_with_grass', 1, 'default:dirt',  2, 'air', 8, 'default:jungletree', 10, false, nil, false, false, false)

  nssb_register_buildings ('rovine10', 4, 'default:dirt_with_grass', 1, 'default:dirt',  2, 'air', 8, 'default:jungletree', 10, false, nil, false, false, false)

  nssb_register_buildings ('bozzoli', 4, 'default:dirt_with_grass', 1, 'default:dirt',  2, 'air', 8, 'default:jungletree', 10, false, nil, false, false, false)

  nssb_register_buildings ('picco', 12, 'default:desert_sand', 1, 'default:desert_stone',  1, 'air', 3, 'default:desert_sand', 10, false, nil, false, false, false)

  nssb_register_buildings ('piccoghiaccio', 12, 'default:dirt_with_snow', 1, 'default:dirt',  1, 'air', 3, 'default:dirt_with_snow', 10, false, nil, true, false, false)

  nssb_register_buildings ('icehall', 8, 'default:dirt_with_snow', 1, 'default:dirt',  1, 'air', 3, 'default:dirt_with_snow', 30, false, nil, true, false, false)

  nssb_register_buildings ('piccomoonheron', 8, 'default:dirt_with_snow', 1, 'default:dirt',  1, 'air', 3, 'default:dirt_with_snow', 3, false, nil, true, false, false)

  nssb_register_buildings ('doppiopiccoghiaccio', 11, 'default:dirt_with_snow', 1, 'default:dirt',  1, 'air', 3, 'default:dirt_with_snow', 7, false, nil, true, false, false)

  nssb_register_buildings ('doppiopiccosabbia', 11, 'default:desert_sand', 1, 'default:desert_stone',  1, 'air', 3, 'default:desert_sand', 7, false, nil, false, false, false)

  nssb_register_buildings(
      'piccoscrausics',  8,  'default:desert_sand',
      1,  'default:desert_stone',  1,  'air',
      3,  'default:desert_sand',  3,  false,
      nil,  false,  false,  false  )

  nssb_register_buildings(
      'fossasand',  20,  'default:desert_sand',
      1,  'default:desert_stone',  1,  'air',
      3,  'default:desert_sand',  16,  false,
      nil,  false,  false,  false  )

  nssb_register_buildings(
      'portal',  100,  'default:dirt_with_grass',
      2,  'default:dirt',  2,  'air',
      24,  'air',  11,  false,
      nil,  false,  false,  true  )

else  -- mymapgenis 7 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  nssb_register_buildings(  'spiaggiagranchius', 5, 'default:sand', 3, 'default:sand', 2, 'air',  3, 'air', 0, false, nil, false, false, false)

  nssb_register_buildings(  'acquagranchius', 6, 'default:sand', 3, 'default:sand', 12,'default:water_source', 3, 'default:water_source', 0, false, nil, false, false, false)

  nssb_register_buildings(  'ooteca', 12, 'default:dirt_with_grass', 3, 'default:dirt', 2, 'air', 24, 'default:tree', 8, false, nil, false, false, false)

  nssb_register_buildings(  'minuscolaooteca', 11, 'default:dirt_with_grass',3 , 'default:dirt', 2, 'air', 24, 'default:tree', 2, false, nil, false, false, false)

  nssb_register_buildings(  'piccolaooteca', 11, 'default:dirt_with_grass', 2, 'default:dirt', 2, 'air', 24, 'default:tree', 4, false, nil, false, false, false)

  nssb_register_buildings(  'arcate', 24, 'default:sand', 3, 'default:sand', 13, 'default:water_source', 3, 'default:water_source',0, false, nil, false, false, false)

  nssb_register_buildings( 'grandepiramide', 24, 'default:dirt', 3, 'default:dirt', 20, 'default:water_source', 3, 'default:water_source', 0, false, nil, false, false, false)

  nssb_register_buildings(  'collina', 14, 'default:dirt_with_grass', 3, 'default:dirt', 2, 'air', 3, 'air', 12, false, nil, false, false, false)

  nssb_register_buildings(  'megaformicaio', 20, 'default:dirt_with_grass', 4, 'default:dirt', 2, 'air', 3, 'air', 25, false, nil, false, false, false)

  nssb_register_buildings(  'antqueenhill', 22, 'default:dirt_with_grass', 4, 'default:dirt', 2, 'air', 3, 'air', 21, false, nil, false, false, false)

  nssb_register_buildings(  'rovine1', 6, 'default:dirt_with_grass', 3, 'default:dirt',  2, 'air', 8, 'default:jungletree', 10, false, nil, false, false, false)

  nssb_register_buildings(  'rovine3', 6, 'default:dirt_with_grass', 1, 'default:dirt',  2, 'air', 8, 'default:jungletree', 10, false, nil, false, false, false)

  nssb_register_buildings(  'rovine4', 6, 'default:dirt_with_grass', 1, 'default:dirt',  2, 'air', 8, 'default:jungletree', 10, false, nil, false, false, false)

  nssb_register_buildings(  'rovine5', 6, 'default:dirt_with_grass', 1, 'default:dirt',  2, 'air', 8, 'default:jungletree', 10, false, nil, false, false, false)

  nssb_register_buildings(  'rovine6', 6, 'default:dirt_with_grass', 1, 'default:dirt',  2, 'air', 8, 'default:jungletree', 10, false, nil, false, false, false)

  nssb_register_buildings(  'rovine7', 6, 'default:dirt_with_grass', 1, 'default:dirt',  2, 'air', 8, 'default:jungletree', 10, false, nil, false, false, false)

  nssb_register_buildings(  'rovine8', 6, 'default:dirt_with_grass', 1, 'default:dirt',  2, 'air', 8, 'default:jungletree', 10, false, nil, false, false, false)

  nssb_register_buildings(  'rovine9', 6, 'default:dirt_with_grass', 1, 'default:dirt',  2, 'air', 8, 'default:jungletree', 10, false, nil, false, false, false)

  nssb_register_buildings(  'rovine10', 6, 'default:dirt_with_grass', 1, 'default:dirt',  2, 'air', 8, 'default:jungletree', 10, false, nil, false, false, false)

  nssb_register_buildings(  'bozzoli', 4, 'default:dirt_with_grass', 1, 'default:dirt',  2, 'air', 8, 'default:jungletree', 10, false, nil, false, false, false)

  nssb_register_buildings(  'picco', 32, 'default:desert_sand', 1, 'default:desert_stone',  1, 'air', 3, 'default:desert_sand', 10, false, nil, false, false, false)

  nssb_register_buildings ('piccoghiaccio', 32, 'default:dirt_with_snow', 1, 'default:dirt',  1, 'air', 3, 'default:dirt_with_snow', 10, false, nil, true, false, false)

  nssb_register_buildings(  'icehall', 40, 'default:dirt_with_snow', 1, 'default:dirt',  1, 'air', 3, 'default:dirt_with_snow', 30, false, nil, true, false, false)

  nssb_register_buildings(  'piccomoonheron', 32, 'default:dirt_with_snow', 1, 'default:dirt',  1, 'air', 3, 'default:dirt_with_snow', 3, false, nil, true, false, false)

  nssb_register_buildings(  'doppiopiccoghiaccio', 32, 'default:dirt_with_snow', 1, 'default:dirt',  1, 'air', 3, 'default:dirt_with_snow', 7, false, nil, true, false, false)

  nssb_register_buildings(  'doppiopiccosabbia', 32, 'default:desert_sand', 1, 'default:desert_stone',  1, 'air', 3, 'default:desert_sand', 7, false, nil, false, false, false)

  nssb_register_buildings(  'piccoscrausics', 32, 'default:desert_sand', 1, 'default:desert_stone',  1, 'air', 3, 'default:desert_sand', 3, false, nil, false, false, false)

  nssb_register_buildings(  'fossasand', 50, 'default:desert_sand', 1, 'default:desert_stone',  1, 'air', 3, 'default:desert_sand', 16, false, nil, false, false, false)

  nssb_register_buildings(  'portal', 200, 'default:dirt_with_grass', 2, 'default:dirt', 2, 'air', 24, 'air', 11, false, nil, false, false, true)
end

-- build in all mapgen types

nssb_register_buildings(  'blocohouse',  4,  'default:stone',
      0,  'air',  0, 'air', 3, 'default:stone',
      5,  true,  -10,  false,  false,  false  )

nssb_register_buildings(  'bigblocohouse',  4,  'default:stone',
      0,  'air',   0,  'air',  3,  'default:stone',
      5,  true,  -20,  false,  false,  false  )

nssb_register_buildings(  'blocobiggesthouse',  4,  'default:stone',
      0,  'air',  0,  'air',  3,  'default:stone',
      5,  true,  -30,  false,  false,  false  )

-- nodes gen  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- This dimension is divided into 7 layers
-- 1st layer from 30000 to 30007 is indistructible morentir

minetest .register_ore({
  ore_type       = 'scatter',
  ore            = 'nssb:indistructible_morentir',

  wherein        = {  'default:water_source',
                      'default:water_flowing',

                      'default:lava_source',
                      'default:lava_flowing',

                      'air',
                      'default:stone',
                      'default:stone_with_coal',
                      'default:stone_with_copper',
                      'default:stone_with_iron',
                      'default:stone_with_gold',
                      'default:stone_with_diamond',
                      'default:stone_with_mese',
                      'default:mese_block',

                      'nssb:ant_dirt',
                      'default:dirt',
                      'default:gravel',
                      'default:sand',

                      'default:cobble',
                      'default:stonebrick',
                      'default:mossycobble',
                      'default:desert_stone',
                      'default:desert_cobble',
                      'default:desert_stonebrick',
                      'default:sandstone',
                      'default:sandstonebrick'  },

  clust_scarcity = 1,
  clust_num_ores = 1,
  clust_size     = 1,
  y_min          = -30044,
  y_max          = -30037,
})



if moreores then
    minetest .register_ore({
      ore_type       = 'scatter',
      ore            = 'nssb:indistructible_morentir',
      wherein        = {  'moreores:mineral_tin',
                          'moreores:mineral_silver',
                          'moreores:mineral_mithril'  },
      clust_scarcity = 1,
      clust_num_ores = 1,
      clust_size     = 1,
      y_min          = -30044,
      y_max          = -30037,
    })
end


-- 2nd layer from 30008 to 30028, is 'stalagmitic', have bats and morelentir

local function replace2( old, new )
  minetest .register_ore({
    ore_type       = 'scatter',
    ore            = new,
    wherein        = old,
    clust_scarcity = 1,
    clust_num_ores = 1,
    clust_size     = 1,
    y_min          = -30065,
    y_max          = -30045,
  })
end


replace2(  'default:stone',  'nssb:morentir'  )


replace2(  {  'default:stone_with_coal',
              'default:stone_with_copper',
              'default:stone_with_iron',
              'default:stone_with_gold',
              'default:stone_with_diamond',
              'default:stone_with_mese',
              'default:mese_block'  },  'nssb:morelentir'  )


replace2(  {  'default:dirt',
              'default:gravel',
              'default:sand'  },  'nssb:morelentir'  )


replace2(  {  'default:water_source',
              'default:water_flowing',
              'default:lava_source',
              'default:lava_flowing'},  'nssb:morelentir'  )


replace2(  {  'nssb:ant_dirt',
              'default:stone',
              'default:cobble',
              'default:stonebrick',
              'default:mossycobble',
              'default:desert_stone',
              'default:desert_cobble',
              'default:desert_stonebrick',
              'default:sandstone',
              'default:sandstonebrick' },  'nssb:morelentir' )


if moreores then
  replace2(  {  'moreores:mineral_tin',
                'moreores:mineral_silver',
                'moreores:mineral_mithril'},  'air' )
end


minetest .register_ore({
  ore_type        = 'blob',
  ore             = 'nssb:morvilya',
  wherein         = 'nssb:morentir',
  clust_scarcity  = 15 * 15 * 15,
  clust_size      = 6,
  y_min           = -30065,
  y_max           = -30045,
  noise_threshold = 0.0,
  noise_params    = {
    offset = 0.5,
    scale = 0.2,
    spread = { x = 5,  y = 5,  z = 5 },
    seed = 17676,
    octaves = 1,
    persist = 0.0
  },
})



minetest .register_ore({
    ore_type       = 'scatter',
    ore            = 'air',
    wherein        = 'nssb:morentir',
    clust_scarcity = 1,
    clust_num_ores = 1,
    clust_size     = 1,
    y_min          = -30066,
    y_max          = -30058,
  })


-- 3rd layer from 30029 to 30077 is made by air

minetest .register_ore({
  ore_type       = 'scatter',
  ore            = 'air',
  wherein        = {  'nssb:ant_dirt',  'default:stone',  'default:cobble',  'default:stonebrick',  'default:mossycobble',  'default:desert_stone',  'default:desert_cobble',  'default:desert_stonebrick',  'default:sandstone',  'default:sandstonebrick',  'default:water_source',  'default:water_flowing',  'default:gravel',  'default:dirt',  'default:sand',  'default:lava_source',  'default:lava_flowing',  'default:mese_block',  'default:stone',  'air',  'default:stone_with_coal',  'default:stone_with_iron',  'default:stone_with_mese',  'default:stone_with_diamond',  'default:stone_with_gold',  'default:stone_with_copper'  },
  clust_scarcity = 1,
  clust_num_ores = 1,
  clust_size     = 1,
  y_min          = -30093,
  y_max          = -30066,
})


if moreores then
  minetest .register_ore({
    ore_type       = 'scatter',
    ore            = 'air',
    wherein        = {  'moreores:mineral_tin',  'moreores:mineral_silver',  'moreores:mineral_mithril'  },
    clust_scarcity = 1,
    clust_num_ores = 1,
    clust_size     = 1,
    y_min          = -30093,
    y_max          = -30066,
  })
end


minetest .register_ore({
    ore_type        = 'blob',
    ore             = 'nssb:morelentir',
    wherein         = 'air',
    clust_scarcity  = 10 * 10 * 10,
    clust_size      = 3,
    y_min           = -30068,
    y_max           = -30065,
    noise_threshold = 0.0,
    noise_params    = {
      offset = 0.5,
      scale = 0.2,
      spread = { x = 5,  y = 5,  z = 5 },
      seed = 17676,
      octaves = 1,
      persist = 0.0
    },
  })


minetest .register_ore({
    ore_type        = 'blob',
    ore             = 'nssb:morelentir',
    wherein         = 'air',
    clust_scarcity  = 16 * 16 * 16,
    clust_size      = 6,
    y_min           = -30071,
    y_max           = -30065,
    noise_threshold = 0.0,
    noise_params    = {
      offset = 0.5,
      scale = 0.2,
      spread = { x = 5,  y = 5,  z = 5 },
      seed = 17676,
      octaves = 1,
      persist = 0.0
    },
  })


minetest .register_ore({
    ore_type        = 'blob',
    ore             = 'nssb:morvilya',
    wherein         = 'nssb:morentir',
    clust_scarcity  = 15 * 15 * 15,
    clust_size      = 6,
    y_min           = -30092,
    y_max           = -30066,
    noise_threshold = 0.0,
    noise_params    = {
      offset = 0.5,
      scale = 0.2,
      spread = { x = 5,  y = 5,  z = 5 },
      seed = 17676,
      octaves = 1,
      persist = 0.0
    },
  })


minetest .register_ore({
    ore_type        = 'blob',
    ore             = 'nssb:morentir',
    wherein         = 'air',
    clust_scarcity  = 13 * 13 * 13,
    clust_size      = 6,
    y_min           = -30095,
    y_max           = -30089,
    noise_threshold = 0.0,
    noise_params    = {
      offset = 0.5,
      scale = 0.2,
      spread = { x = 5,  y = 5,  z = 5 },
      seed = 17676,
      octaves = 1,
      persist = 0.0
    },
  })


minetest .register_ore({
    ore_type        = 'blob',
    ore             = 'nssb:morentir',
    wherein         = 'air',
    clust_scarcity  = 11 * 11 * 11,
    clust_size      = 5,
    y_min           = -30095,
    y_max           = -30090,
    noise_threshold = 0.0,
    noise_params    = {
      offset = 0.5,
      scale = 0.2,
      spread = { x = 5,  y = 5,  z = 5 },
      seed = 17676,
      octaves = 1,
      persist = 0.0
    },
  })


minetest .register_ore({
    ore_type        = 'blob',
    ore             = 'nssb:morentir',
    wherein         = 'air',
    clust_scarcity  = 10 * 10 * 10,
    clust_size      = 4,
    y_min           = -30095,
    y_max           = -30091,
    noise_threshold = 0.0,
    noise_params    = {
      offset = 0.5,
      scale = 0.2,
      spread = { x = 5,  y = 5,  z = 5 },
      seed = 17676,
      octaves = 1,
      persist = 0.0
    },
  })


minetest .register_ore({
    ore_type        = 'blob',
    ore             = 'nssb:morentir',
    wherein         = 'air',
    clust_scarcity  = 10 * 10 * 10,
    clust_size      = 10,
    y_min           = -30095,
    y_max           = -30089,
    noise_threshold = 0.0,
    noise_params    = {
      offset = 1,
      scale = 1,
      spread = { x = 1,  y = 1000,  z = 1 },
      seed = 17676,
      octaves = 1,
      persist = 0.0
    },
  })


--4th layer from  30078 to 30091 is a plain with mobs, fire, water...

local function replace4(old, new)
  for i = 1, 9 do
    minetest .register_ore({
      ore_type       = 'scatter',
      ore            = new,
      wherein        = old,
      clust_scarcity = 1,
      clust_num_ores = 1,
      clust_size     = 1,
      y_min          = -30107,
      y_max          = -30094,
    })
  end
end


replace4('default:stone',  'nssb:morentir')
replace4('default:stone_with_coal',  'nssb:mornen')
replace4('default:stone_with_iron',  'air')
replace4('default:stone_with_mese',  'air')
replace4('default:stone_with_diamond',  'air')
replace4('default:stone_with_gold',  'air')
replace4('default:stone_with_copper',  'air')
replace4('default:gravel',  'nssb:morkemen')
replace4('default:dirt',  'nssb:morkemen')
replace4('default:sand',  'nssb:morkemen')
replace4('default:lava_source',  'nssb:mornen')
replace4('default:lava_flowing',  'nssb:mornen_flowing')
replace4('default:water_source',  'nssb:mornen')
replace4('default:water_flowing',  'nssb:mornen_flowing')
replace4('default:mese_block', 'nssb:life_energy_ore')
replace4(  {'nssb:ant_dirt',  'default:stone',  'default:cobble',  'default:stonebrick',  'default:mossycobble',  'default:desert_stone',  'default:desert_cobble',  'default:desert_stonebrick',  'default:sandstone',  'default:sandstonebrick'},   'nssb:morkemen' )

if moreores then
  replace4(  {'moreores:mineral_tin',  'moreores:mineral_silver',  'moreores:mineral_mithril'},  'nssb:morentir' )
end


minetest .register_ore({
      ore_type       = 'scatter',
      ore            = 'nssb:morlote',
      wherein        = 'air',
      clust_scarcity = 7*7*7,
      clust_num_ores = 1,
      clust_size     = 1,
      y_min          = -30094,
      y_max          = -30093,
    })


minetest .register_ore({
      ore_type       = 'scatter',
      ore            = 'nssb:mornar',
      wherein        = 'air',
      clust_scarcity = 4*4*4,
      clust_num_ores = 1,
      clust_size     = 1,
      y_min          = -30094,
      y_max          = -30093,
    })


minetest .register_ore({
      ore_type       = 'scatter',
      ore            = 'nssm:morwa_statue',
      wherein        = 'air',
      clust_scarcity = 18*18*18,
      clust_num_ores = 1,
      clust_size     = 1,
      y_min          = -30094,
      y_max          = -30093,
    })

--5th layer from 30092 to 30140 is underground with caves

local function replace5(old, new)
    minetest .register_ore({
      ore_type       = 'scatter',
      ore            = new,
      wherein        = old,
      clust_scarcity = 1,
      clust_num_ores = 1,
      clust_size     = 1,
      y_min          = -30156,
      y_max          = -30108,
    })
end


minetest .register_ore({
    ore_type        = 'blob',
    ore             = 'nssb:fall_morentir',
    wherein         = 'air',
    clust_scarcity  = 16 * 16 * 16,
    clust_size      = 6,
    y_min           = -30204,
    y_max           = -30109,
    noise_threshold = 0.0,
    noise_params    = {
      offset = 0.5,
      scale = 0.2,
      spread = { x = 5,  y = 5,  z = 5 },
      seed = 17676,
      octaves = 1,
      persist = 0.0
    },
})


replace5('default:stone', 'nssb:morentir')
replace5('default:stone_with_coal', 'nssb:life_energy_ore')
replace5('default:stone_with_iron', 'nssb:morentir')
replace5('default:stone_with_mese', 'nssb:morentir')
replace5('default:stone_with_diamond', 'nssb:life_energy_ore')
replace5('default:stone_with_gold', 'nssb:life_energy_ore')
replace5('default:stone_with_copper', 'nssb:morentir')
replace5('default:gravel', 'nssb:morkemen')
replace5('default:dirt', 'nssb:morkemen')
replace5('default:sand', 'nssb:morkemen')
replace5('default:lava_source', 'nssb:morentir')
replace5('default:lava_flowing', 'nssb:morentir')
replace5('default:water_source', 'nssb:mornen')
replace5('default:water_flowing', 'nssb:mornen_flowing')
replace5('default:mese_block', 'nssb:life_energy_ore')
replace5(  {'nssb:ant_dirt',  'default:stone',  'default:cobble',  'default:stonebrick',  'default:mossycobble',  'default:desert_stone',  'default:desert_cobble',  'default:desert_stonebrick',  'default:sandstone',  'default:sandstonebrick'},  'nssb:morkemen' )


if moreores then
  replace5('moreores:mineral_tin',  'nssb:life_energy_ore')
  replace5('moreores:mineral_silver',  'nssb:morentir')
  replace5('moreores:mineral_mithril',  'nssb:moranga')
end
-- 6th layer from 30141 to 30189 is underground with other caves and the special metal


local function replace6(old, new)
    minetest .register_ore({
      ore_type       = 'scatter',
      ore            = new,
      wherein        = old,
      clust_scarcity = 1,
      clust_num_ores = 1,
      clust_size     = 1,
      y_min          = -30205,
      y_max          = -30157,
    })
end


replace6('default:stone', 'nssb:morentir')
replace6('default:stone_with_coal', 'nssb:life_energy_ore')
replace6('default:stone_with_iron', 'nssb:moranga')
replace6('default:stone_with_mese', 'nssb:moranga')
replace6('default:stone_with_diamond', 'nssb:life_energy_ore')
replace6('default:stone_with_gold', 'nssb:life_energy_ore')
replace6('default:stone_with_copper', 'nssb:moranga')
replace6('default:gravel', 'nssb:morkemen')
replace6('default:dirt', 'nssb:morkemen')
replace6('default:sand', 'nssb:morkemen')
replace6('default:lava_source', 'nssb:morentir')
replace6('default:lava_flowing', 'nssb:morentir')
replace6('default:water_source', 'nssb:mornen')
replace6('default:water_flowing', 'nssb:mornen_flowing')
replace6('default:mese_block', 'nssb:life_energy_ore')
replace6(  {'nssb:ant_dirt',  'default:stone',  'default:cobble',  'default:stonebrick',  'default:mossycobble',  'default:desert_stone',  'default:desert_cobble',  'default:desert_stonebrick',  'default:sandstone',  'default:sandstonebrick'},  'nssb:morkemen' )


if moreores then
  replace6('moreores:mineral_tin','nssb:life_energy_ore')
  replace6('moreores:mineral_silver','nssb:moranga')
  replace6('moreores:mineral_mithril','nssb:moranga')
end


minetest .register_ore({
      ore_type       = 'scatter',
      ore            = 'nssb:boum_morentir',
      wherein        = 'nssb:morentir',
      clust_scarcity = 13*13*13,
      clust_num_ores = 1,
      clust_size     = 1,
      y_min          = -30205,
      y_max          = -30157,
    })

-- 7th layer from 30190 to 30197 is indistructible

minetest.register_ore({
    ore_type       = 'scatter',
    ore            = 'nssb:indistructible_morentir',
    wherein        = {  'nssb:ant_dirt',  'default:stone',  'default:cobble',  'default:stonebrick',  'default:mossycobble',  'default:desert_stone',  'default:desert_cobble',  'default:desert_stonebrick',  'default:sandstone',  'default:sandstonebrick',  'default:water_source',  'default:water_flowing',  'default:gravel',  'default:dirt',  'default:sand',  'default:lava_source',  'default:lava_flowing',  'default:mese_block',  'default:stone',  'air',  'default:stone_with_coal',  'default:stone_with_iron',  'default:stone_with_mese',  'default:stone_with_diamond',  'default:stone_with_gold',  'default:stone_with_copper'  },
    clust_scarcity = 1,
    clust_num_ores = 1,
    clust_size     = 1,
    y_min          = -30213,
    y_max          = -30206,
})



if moreores then
    minetest .register_ore({
      ore_type       = 'scatter',
      ore            = 'nssb:indistructible_morentir',
      wherein        = {  'moreores:mineral_tin',  'moreores:mineral_silver',  'moreores:mineral_mithril'  },
      clust_scarcity = 1,
      clust_num_ores = 1,
      clust_size     = 1,
      y_min          = -30213,
      y_max          = -30206,
    })
end


minetest .register_ore({
    ore_type       = 'scatter',
    ore            = 'air',
    wherein        = {  'default:water_source',  'default:water_flowing',  'default:lava_source',  'default:lava_flowing'  },
    clust_scarcity = 1,
    clust_num_ores = 1,
    clust_size     = 1,
    y_min          = -30207,
    y_max          = -30045,
})



--Place the buildings in the morlendor
posmorvalarblock  = { x = 827,  y = -30094,  z = -817 }
posplace          = { x = 0,    y = -30093,  z = 0 }
posmemory         = { x = 0,    y = -30092,  z = 0 }


if posplace then
  if not minetest .get_node_or_nil(posplace) then
    minetest .emerge_area(  vector.subtract( posplace, 80),  vector.add( posplace, 80)  )
  end

  minetest .after(  5,  function(posplace)
    minetest .place_schematic(  posplace,  minetest .get_modpath('nssb') ..'/schems/memoportal.mts',  0,  {},  true  )
  end,  posplace  )
end


posarena  = { x = 777,  y = -30096,  z = -777 }

if posarena then
  --minetest.get_voxel_manip():read_from_map(posplace, posplace)
  if not minetest .get_node_or_nil(posarena) then
    minetest .emerge_area(  vector.subtract(posarena, 120),  vector.add(posarena, 120)  )
  end
  -- teleport the player
  minetest .after(  5,  function(posarena)
    minetest .place_schematic(  posarena,  minetest .get_modpath('nssb') ..'/schems/arena51.mts',  '0',  {},  true )

    minetest .place_schematic( { x = posarena.x,  y = -30096,  z = posarena.z -9 },  minetest .get_modpath('nssb') ..'/schems/arena52.mts',  '0',  {},  true  )

    minetest.place_schematic({x=posarena.x, y=-30096, z=posarena.z-18}, minetest.get_modpath('nssb')..'/schems/arena53.mts', '0', {}, true)

    minetest.place_schematic({x=posarena.x, y=-30096, z=posarena.z-27}, minetest.get_modpath('nssb')..'/schems/arena54.mts', '0', {}, true)

    minetest.place_schematic({x=posarena.x, y=-30096, z=posarena.z-36}, minetest.get_modpath('nssb')..'/schems/arena55.mts', '0', {}, true)

    minetest.place_schematic({x=posarena.x, y=-30096, z=posarena.z-45}, minetest.get_modpath('nssb')..'/schems/arena56.mts', '0', {}, true)

    minetest.place_schematic({x=posarena.x, y=-30096, z=posarena.z-54}, minetest.get_modpath('nssb')..'/schems/arena57.mts', '0', {}, true)

    minetest.place_schematic({x=posarena.x, y=-30096, z=posarena.z-63}, minetest.get_modpath('nssb')..'/schems/arena58.mts', '0', {}, true)

    minetest.place_schematic({x=posarena.x, y=-30096, z=posarena.z-72}, minetest.get_modpath('nssb')..'/schems/arena59.mts', '0', {}, true)

    minetest.place_schematic({x=posarena.x, y=-30096, z=posarena.z-81}, minetest.get_modpath('nssb')..'/schems/arena510.mts', '0', {}, true)

    minetest.place_schematic({x=posarena.x, y=-30096, z=posarena.z-90}, minetest.get_modpath('nssb')..'/schems/arena511.mts', '0', {}, true)

    local objects  = minetest.env :get_objects_inside_radius( posmorvalarblock, 90 )
    local found  = 0
    for _,obj in ipairs(objects) do
      local le = obj :get_luaentity()
      local le_name  = le .name
      if ( le and ( le_name == 'nssm:morvalar0' or le_name == 'nssm:morvalar1' or le_name == 'nssm:morvalar2' or le_name == 'nssm:morvalar3' or le_name == 'nssm:morvalar4' or le_name == 'nssm:morvalar5' or le_name == 'nssm:morvalar6' or le_name == 'nssm:morvalar' )) then
        found  = 1
      end
    end
    if found == 0 then
      minetest .set_node( posmorvalarblock,  { name = 'nssb:morvalar_block' })
    end
  end,  posarena )
end

-- ABM's  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

minetest .register_abm({
  nodenames = {'nssb:indistructible_morentir'},
  neighbors = {'nssb:mornar'},
  interval = 1.0,
  chance = 1,

  action = function(pos, node)
      minetest .place_schematic(posarena, minetest.get_modpath('nssb')..'/schems/arena51.mts', '0', {}, true)

      minetest.place_schematic({x=posarena.x, y=-30096, z=posarena.z-9}, minetest.get_modpath('nssb')..'/schems/arena52.mts', '0', {}, true)

      minetest.place_schematic({x=posarena.x, y=-30096, z=posarena.z-18}, minetest.get_modpath('nssb')..'/schems/arena53.mts', '0', {}, true)

      minetest.place_schematic({x=posarena.x, y=-30096, z=posarena.z-27}, minetest.get_modpath('nssb')..'/schems/arena54.mts', '0', {}, true)

      minetest.place_schematic({x=posarena.x, y=-30096, z=posarena.z-36}, minetest.get_modpath('nssb')..'/schems/arena55.mts', '0', {}, true)

      minetest.place_schematic({x=posarena.x, y=-30096, z=posarena.z-45}, minetest.get_modpath('nssb')..'/schems/arena56.mts', '0', {}, true)

      minetest.place_schematic({x=posarena.x, y=-30096, z=posarena.z-54}, minetest.get_modpath('nssb')..'/schems/arena57.mts', '0', {}, true)

      minetest.place_schematic({x=posarena.x, y=-30096, z=posarena.z-63}, minetest.get_modpath('nssb')..'/schems/arena58.mts', '0', {}, true)

      minetest.place_schematic({x=posarena.x, y=-30096, z=posarena.z-72}, minetest.get_modpath('nssb')..'/schems/arena59.mts', '0', {}, true)

      minetest.place_schematic({x=posarena.x, y=-30096, z=posarena.z-81}, minetest.get_modpath('nssb')..'/schems/arena510.mts', '0', {}, true)

      minetest.place_schematic({x=posarena.x, y=-30096, z=posarena.z-90}, minetest.get_modpath('nssb')..'/schems/arena511.mts', '0', {}, true)
    end
})


minetest.register_abm({
  nodenames = {'default:lava_source', 'default:lava_flowing', 'default:water_source', 'default:water_flowing'},
  neighbors = {'air'},
  interval = 2.0,
  chance = 1,
  action = function(pos, node)
      if pos.y < -30000 then
        minetest.remove_node(pos)
      end
  end
})


minetest.register_abm({
  nodenames = {'default:torch'},
  neighbors = {'nssb:morentir','nssb:morkemen'},
  interval = 1.0,
  chance = 1,
  action = function(pos, node)
      minetest.set_node({x = pos.x, y = pos.y , z = pos.z}, {name = 'nssb:mornar'})
    end
})


minetest.register_abm({
  nodenames = {'nssb:morlote'},
  neighbors = {'air'},
  interval = 60,
  chance = 100,
  action =
  function(pos, node)
    local pos1 = {x=pos.x, y=pos.y+1, z=pos.z}
    local n = minetest.env:get_node(pos1).name
    if n ~= 'air' then
      return
    end
    minetest.add_entity(pos1, 'nssm:morgre')
    minetest.remove_node(pos)
  end
})


minetest .register_abm(  {
  nodenames = { 'nssb:fall_morentir' },
  neighbors = { 'nssb:fall_morentir' },
  interval = 1,
  chance = 1,
  action =
  function( pos,  node )
    for _, obj in ipairs( minetest .get_objects_inside_radius(pos, 7)) do
      if obj :is_player() then
        nodeupdate(pos)
      end
    end
  end
}) -- .register_abm( fall )


minetest .register_abm(  {
  nodenames = { 'nssb:boum_morentir' },
  neighbors = { 'nssb:morentir' },
  interval = 1,
  chance = 1,
  action =
  function(pos, node)
    for _, obj in ipairs( minetest .get_objects_inside_radius( pos, 5 )) do
      if obj :is_player() then
        explosion( pos,  3,  0,  1 )
      end
    end
  end
}) -- .register_abm( bomb )


minetest.register_abm({
  nodenames = { 'nssb:mornen',  'nssb:mornen_flowing' },
  neighbors = { 'air' },
  interval = 1.0,
  chance = 5,
  action =
    function( pos,  node )
      minetest .add_particlespawner({
        amount = 1,
        time = 2,
        minpos = {x=pos.x-0.5, y=pos.y+0.5, z=pos.z-0.5},
        maxpos = {x=pos.x+0.5, y=pos.y+0.5, z=pos.z+0.5},
        minvel = {x=0, y=0.1, z=0},
        maxvel = {x=0, y=0.3, z=0},
        minacc = {x=0,y=0,z=0},
        maxacc = {x=0,y=0,z=0},
        minexptime = 1,
        maxexptime = 1.2,
        minsize = 0.5,
        maxsize = 0.7,
        collisiondetection = false,
        vertical = true,
        texture = 'morparticle.png',
      })
    end
})


minetest .register_abm({
  nodenames = { 'nssb:portal' },
  neighbors = { 'air' },
  interval = 1,
  chance = 1,
  action =
    function ( pos, node )
      minetest .add_particlespawner({
        amount = 3,
        time = 1,
        minpos = {x=pos.x-0.5, y=pos.y+0.5, z=pos.z-0.5},
        maxpos = {x=pos.x+0.5, y=pos.y+0.5, z=pos.z+0.5},
        minvel = {x=0, y=0.1, z=0},
        maxvel = {x=0, y=0.8, z=0},
        minacc = {x=0,y=0,z=0},
        maxacc = {x=0,y=0.4,z=0},
        minexptime = 1,
        maxexptime = 3,
        minsize = 0.5,
        maxsize = 1.4,
        collisiondetection = false,
        vertical = true,
        texture = 'morparticle.png',
      })
    end
}) -- register_abm( portal  add_particlespawner )


minetest .register_abm({
  nodenames = {'nssb:portal'},
  neighbors = {'air'},
  interval = 7,
  chance = 1,
  action =
    function( pos,  node )
      for _, obj in ipairs( minetest .get_objects_inside_radius( pos, 1 )) do
        if obj :is_player() then
          local pos1 = posmemory
          local meta = minetest .get_meta(pos1)
          -- timer is saved inside a position because for me the tonumber function doesn't work
          local timer_pos = minetest .string_to_pos( meta :get_string('player_timer'..obj :get_player_name() ))
          if not timer_pos or ((timer_pos) and ((os.time() - timer_pos.x) >= 30)) then
            local posp = obj :getpos()
            -- minetest .chat_send_all('Posizione: '..minetest.pos_to_string(posp))

            obj :setpos( { x = 5,  y = pos1.y +2,  z = 5 })
            meta :set_string( 'player'..obj :get_player_name(),  minetest .pos_to_string(posp))
            timer_pos = { x = os.time(),  y = 0,  z = 0 }
            meta :set_string( 'player_timer'..obj :get_player_name(),  minetest .pos_to_string(timer_pos) )
          end
        end
      end
    end
}) -- .register_abm( portal )


minetest .register_abm(  {
  nodenames = { 'nssb:portalhome' },
  neighbors = { 'air' },
  interval = 1,
  chance = 1,
  action =
    function( pos,  node )
      minetest .add_particlespawner({
        amount = 3,
        time = 1,
        minpos = {x=pos.x-0.5, y=pos.y+0.5, z=pos.z-0.5},
        maxpos = {x=pos.x+0.5, y=pos.y+0.5, z=pos.z+0.5},
        minvel = {x=0, y=0.1, z=0},
        maxvel = {x=0, y=0.8, z=0},
        minacc = {x=0,y=0,z=0},
        maxacc = {x=0,y=0.4,z=0},
        minexptime = 1,
        maxexptime = 3,
        minsize = 0.5,
        maxsize = 1.4,
        collisiondetection = false,
        vertical = true,
        texture = 'earth_particle.png',
      })
    end
}) -- .register_abm( portalhome  add_particlespawner )


minetest .register_abm( {
  nodenames = { 'nssb:portalhome' },
  neighbors = { 'air' },
  interval = 7,
  chance = 2,
  action =
    function( pos,  node )
      for _,obj in ipairs( minetest .get_objects_inside_radius( pos,  1 )) do
        if obj :is_player() then
          local pos1 = posmemory
          local meta = minetest .get_meta( pos1 )
          --the timer is saved inside a position because for me the tonumber function doesn't work
          local timer_pos = minetest .string_to_pos( meta :get_string('player_timer' ..obj :get_player_name()))

          if not timer_pos or ((timer_pos) and ((os.time() - timer_pos.x) >= 30)) then

            local name = minetest .env :get_node(pos1) .name

            local target = minetest .string_to_pos( meta :get_string('player' ..obj :get_player_name()))
            if target then
              obj :setpos({ x = target.x,  y = target.y+1,  z = target.z })
              timer_pos = { x = os.time(),  y = 0,  z = 0 }
              meta :set_string( 'player_timer' ..obj :get_player_name(), minetest .pos_to_string(timer_pos) )
            end
          end
        end
      end
    end
}) -- .register_abm( portalhome )

