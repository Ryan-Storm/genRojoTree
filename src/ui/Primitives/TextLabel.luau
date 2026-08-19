local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Vide
local Vide = require(ReplicatedStorage.Packages.vide)
local create = Vide.create

-- Children
local function withChildren(instanceProps, props)
	for _, child in ipairs(props) do
		table.insert(instanceProps, child)
	end

	return instanceProps
end

return function(props)
	return create("TextLabel")(withChildren({
		Name = props.Name or "TextLabel",

		Size = props.Size or UDim2.fromScale(1, 1),
		Position = props.Position or UDim2.fromScale(0.5, 0.5),
		Rotation = props.Rotation or 0,
		AnchorPoint = props.AnchorPoint or Vector2.new(0.5, 0.5),

		BackgroundTransparency = props.BackgroundTransparency or 1,

		Text = props.Text or "",
		FontFace = props.FontFace or Font.new(
			"rbxasset://fonts/families/BuilderSans.json",
			props.FontWeight or Enum.FontWeight.Bold,
			props.FontStyle or Enum.FontStyle.Normal
		),
		TextColor3 = props.TextColor3 or Color3.fromRGB(255, 255, 255),
		TextSize = props.TextSize or 16,
		TextScaled = props.TextScaled or false,
		TextWrapped = props.TextWrapped or false,
		TextXAlignment = props.TextXAlignment or Enum.TextXAlignment.Center,
		TextYAlignment = props.TextYAlignment or Enum.TextYAlignment.Center,

		LayoutOrder = props.LayoutOrder,
		ZIndex = props.ZIndex,
	}, props))
end
