include("shared.lua")


function playAventuraWallDes()
    local g_station = nil
    sound.PlayURL ( "https://superkabuzan32.000webhostapp.com/09_invisibleWall2Disappear.mp3", "3d", function( station )
        if ( IsValid( station ) ) then

            station:SetPos( Vector(311.284485, 854.520081, 96.031250) )
        
            station:Play()

            -- Keep a reference to the audio object, so it doesn't get garbage collected which will stop the sound
            g_station = station
        
        else

            LocalPlayer():ChatPrint( "Invalid URL!" )

        end
    end )
end

net.Receive("play_audioDestroyWall", playAventuraWallDes)