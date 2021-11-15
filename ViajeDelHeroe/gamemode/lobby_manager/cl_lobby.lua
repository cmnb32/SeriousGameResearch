surface.CreateFont( "InsFont", {
	font = "Arial", --  Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 40,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

function playInstructions()
    local g_station = nil
    sound.PlayURL ( "https://superkabuzan32.000webhostapp.com/01_StoryBegins.mp3", "mono", function( station )
        if ( IsValid( station ) ) then

            LocalPlayer():ChatPrint("Primera parte: 'La partida' ")
            LocalPlayer():ChatPrint("'La llamada a la aventura': En esta fase se presenta el mundo ordinario del héroe y se hace una primer mención a ese mundo que sale de lo ordinario. ")


            station:SetPos( LocalPlayer():GetPos() )
        
            station:Play()

            -- Keep a reference to the audio object, so it doesn't get garbage collected which will stop the sound
            g_station = station
        
        else

            LocalPlayer():ChatPrint( "Invalid URL!" )

        end
    end )
end


function openLobby()

    net.Start("start_game")
    net.SendToServer()

    playInstructions()


end

net.Receive("open_lobby", openLobby)