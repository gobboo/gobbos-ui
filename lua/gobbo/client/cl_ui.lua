--[[

Entity entity - The entity to draw the overhead for
DrawOptions options - The options to draw the overhead with

DrawOptions = {
	icon = "materials/icon.png",
	alpha = 255,
	text = "Hello World",
	textOffset = 12,
	color = Color(255, 255, 255),
	outlineColor = Color(0, 0, 0),
	sine = true,
}

]]--

function GOBBO.UI:DrawNPCOverhead(entity, options)
	if options.sine then
		options.textOffset = options.textOffset + math.sin(CurTime() * 2.5) * 24
	end

	surface.SetDrawColor(255, 255, 255, options.alpha)

	draw.SimpleTextOutlined(options.text, "Gobbo.3D2D", 0, options.textOffset, options.color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 5, options.outlineColor or Color(0, 0, 0))

	surface.SetMaterial(Material(options.icon))
	surface.DrawTexturedRect(-84, -256 + options.textOffset, 168, 168)
end

function GOBBO.UI:DrawKeyInteraction(key, text)
	-- Key Box
	surface.SetDrawColor(255, 255, 255, 255)

	local scrW, scrH = ScrW(), ScrH()

	local textMarginLeftX = 8 -- Margin of the text from the box ( left )

	local boxWidth, boxHeight = 32, 32 -- Size of the main box

	local xOffset = scrW / 2

	if (text) then
		surface.SetFont("Gobbo.UI.Default.Medium")
		local textWidth, textHeight = surface.GetTextSize(text)

		xOffset = xOffset - (boxWidth + textWidth) / 2 - textMarginLeftX
	end

	local yOffset = scrH * 0.65
	draw.RoundedBox(6, xOffset, scrH * 0.65, boxWidth, boxHeight, Color(41, 41, 41, 200))

	local keyBoxWidth, keyBoxHeight = boxWidth - 4, boxHeight - 4
	local padding = (boxHeight - keyBoxHeight) / 2 -- x and y padding of the key box, 40 - 36 / 2 = 2 ( 2 from the left, top, right and bottom ) so its centered
	draw.RoundedBox(4, xOffset + padding, yOffset + padding, keyBoxWidth, keyBoxHeight, Color(60, 60, 60))

	-- Key Text
	surface.SetFont("Gobbo.UI.Default.Large")
	local textWidth, textHeight = surface.GetTextSize(key)
	local yPosition = yOffset + (boxHeight / 2) - padding + 1 -- yOffset + (boxHeight / 2) - (boxHeight - keyBoxHeight) / 2
	draw.SimpleTextOutlined(key, "Gobbo.UI.Default.Large", xOffset + (boxWidth / 2) - (textWidth / 2), yPosition, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, Color(0, 0, 0))

	if (text) then
		draw.SimpleTextOutlined(text, "Gobbo.UI.Default.Medium", xOffset + boxWidth + textMarginLeftX, yPosition, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, Color(0, 0, 0))
	end
end