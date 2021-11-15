AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

util.AddNetworkString("play_audioOldSpeaks")

ENT.PointA = Vector(241.298355, 895.985291, 196.031250)
ENT.PointB = Vector(189.883087, 825.285217, 96.031250)

function ENT:Initialize()
  self:SetSolid( SOLID_BBOX )
  self:SetCollisionBoundsWS( self.PointA, self.PointB )

  -- self:SetTrigger(true)
end

function ENT:StartTouch(entity)
  local Trigger = ents.Create( "trigger_girlSpeaks1" )
  Trigger:Spawn()

  net.Start("play_audioOldSpeaks")
  net.Broadcast()

  player.GetAll()[1]:ChatPrint("Traeme un neumatico para dejarte pasar ")

end

function ENT:EndTouch(entity)
  ents.FindByClass( "trigger_oldManSpeaks1" )[1]:Remove()
end

function ENT:Touch(entity)

end