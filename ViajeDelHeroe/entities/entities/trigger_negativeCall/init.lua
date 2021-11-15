AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

util.AddNetworkString("play_audio2")

ENT.PointA = Vector(265.889740, 106.031250, 196.031250)
ENT.PointB = Vector(357.783997, 143.968750, 96.031250)

function ENT:Initialize()
  self:SetSolid( SOLID_BBOX )
  self:SetCollisionBoundsWS( self.PointA, self.PointB )

  -- self:SetTrigger(true)
end

function ENT:StartTouch(entity)
  player.GetAll()[1]:ChatPrint("'La negativa al llamado': En esta fase el héroe se niega a enfrentarse a la aventura que se le presentó ")

  net.Start("play_audio2")
  net.Broadcast()

end

function ENT:EndTouch(entity)
  ents.FindByClass( "trigger_negativeCall" )[1]:Remove()
end

function ENT:Touch(entity)

end