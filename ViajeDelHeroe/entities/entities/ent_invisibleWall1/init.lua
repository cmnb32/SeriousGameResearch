AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

util.AddNetworkString("play_audioNoPasar")
-- INVISIBLE WALL 2
-- 110.551544 77.404266 96.031250
-- 30.567669 31.422930 96.103325;setang 53.460060 172.417953 0.000000


ENT.PointA = Vector(110.551544, 77.404266, 196.031250)
ENT.PointB = Vector(30.567669, 31.422930, 96.031250)

function ENT:Initialize()
  self:SetSolid( SOLID_BBOX )
  self:SetCollisionBoundsWS( self.PointA, self.PointB )

  self:SetTrigger(true)
end

function ENT:StartTouch(entity)
  if ( entity:IsPlayer() ) then
    player.GetAll()[1]:ChatPrint("NO PUEDES PASAR")
    net.Start("play_audioNoPasar")
    net.Broadcast()
  end
  

end

function ENT:EndTouch(entity)

end

function ENT:Touch(entity)

end