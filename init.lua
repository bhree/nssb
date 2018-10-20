-- Nssb
nssb = {}

local path  = minetest .get_modpath( 'nssb' )

dofile(  path ..'/inorganic_nodes.lua' )
dofile(  path ..'/organic_nodes.lua' )
dofile(  path ..'/mapgen.lua' )
dofile(  path ..'/spawn.lua' )
