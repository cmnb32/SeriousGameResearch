AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

util.AddNetworkString("play_audio5")

-- GIVE WEAPON Trigger
-- 203.363190 -9.660568 96.031250;setang 79.200432 93.100098 0.000000
-- 247.389481 61.985760 96.031250;setang 89.000000 -99.884048 0.000000


ENT.PointA = Vector(203.363190, -9.660568, 196.031250)
ENT.PointB = Vector(247.389481, 61.985760, 96.031250)

function ENT:Initialize()
  self:SetSolid( SOLID_BBOX )
  self:SetCollisionBoundsWS( self.PointA, self.PointB )

  -- self:SetTrigger(true)
end

function ENT:StartTouch(entity)
  player.GetAll()[1]:ChatPrint("Haciendo clic izquierdo podras levantar neumáticos ")

  local gun = ents.Create("weapon_physgun")
  gun:SetPos(player.GetAll()[1]:GetPos())
  gun:Spawn()

end

function ENT:EndTouch(entity)
  player.GetAll()[1]:ChatPrint("'La ayuda sobrenatural': Acabas de encontrarte con una mentora (muy linda por cierto) que te ha dado una herramienta que te ayudará en la aventura. ")
  ents.FindByClass( "trigger_giveWeapon" )[1]:Remove()
end

function ENT:Touch(entity)

end