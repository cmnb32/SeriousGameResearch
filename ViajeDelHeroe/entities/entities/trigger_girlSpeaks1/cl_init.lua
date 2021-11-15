include("shared.lua")


function playAventura5()
    local g_station = nil
    sound.PlayURL ( "https://superkabuzan32.000webhostapp.com/07_girlSpeaks1.mp3", "3d", function( station )
        if ( IsValid( station ) ) then

            -- Position of the girl
            -- 408.078735 -10.990854 96.031250;setang 37.124065 90.628174 0.000000
            station:SetPos( Vector(408.078735, -10.990854, 96.031250) )
        
            station:Play()

            -- Keep a reference to the audio object, so it doesn't get garbage collected which will stop the sound
            g_station = station
        
        else

            LocalPlayer():ChatPrint( "Invalid URL!" )

        end
    end )
end

net.Receive("play_audio5", playAventura5)