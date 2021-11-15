AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

util.AddNetworkString("play_audioDie")

ENT.PointA = Vector(128.905853, -223.968750, 196.031250)
ENT.PointB = Vector(305.438141, -128.007889, 32.031250)

function ENT:Initialize()
  self:SetSolid( SOLID_BBOX )
  self:SetCollisionBoundsWS( self.PointA, self.PointB )

  -- self:SetTrigger(true)
end

function ENT:StartTouch(entity)
  player.GetAll()[1]:ChatPrint("PARTE 3: 'El regreso'")
  player.GetAll()[1]:ChatPrint("'La negativa al regreso': Por una u otra razón el héroe se niega a regresar a su mundo normal.")
  local Trigger = ents.Create( "trigger_End" )
  Trigger:Spawn()

  local Trigger2 = ents.Create( "ent_invisibleWall3" )
  Trigger2:Spawn()

  player.GetAll()[1]:Kill()


end

function ENT:EndTouch(entity)
  ents.FindByClass( "trigger_die" )[1]:Remove()
  player.GetAll()[1]:ChatPrint("'El cruce del umbral del regreso': Una vez terminada la aventura y el héroe regresa a su  mundo normal con conocimiento nuevo de la aventura. ")
end

function ENT:Touch(entity)
  
end