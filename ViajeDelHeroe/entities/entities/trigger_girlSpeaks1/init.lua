AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

util.AddNetworkString("play_audio5")

ENT.PointA = Vector(168.361084, 104.031250, 196.031250)
ENT.PointB = Vector(238.905945, 143.049881, 96.031250)

function ENT:Initialize()
  self:SetSolid( SOLID_BBOX )
  self:SetCollisionBoundsWS( self.PointA, self.PointB )

  -- self:SetTrigger(true)
end

function ENT:StartTouch(entity)
  player.GetAll()[1]:ChatPrint("Ven aca, te dare una ayuda sobrenatural. Ve a la cocina para recibir una herramienta ")

  -- GIRLS POSITION
  -- 408.078735 -10.990854 96.031250;setang 37.124065 90.628174 0.000000
  local girl = ents.Create( "npc_combine_s" )
  girl:SetModel( "models/pacagma/seishun_buta_yarou_wa_bunny_girl_senpai_no_yume_wo_minai/mai_sakurajima_school/mai_sakurajima_school_npc.mdl" )
  girl:SetPos( Vector( 408.078735, -10.990854, 96.031250 ) )
  girl:Spawn()

  local Trigger = ents.Create( "trigger_giveWeapon" )
  Trigger:Spawn()

  net.Start("play_audio5")
  net.Broadcast()

end

function ENT:EndTouch(entity)
  ents.FindByClass( "trigger_girlSpeaks1" )[1]:Remove()
end

function ENT:Touch(entity)

end