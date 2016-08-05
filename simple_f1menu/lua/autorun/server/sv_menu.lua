function MenuHelp( ply )
    umsg.Start( "MenuHelp", ply )
    umsg.End()
end
hook.Add("ShowHelp", "ShowMenuHelp", MenuHelp)


local function OpenOnConsoleCommand( ply )
	umsg.Start( "MenuHelp", ply )
	umsg.End()
end
concommand.Add( "menuhelp", OpenOnConsoleCommand )


local function OpenOnCommand( ply, command, team )
	for k,v in pairs(opencommand) do
		if command == v then
			OpenOnConsoleCommand( ply )
		end
	end
end
hook.Add( "PlayerSay", "OpenOnCommand", OpenOnCommand )