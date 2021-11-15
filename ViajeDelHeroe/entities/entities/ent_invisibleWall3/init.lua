AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")


ENT.PointA = Vector(535.005310, 106.031250, 196.031250)
ENT.PointB = Vector(570.968750, 95.732277, 32.031250)

function ENT:Initialize()
  self:SetSolid( SOLID_BBOX )
  self:SetCollisionBoundsWS( self.PointA, self.PointB )

  self:SetTrigger(true)
end

function ENT:StartTouch(entity)
  -- print(entity:GetClass())
  if ( entity:IsPlayer() ) then
    player.GetAll()[1]:ChatPrint("Aquí termina la aventura, gracias por jugar")
    
  end

end

function ENT:EndTouch(entity)

end

function ENT:Touch(entity)

end