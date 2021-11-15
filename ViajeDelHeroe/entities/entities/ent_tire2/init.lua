AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")



include("shared.lua")

util.AddNetworkString("play_audioFinalTest")
-- util.AddNetworkString("play_audio2")

-- Vector( 177.85, 203.93, 32.03 )

function ENT:Initialize()
  self:SetModel("models/props_vehicles/carparts_tire01a.mdl")
  self:PhysicsInit(SOLID_VPHYSICS)
  self:SetMoveType(MOVETYPE_VPHYSICS)
  self:SetSolid(SOLID_VPHYSICS)

  -- self:SetPos(Vector( 177.85, 203.93, 32.03 ))

  local phys = self:GetPhysicsObject()
  if phys:IsValid() then
    phys:Wake()
  end

  self:SetTrigger(true)

end



function ENT:StartTouch(entity)
  if ( entity:GetClass() == "npc_zombie" ) then
    player.GetAll()[1]:ChatPrint("'Apoteosis': El héroe sufre una gran pérdida. Puede ser de un ser querido o inclusive el ánimo, etc.")
    player.GetAll()[1]:ChatPrint("'La gracia ultima': El héroe ha vencido las pruebas y ha logrado un gran objetivo (¿o no?). Puede haber fallado en algún punto  ")
    -- print(entity:GetClass())
    ents.FindByClass( "ent_tire2" )[1]:Remove()
    ents.FindByClass( "npc_zombie" )[1]:Remove()

    player.GetAll()[1]:SetWalkSpeed(30)

    local Trigger = ents.Create( "trigger_die" )
    Trigger:Spawn()

    net.Start("play_audioFinalTest")
    net.Broadcast()
  end
end

function ENT:EndTouch(entity)

end

function ENT:Touch(entity)

end