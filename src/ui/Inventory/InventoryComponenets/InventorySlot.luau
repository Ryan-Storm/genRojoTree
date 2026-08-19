local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Vide
local vide = require(ReplicatedStorage.Packages.vide)
local create = vide.create

-- Image Ids
local imageIds = require(ReplicatedStorage.UI.imageIds)

-- Primitives
local Frame = require(ReplicatedStorage.UI.Primitives.Frame)
local TextLabel = require(ReplicatedStorage.UI.Primitives.TextLabel)
local Button = require(ReplicatedStorage.UI.Primitives.Button)
local ImageButton = require(ReplicatedStorage.UI.Primitives.ImageButton)
local ImageLabel = require(ReplicatedStorage.UI.Primitives.ImageLabel)
local UICorner = require(ReplicatedStorage.UI.Primitives.UICorner)
local UIPadding = require(ReplicatedStorage.UI.Primitives.UIPadding)
local UIStroke = require(ReplicatedStorage.UI.Primitives.UIStroke)

-- Children
local function withChildren(instanceProps, props)
	for _, child in ipairs(props) do
		table.insert(instanceProps, child)
	end

	return instanceProps
end

return function(props)
	return create("Frame")(withChildren({
		Size = props.Size or UDim2.fromScale(1, 1),
		Position = props.Position or UDim2.fromScale(0.5, 0.5),
		AnchorPoint = props.AnchorPoint or Vector2.new(0.5, 0.5),
		BackgroundTransparency = props.BackgroundTransparency or 1,

		ImageButton({
			Size = UDim2.fromScale(1, 1),
			Image = imageIds.Panel_Inventory_Slot_Frame.Image,
			ScaleType = Enum.ScaleType.Slice,
			SliceImageSize = imageIds.Panel_Inventory_Slot_Frame.Size,
			SliceOffsets = imageIds.Panel_Inventory_Slot_Frame.SliceOffsets,
			SliceScale = 0.6,
		}),
	}, props))
end
