local round_status = 0 -- 0 = end  1 = active
local active_round = 1

util.AddNetworkString("UpdateRoundStatus")


function spawnObjects()
    


    -- local girl = ents.Create( "npc_combine_s" )
    -- girl:SetModel( "models/pacagma/seishun_buta_yarou_wa_bunny_girl_senpai_no_yume_wo_minai/mai_sakurajima_school/mai_sakurajima_school_npc.mdl" )
    -- girl:SetPos( Vector( 446.268433, 418.233307, 193.031250 ) )
    -- girl:Spawn()

    
    -- 111.993042 53.533237 96.031250;setang 89.000000 -176.626099 0.000000
    -- 30.651245 19.532738 96.031250;setang 43.064392 2.305714 0.000000
    local Trigger = ents.Create( "trigger_beginStory" )
	Trigger:Spawn()

    --invisible wall 1
    local wall1 = ents.Create("ent_invisibleWall1")
    wall1:Spawn()

    -- Tire 1
    local tire1 = ents.Create("ent_tire1")
    tire1:SetPos(Vector( 177.85, 203.93, 32.03 ))
    tire1:Spawn()

    -- Invisible wall 2
    local wall1 = ents.Create("ent_invisibleWall2")
    wall1:Spawn()

end

function beginStory()

    round_status = 1
    spawnObjects()
    updateClientRoundStatus()

end

function endRound()

    round_status = 0
    updateClientRoundStatus()


end

function getRoundStatus()

    return round_status

end

function updateClientRoundStatus()

    net.Start("UpdateRoundStatus")
    net.WriteInt(round_status , 4)
    net.Broadcast()

end