
-- util.AddNetworkString("open_lobby")
-- util.AddNetworkString("start_game")

function enterLobby()

    net.Start("open_lobby")
    net.Broadcast()

end

net.Receive("start_game",function (len , ply)

    beginStory()
    -- ply:GiveLoadout()


end )

hook.Add("PlayerInitialSpawn","OpenPlayerLobby",enterLobby)