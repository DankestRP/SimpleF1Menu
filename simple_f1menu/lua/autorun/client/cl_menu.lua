surface.CreateFont("FontTitle",
{
	font		= "Brandon Grotesque",
	size		= 24,
	weight		= 400
})

surface.CreateFont("FontLoading",
{
	font		= "Brandon Grotesque",
	size		= 24,
	weight		= 400
})

surface.CreateFont("FontButton",
{
	font		= "Brandon Grotesque",
	size		= 24,
	weight		= 400
})

local function MenuHelp()

	local Frame = vgui.Create( "DFrame" )
	Frame:SetSize( ScrW() - 100, ScrH() - 150 )
	Frame:SetTitle( "" )
	Frame:SetVisible( true )
	Frame:SetDraggable( false )
	Frame:ShowCloseButton( true )
	Frame:MakePopup()
	Frame:Center()
	Frame.Paint = function()
		draw.RoundedBox( 3, 0, 0, Frame:GetWide()-0, Frame:GetTall()-0, Color( 0, 0, 0, 200 ) )
	end

	local ButtonPanel = vgui.Create( "DPanel", Frame )
	ButtonPanel:SetPos( 2, 2 )
	ButtonPanel:Dock(LEFT)
	ButtonPanel:SetWidth(300)
	ButtonPanel.Paint = function()
		draw.RoundedBox( 0, 0, 0, ButtonPanel:GetWide(), ButtonPanel:GetTall(), Color( 0, 0, 0, 0 ) )
		draw.DrawText( "Help", "FontTitle", ButtonPanel:GetWide()/2+1, 10+1, Color( 0, 0, 0, 255 ), 1 )
		draw.DrawText( "Help", "FontTitle", ButtonPanel:GetWide()/2+0, 10+0, Color( 255, 255, 255, 255 ), 1 )
	end

	local HtmlPanel = vgui.Create( "DPanel", Frame )
	HtmlPanel:Dock(RIGHT)
	HtmlPanel:SetSize( Frame:GetWide() - 304, Frame:GetTall() - 4 )
	HtmlPanel.Paint = function() end

	local HtmlBackground = vgui.Create( "DPanel", HtmlPanel )
	HtmlBackground:Dock(FILL)
	HtmlBackground:DockMargin(20,20,20,20)
	HtmlBackground.Paint = function()
		draw.RoundedBox( 0, 0, 0, HtmlBackground:GetWide(), HtmlBackground:GetTall(), Color( 0, 0, 0, 200 ) )
		draw.DrawText( "Loading ...", "FontLoading", HtmlBackground:GetWide()/2+1, HtmlBackground:GetTall()/2+1, Color( 0, 0, 0, 255), 1 )
		draw.DrawText( "Loading ...", "FontLoading", HtmlBackground:GetWide()/2+0, HtmlBackground:GetTall()/2+0, Color( 255, 255, 255, 255), 1 )
	end

	local HtmlFrame = vgui.Create( "DHTML", HtmlPanel )
	HtmlFrame:Dock(FILL)

	local ButtonY = 62
	local ButtonI = 0

	for k,v in pairs(HelpButtons) do

		local Button = vgui.Create( "DButton", ButtonPanel )
		Button:SetPos( 10, ButtonY )
		Button:SetSize( ButtonPanel:GetWide() - 20, 60 )
		Button:SetText( "" )
		Button.Hover = false
		Button.OnCursorEntered 	= function() Button.Hover = true end
		Button.OnCursorExited	= function() Button.Hover = false end
		Button.DoClick = function() HtmlFrame:OpenURL( v['url'] ) end
		Button.Paint = function()
			draw.RoundedBox( 0, 0, 0, Button:GetWide()-4, Button:GetTall()-4, Color( 0, 0, 0, 230 ) )
		if Button.Hover then
			draw.RoundedBox( 0, 0, 0, Button:GetWide()-4, Button:GetTall()-4, Color( 0, 0, 0, 220 ) )
		end
			draw.DrawText( v['txt'], "FontButton", Button:GetWide()/2+1, 16+1, Color( 0, 0, 0, 255 ), 1 )
			draw.DrawText( v['txt'], "FontButton", Button:GetWide()/2+0, 16+0, Color( 255, 255, 255, 255 ), 1 )
		end


		if ButtonI == 0 then
			HtmlFrame:OpenURL( v['url'] )
		end

		ButtonY = ButtonY + 60 + 8
		ButtonI = ButtonI + 1

	end 
end

usermessage.Hook("MenuHelp", MenuHelp)