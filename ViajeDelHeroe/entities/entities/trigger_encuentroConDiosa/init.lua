AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

util.AddNetworkString("play_audio6")

-- This trigger is for listening the main character remembering the girl (Ayuda sobre natural). He thinks that she is vute and probably hi is in love with her.

ENT.PointA = Vector(583.191895, 827.723328, 196.031250)
ENT.PointB = Vector(627.249146, 895.968750, 36.031250)

function ENT:Initialize()
  self:SetSolid( SOLID_BBOX )
  self:SetCollisionBoundsWS( self.PointA, self.PointB )

  -- self:SetTrigger(true)
end

function ENT:StartTouch(entity)
  player.GetAll()[1]:ChatPrint("'El encuentro con la diosa': En esta fase el héroe experimenta un sentiemiento de amor. En este caso a un personaje, pero podría ser hacía cualquier cosa; un objeto por ejemplo. ")

  -- Disappear the previous girl npc

  -- Creates a new girl after the big door
  local girl2 = ents.Create("npc_combine_s")
  girl2:SetModel( "models/pacagma/seishun_buta_yarou_wa_bunny_girl_senpai_no_yume_wo_minai/mai_sakurajima_school/mai_sakurajima_school_npc.mdl" )
  -- 963.395142 338.206421 96.031250;setang 24.024097 89.211845 0.000000
  girl2:SetPos( Vector( 963.395142, 338.206421, 96.031250 ) )
  -- girl2:SetAngles(Vector(-130, 90, 0):Angle()) --Por definir
  girl2:Spawn()

  -- Create the next trigger
  local Trigger = ents.Create( "trigger_girlSpeaks2" )
  Trigger:Spawn()

  -- Sends a msg to the client. This should execute the sixth audio file
  net.Start("play_audio6")
  net.Broadcast()

end

function ENT:EndTouch(entity)
  ents.FindByClass( "trigger_encuentroConDiosa" )[1]:Remove()

end

function ENT:Touch(entity)

end