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
local AutoScaledFrame = require(ReplicatedStorage.UI.Primitives.AutoScaledFrame)

local testItems = {
	{
		ItemId = "golden_apple",
		DisplayName = "GOLDEN APPLE",
		Amount = 5,
		MaxAmount = 10,
		Icon = imageIds.Example_Icon_GoldenApple.Image,
	},
	{
		ItemId = "apple",
		DisplayName = "APPLE",
		Amount = 8,
		MaxAmount = 10,
		Icon = imageIds.Example_Icon_Apple.Image,
	},
}

return function()
	local slotChildren = {
		Name = "Inventory_Panel_ScrollingFrame",

		Size = UDim2.fromOffset(870, 500),
		Position = UDim2.fromOffset(450, 300),
		AnchorPoint = Vector2.new(0.5, 0.5),

		UIGridLayout({
			CellSize = UDim2.fromOffset(110, 143),
			CellPadding = UDim2.fromOffset(10, 10),
		}),

		UIPadding({
			Padding = 16,
		}),
	}

	for index, item in ipairs(testItems) do
		table.insert(
			slotChildren,
			InventorySlot({
				ItemId = item.ItemId,
				DisplayName = item.DisplayName,
				Amount = item.Amount,
				MaxAmount = item.MaxAmount,
				Icon = item.Icon,
				LayoutOrder = index,
			})
		)
	end

	return AutoScaledFrame({
		Name = "Inventory_Panel",

		BaseSize = Vector2.new(900, 600),
		ReferenceViewport = Vector2.new(1600, 900),
		MinScale = 0.65,
		MaxScale = 1,

		Size = UDim2.fromOffset(900, 600),
		Position = UDim2.fromScale(0.5, 0.5),

		TextLabel({
			Size = UDim2.fromOffset(420, 100),
			Position = UDim2.fromOffset(-40, -40),
			AnchorPoint = Vector2.new(0, 0),

			Text = "INVENTORY",
			TextColor3 = Color3.fromRGB(231, 233, 233),
			TextScaled = true,

			ZIndex = 2,

			UIStroke({
				Color = Color3.fromRGB(9, 11, 17),
				Thickness = 4,
			}),
		}),

		ImageLabel({
			Size = UDim2.fromOffset(900, 600),
			Image = imageIds.Panel_Inventory_Frame.Image,
			ScaleType = Enum.ScaleType.Slice,
			SliceImageSize = imageIds.Panel_Inventory_Frame.Size,
			SliceOffsets = imageIds.Panel_Inventory_Frame.SliceOffsets,
			SliceImageSize = imageIds.Panel_Inventory_Frame.Size,
			SliceOffsets = imageIds.Panel_Inventory_Frame.SliceOffsets,
			SliceScale = 0.75,
		}),

		ScrollingFrame(slotChildren),
	})
end
