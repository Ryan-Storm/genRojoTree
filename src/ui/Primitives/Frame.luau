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
		Size = props.Size,
		Position = props.Position,
		AnchorPoint = props.AnchorPoint,
		BackgroundColor3 = props.BackgroundColor3 or Color3.fromRGB(24, 24, 28),
		BackgroundTransparency = props.BackgroundTransparency or 0,
		BorderSizePixel = props.BorderSizePixel or 0,
		LayoutOrder = props.LayoutOrder,
		Visible = props.Visible,
	}, props))
end
