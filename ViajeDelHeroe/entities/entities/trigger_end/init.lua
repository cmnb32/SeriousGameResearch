AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

util.AddNetworkString("play_audioEnd")

ENT.PointA = Vector(623.968750, -63.968750, 196.031250)
ENT.PointB = Vector(553.429810, 19.586519, 32.031250)

function ENT:Initialize()
  self:SetSolid( SOLID_BBOX )
  self:SetCollisionBoundsWS( self.PointA, self.PointB )

  -- self:SetTrigger(true)
end

function ENT:StartTouch(entity)
  player.GetAll()[1]:ChatPrint("'El amo de dos mundos': El héroe tiene lo mejor de los dos mundos y al final siente un equilibrio entre los dos mundos. Puede ser un equilibrio espiritual y mental también. ")
  
  -- player.GetAll()[1]:SetWalkSpeed(2)

end

function ENT:EndTouch(entity)
  net.Start("play_audioEnd")
  net.Broadcast()
end

function ENT:Touch(entity)

  
end