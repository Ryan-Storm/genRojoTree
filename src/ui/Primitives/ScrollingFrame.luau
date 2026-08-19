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

local function ScrollingFrame(props)
	return create("ScrollingFrame")(withChildren({
		Name = props.Name or "ScrollingFrame",

		Size = props.Size or UDim2.fromScale(1, 1),
		Position = props.Position or UDim2.fromScale(0.5, 0.5),
		AnchorPoint = props.AnchorPoint or Vector2.new(0.5, 0.5),

		BackgroundTransparency = props.BackgroundTransparency or 1,

		ZIndex = props.ZIndex or 1,
	}, props))
end

return ScrollingFrame
