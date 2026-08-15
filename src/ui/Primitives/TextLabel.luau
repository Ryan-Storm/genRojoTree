local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Vide = require(ReplicatedStorage.Packages.vide)
local create = Vide.create

local function withChildren(instanceProps, props)
	for _, child in ipairs(props) do
		table.insert(instanceProps, child)
	end

	return instanceProps
end

return function(props)
	return create("TextLabel")(withChildren({
		Name = props.Name or "TextLabel",
		Size = props.Size,
		Position = props.Position,
		AnchorPoint = props.AnchorPoint,
		BackgroundTransparency = props.BackgroundTransparency or 1,
		FontFace = props.FontFace or Font.new("rbxasset://fonts/families/SourceSansPro.json"),
		Text = props.Text or "",
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
