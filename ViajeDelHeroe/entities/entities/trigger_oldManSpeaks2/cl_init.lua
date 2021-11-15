include("shared.lua")


function playAventura8()
    local g_station = nil
    sound.PlayURL ( "https://superkabuzan32.000webhostapp.com/12_OldManSpeaks2.mp3", "mono", function( station )
        if ( IsValid( station ) ) then

            station:SetPos( LocalPlayer():GetPos() )
        
            station:Play()

            -- Keep a reference to the audio object, so it doesn't get garbage collected which will stop the sound
            g_station = station
        
        else

            LocalPlayer():ChatPrint( "Invalid URL!" )

        end
    end )
end

net.Receive("play_audio8", playAventura8)