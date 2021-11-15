include("shared.lua")


function playAventuraGirl2()
    local g_station = nil
    sound.PlayURL ( "https://superkabuzan32.000webhostapp.com/11_girlSpeaks2.mp3", "3d", function( station )
        if ( IsValid( station ) ) then

            station:SetPos( Vector(408.078735, -10.990854, 96.031250) )
        
            station:Play()

            -- Keep a reference to the audio object, so it doesn't get garbage collected which will stop the sound
            g_station = station
        
        else

            LocalPlayer():ChatPrint( "Invalid URL!" )

        end
    end )
end

net.Receive("play_audioGirl2", playAventuraGirl2)