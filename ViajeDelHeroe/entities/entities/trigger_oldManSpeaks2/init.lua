AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

util.AddNetworkString("play_audio8")

-- This trigger plays an audio that tells the main character that he really likes his tire. Aster a time he will give him the tire. 

-- OLD MAN SPEAKS 2 Trigger
-- setpos 949.202759 801.033264 96.031250;setang 81.871979 -177.690887 0.000000
-- 1007.968750 909.457092 96.031250;setang 73.423935 6.484978 0.000000

--LA LLANTA
-- 134.734879 857.629700 96.031250;setang 27.292103 -0.451350 0.000000

-- 809.767578 844.448608 96.031250;setang 46.099834 0.112870 0.000000

ENT.PointA = Vector(949.202759, 801.033264, 196.031250)
ENT.PointB = Vector(809.767578, 844.448608, 96.031250)

function ENT:Initialize()
  self:SetSolid( SOLID_BBOX )
  self:SetCollisionBoundsWS( self.PointA, self.PointB )

  -- self:SetTrigger(true)
end

function ENT:StartTouch(entity)
  player.GetAll()[1]:ChatPrint("Segunda Prueba: Elimina al zombie con el neumático mágico elimina zombies tocandolo con la misma. ")
  
  --The old man dont want to give the tire again.
  net.Start("play_audio8")
  net.Broadcast()

  local tire = ents.Create( "ent_tire2" )
  tire:SetPos(Vector(809.767578, 844.448608, 96.031250))
  tire:Spawn()

end

function ENT:EndTouch(entity)
  ents.FindByClass( "trigger_oldManSpeaks2" )[1]:Remove()
end

function ENT:Touch(entity)

end