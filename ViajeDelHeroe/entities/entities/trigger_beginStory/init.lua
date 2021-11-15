AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

util.AddNetworkString("play_audio1")

-- 109.968750 152.821213 96.031258;setang 63.096210 2.548603 0.000000
--  16.031250 207.805939 96.031258;setang 69.036331 178.636765 0.000000


ENT.PointA = Vector(109.968750, 152.821213, 196.031250)
ENT.PointB = Vector(16.031250, 207.80593, 96.031250)

function ENT:Initialize()
  self:SetSolid( SOLID_BBOX )
  self:SetCollisionBoundsWS( self.PointA, self.PointB )

  -- self:SetTrigger(true)
end

function ENT:StartTouch(entity)
  player.GetAll()[1]:ChatPrint("PARTE 1: 'El llamado a la aventura' ")
  if ( entity:IsPlayer() ) then
    net.Start("play_audio1")
    net.Broadcast()

    local Trigger = ents.Create( "trigger_negativeCall" )
    Trigger:Spawn()

    local Trigger = ents.Create( "trigger_cruceUmbral" )
    Trigger:Spawn()
  end

end

function ENT:EndTouch(entity)
  ents.FindByClass( "trigger_beginStory" )[1]:Remove()
end

function ENT:Touch(entity)

end