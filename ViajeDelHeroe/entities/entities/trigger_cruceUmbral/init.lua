AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

util.AddNetworkString("play_audio3")

ENT.PointA = Vector(16.000179, 638.948669, 196.031250)
ENT.PointB = Vector(111.999016, 529.954041, 96.031250)

function ENT:Initialize()
  self:SetSolid( SOLID_BBOX )
  self:SetCollisionBoundsWS( self.PointA, self.PointB )

  -- self:SetTrigger(true)
end

function ENT:StartTouch(entity)
  player.GetAll()[1]:ChatPrint("'El cruce del primer umbral': En esta fase el héroe finalmente cruza a ese mundo no ordinario que se le presentó. ")

  -- Old Man NPC
    -- npc_gman
    -- 311.284485 854.520081 96.031250;setang 72.204262 -177.402939 0.000000
  local oldMan = ents.Create( "npc_gman" )
  oldMan:SetPos( Vector( 311.284485, 854.520081, 96.031250 ) )
  oldMan:SetAngles(Vector(-130, 90, 0):Angle())
  print(oldMan:GetClass())
  oldMan:Spawn()

  local Trigger = ents.Create( "trigger_oldManSpeaks1" )
  Trigger:Spawn()

  net.Start("play_audio3")
  net.Broadcast()

end

function ENT:EndTouch(entity)
  ents.FindByClass( "trigger_cruceUmbral" )[1]:Remove()
  if ents.FindByClass( "trigger_negativeCall" )[1]:IsValid() then
    ents.FindByClass( "trigger_negativeCall" )[1]:Remove()
  end
end

function ENT:Touch(entity)

end