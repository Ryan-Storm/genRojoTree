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
local ImageLabel = require(ReplicatedStorage.UI.Primitives.ImageLabel)
local UICorner = require(ReplicatedStorage.UI.Primitives.UICorner)
local UIPadding = require(ReplicatedStorage.UI.Primitives.UIPadding)
local UIStroke = require(ReplicatedStorage.UI.Primitives.UIStroke)

return function()
	return Frame({
		Size = UDim2.fromOffset(300, 300),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,

		TextLabel({
			Size = UDim2.fromScale(0.5, 0.5),
			Position = UDim2.fromScale(0.1, 0.1),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Text = "Test",
			TextColor3 = Color3.fromRGB(10, 10, 10),
			ZIndex = 2,
		}),

		ImageLabel({
			Size = UDim2.fromScale(1, 1),
			Image = imageIds.Panel_Inventory.Image,
			ScaleType = Enum.ScaleType.Slice,
			SliceImageSize = imageIds.Panel_Inventory.Size,
			SliceOffsets = imageIds.Panel_Inventory.SliceOffsets,
			SliceScale = 0.75,
		}),

		-- Button({
		-- 	Text = "Click Me!",
		-- 	Activated = function() end,
		-- 	Size = UDim2.fromScale(0.6, 0.3),
		-- 	AnchorPoint = Vector2.new(0.5, 0.5),
		-- 	Position = UDim2.fromScale(0.5, 0.5),
		-- }),
	})
end
