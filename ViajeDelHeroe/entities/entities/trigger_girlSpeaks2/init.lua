AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

util.AddNetworkString("play_audio7")
-- This trigger play an audio that tells the main character that there are zombies and he need the tire. Zombies are also spawned. 

-- GIRL SPEAKS 2 Trigger
-- 967.931641 394.899780 96.804527;setang 84.216324 -149.911240 0.00000
-- 912.026794 452.477417 96.031250;setang 62.864014 177.352768 0.000000

ENT.PointA = Vector( 967.931641, 394.899780, 196.031250)
ENT.PointB = Vector(912.026794, 452.477417, 96.031250)

function ENT:Initialize()
  self:SetSolid( SOLID_BBOX )
  self:SetCollisionBoundsWS( self.PointA, self.PointB )

  -- self:SetTrigger(true)
end

function ENT:StartTouch(entity)
  player.GetAll()[1]:ChatPrint("'El camino de las pruebas': Esta es una segunda prueba tu aventura como el héroe ")
  -- SPAWNS ZOMBIE
  -- 958.182678 280.446106 96.031250;setang 41.070087 -89.574951 -0.012638
  local zombie = ents.Create( "npc_zombie" )
  zombie:SetPos( Vector( 958.182678, 280.446106, 96.031250)) 
  zombie:SetAngles(Vector(8.314647, 92.439140, -0.000746):Angle())
  zombie:Spawn()

  local Trigger = ents.Create( "trigger_oldManSpeaks2" )
  Trigger:Spawn()

  -- Spawns the zombies that are going to kill the girl
  net.Start("play_audioGirl2")
  net.Broadcast()

end

function ENT:EndTouch(entity)
  ents.FindByClass( "trigger_girlSpeaks2" )[1]:Remove()
  -- if ents.FindByClass( "trigger_negativeCall" )[1]:IsValid() then
  --   ents.FindByClass( "trigger_negativeCall" )[1]:Remove()
  -- end
end

function ENT:Touch(entity)

end