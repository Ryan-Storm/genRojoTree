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
	local ItemId = props.ItemId
	local amount = vide.source(props.Amount or 1)
	local maxAmount = props.MaxAmount or 1
	local equipped = vide.source(props.Equipped or false)

	return create("Frame")(withChildren({ -- Outer Frame

		Size = props.Size or UDim2.fromScale(1, 1),
		Position = props.Position or UDim2.fromScale(0.5, 0.5),
		AnchorPoint = props.AnchorPoint or Vector2.new(0.5, 0.5),
		BackgroundTransparency = props.BackgroundTransparency or 1,

		ImageButton({ -- Button
			Size = UDim2.fromScale(1, 1),
			Image = imageIds.Panel_Inventory_Slot_Frame.Image,

			TextLabel({ -- Item Name
				Position = UDim2.fromScale(0.5, 0),
				ZIndex = 5,

				Text = props.DisplayName or "EXAMPLE",
				TextSize = 18,

				UIStroke({
					Color = Color3.fromRGB(9, 11, 17),
					Thickness = 2,
				}),
			}),

			ImageLabel({ -- Icon
				Size = UDim2.fromScale(0.62, 0.5),
				Position = UDim2.fromScale(0.5, 0.4),
				Image = props.Icon or imageIds.Example_Icon_Apple.Image,
				-- ImageTransparency = if props.icon then 0 else 1,
			}),

			Frame({ -- Count
				Size = UDim2.fromScale(0.8, 0.2),
				Position = UDim2.fromScale(0.5, 0.81),
				BackgroundTransparency = 1,

				TextLabel({ -- Count Text
					Position = UDim2.fromScale(0.5, 0.45),
					ZIndex = 4,

					Text = function()
						return tostring(amount()) .. "/" .. tostring(maxAmount)
					end,
					TextSize = 18,

					UIStroke({
						Color = Color3.fromRGB(9, 11, 17),
						Thickness = 1.5,
					}),
				}),

				ImageLabel({ -- Count Frame
					Size = UDim2.fromScale(1, 1),
					Position = UDim2.fromScale(0.5, 0.5),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Image = imageIds.Panel_Inventory_Count_Frame.Image,
					ZIndex = 2,
				}),

				ImageLabel({ -- Count Inside
					-- Size = UDim2.fromScale(0.94, 0.82), -- 0.94=100%,
					Size = function()
						local percent = (amount() / maxAmount) * 0.94
						return UDim2.fromScale(percent, 0.82)
					end,
					Position = UDim2.fromScale(0.03, 0.47),
					AnchorPoint = Vector2.new(0, 0.5),
					Image = imageIds.Panel_Inventory_Count_Inside.Image,
					ZIndex = 1,

					SliceImageSize = imageIds.Panel_Inventory_Count_Inside.Size,
					SliceOffsets = imageIds.Panel_Inventory_Count_Inside.SliceOffsets,
					ScaleType = Enum.ScaleType.Slice,
					SliceScale = 0.1,
				}),
			}),

			ImageLabel({ -- Equipped Frame
				Size = UDim2.fromScale(1, 0.95),
				Position = UDim2.fromScale(0.5, 0.488),
				Image = imageIds.Panel_Inventory_Slot_Selected.Image,
				ImageTransparency = function()
					return if equipped() then 0 else 1
				end,
			}),

			Activated = function()
				equipped(not equipped())
			end,
		}),
	}, props))
end
