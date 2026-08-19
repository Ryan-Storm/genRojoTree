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
	return create("Frame")(withChildren({
		Name = props.Name or "Frame",

		Size = props.Size or UDim2.fromScale(1, 1),
		Position = props.Position or UDim2.fromScale(0.5, 0.5),
		AnchorPoint = props.AnchorPoint or Vector2.new(0.5, 0.5),

		BackgroundColor3 = props.BackgroundColor3 or Color3.fromRGB(24, 24, 28),
		BackgroundTransparency = props.BackgroundTransparency or 1,
		BorderSizePixel = props.BorderSizePixel or 0,

		LayoutOrder = props.LayoutOrder,
		ZIndex = props.ZIndex or 1,

		Visible = props.Visible,
	}, props))
end
