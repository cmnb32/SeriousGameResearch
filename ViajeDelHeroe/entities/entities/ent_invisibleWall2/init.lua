AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

util.AddNetworkString("play_audioDestroyWall")

-- INVISIBLE WALL 2
-- 338.612244 802.031250 96.031250;setang 71.444023 92.836777 0.000000
-- 373.364044 893.986389 96.031250;setang 67.352020 92.836632 0.000000

ENT.PointA = Vector(338.612244, 802.031250, 196.031250)
ENT.PointB = Vector(373.364044, 893.986389, 32.031250)

function ENT:Initialize()
  self:SetSolid( SOLID_BBOX )
  self:SetCollisionBoundsWS( self.PointA, self.PointB )

  self:SetTrigger(true)
end

function ENT:StartTouch(entity)
  -- print(entity:GetClass())
  if ( entity:IsPlayer() ) then
    player.GetAll()[1]:ChatPrint("NO PUEDES PASAR")
    
  elseif ( entity:GetClass() == "ent_tire1" ) then
    player.GetAll()[1]:ChatPrint("PARTE 2: 'La iniciación'")
    player.GetAll()[1]:ChatPrint("'El camino de las pruebas': Acabas de completar la primera prueba como el héroe de esta aventura")
    -- print(entity:GetClass())
    ents.FindByClass( "ent_tire1" )[1]:Remove()
    ents.FindByClass( "npc_combine_s" )[1]:Remove()
    ents.FindByClass( "ent_invisibleWall2" )[1]:Remove()

    local nextTrigger = ents.Create("trigger_encuentroConDiosa")
    nextTrigger:Spawn()

    net.Start("play_audioDestroyWall")
    net.Broadcast()
    
  end

end

function ENT:EndTouch(entity)
  if ( entity:GetClass() == "npc_combine_s" ) then
    -- print(entity:GetClass())
    ents.FindByClass( "npc_combine_s" )[1]:Remove()
  end
end

function ENT:Touch(entity)

end