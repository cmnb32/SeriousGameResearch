--[[---------------------------------------------------------

  El vieje del heroe Gamemode

  This is GMod's default gamemode

-----------------------------------------------------------]]

-- include( "player_extension.lua" )
-- include( "persistence.lua" )
-- include( "save_load.lua" )
include( "player_class/player_sandbox.lua" )
-- include( "drive/drive_sandbox.lua" )
-- include( "editor_player.lua" )

--
-- Make BaseClass available
--
-- DEFINE_BASECLASS( "gamemode_base" )

GM.Name 	= "El viaje del heroe"
GM.Author 	= "Carlos Miguel Negrete"
GM.Email 	= "cmnb981@gmail.com"
-- GM.Website 	= "www.garrysmod.com"

--[[
 Note: This is so that in addons you can do stuff like

 if ( !GAMEMODE.IsSandboxDerived ) then return end

--]]

GM.IsSandboxDerived = true

-- cleanup.Register( "props" )
-- cleanup.Register( "ragdolls" )
-- cleanup.Register( "effects" )
-- cleanup.Register( "npcs" )
-- cleanup.Register( "constraints" )
-- cleanup.Register( "ropeconstraints" )
-- cleanup.Register( "sents" )
-- cleanup.Register( "vehicles" )

function GM: Initialize()
	self.BaseClass.Initialize(self)
end
