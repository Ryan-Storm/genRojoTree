local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Vide
local Vide = require(ReplicatedStorage.Packages.vide)
local create = Vide.create
local changed = Vide.changed

-- Ripple
local videRipple = require(ReplicatedStorage.Packages["vide-ripple"])
local useSpring = videRipple.useSpring
local config = videRipple.config

local function withChildren(instanceProps, props)
	for _, child in ipairs(props) do
		table.insert(instanceProps, child)
	end

	return instanceProps
end

local function getSliceCenter(props)
	if props.SliceCenter then
		return props.SliceCenter
	end

	local offsets = props.SliceOffsets
	local imageSize = props.SliceImageSize

	if not offsets or not imageSize then
		return nil
	end

	local left = offsets.Left or 0
	local top = offsets.Top or 0
	local right = offsets.Right or 0
	local bottom = offsets.Bottom or 0

	return Rect.new(left, top, imageSize.X - right, imageSize.Y - bottom)
end

local function toUDim(value)
	if typeof(value) == "UDim" then
		return value
	end

	return UDim.new(0, value or 0)
end

local function ImageButton(props)
	local scale, spring = useSpring(1, config.default)

	return create("Frame")({
		Size = props.Size,
		BackgroundTransparency = 1,
		LayoutOrder = props.LayoutOrder,
		AnchorPoint = props.AnchorPoint,
		Position = props.Position,
		ZIndex = props.ZIndex,

		create("ImageButton")({
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromScale(1, 1),

			Image = props.Image,
			BackgroundTransparency = 1,

			Activated = props.Activated,

			ScaleType = props.ScaleType or Enum.ScaleType.Fit,
			SliceCenter = getSliceCenter(props),
			SliceScale = props.SliceScale or 1,

			changed("GuiState", function(state)
				if state == Enum.GuiState.Hover then
					spring:setGoal(1.04)
				elseif state == Enum.GuiState.Press then
					spring:setGoal(0.96)
				else
					spring:setGoal(1)
				end
			end),

			create("UIScale")({
				Scale = function()
					return scale()
				end,
			}),
		}),
	})
end

return ImageButton
