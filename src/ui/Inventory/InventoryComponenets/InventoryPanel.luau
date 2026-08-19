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
local ScrollingFrame = require(ReplicatedStorage.UI.Primitives.ScrollingFrame)
local InventorySlot = require(ReplicatedStorage.UI.Inventory.InventoryComponenets.InventorySlot)
local UIGridLayout = require(ReplicatedStorage.UI.Primitives.UIGridLayout)

return function()
	return Frame({
		Name = "Inventory_Panel",

		Size = UDim2.fromScale(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),

		BackgroundTransparency = 1,

		TextLabel({
			Size = UDim2.fromScale(0.6, 0.2),
			Position = UDim2.fromScale(-0.05, -0.08),
			AnchorPoint = Vector2.new(0, 0),
			Rotation = 0,

			Text = "INVENTORY",
			TextColor3 = Color3.fromRGB(231, 233, 233),
			ZIndex = 2,
			TextScaled = true,

			UIStroke({
				Color = Color3.fromRGB(9, 11, 17),
				Thickness = 4,
			}),
		}),

		ImageLabel({
			Name = "Inventory_Panel_Image",

			Size = UDim2.fromScale(1, 1),

			Image = imageIds.Panel_Inventory_Frame.Image,
			ScaleType = Enum.ScaleType.Slice,
			SliceImageSize = imageIds.Panel_Inventory_Frame.Size,
			SliceOffsets = imageIds.Panel_Inventory_Frame.SliceOffsets,
			SliceScale = 0.75,
		}),

		ScrollingFrame({
			Name = "Inventory_Panel_ScrollingFrame",

			Size = UDim2.fromScale(0.95, 0.8),

			UIGridLayout({
				CellSize = UDim2.fromScale(0.2, 0.14),
				-- CellSize = UDim2.fromOffset(150, 200),
				CellPadding = UDim2.fromScale(0.01, 0.01),
			}),

			UIPadding({
				PaddingTop = UDim.new(0.01, 0),
			}),

			InventorySlot({}),
			InventorySlot({}),
			InventorySlot({}),
			InventorySlot({}),
			InventorySlot({}),
			InventorySlot({}),
			InventorySlot({}),
			InventorySlot({}),
			InventorySlot({}),
			InventorySlot({}),
			InventorySlot({}),
			InventorySlot({}),
			InventorySlot({}),
			InventorySlot({}),
			InventorySlot({}),
			InventorySlot({}),
			InventorySlot({}),
			InventorySlot({}),
		}),
	})
end
