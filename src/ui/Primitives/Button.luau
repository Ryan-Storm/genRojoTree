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

local function toUDim(value)
	if typeof(value) == "UDim" then
		return value
	end

	return UDim.new(0, value or 0)
end

local function Button(props)
	local scale, spring = useSpring(1, config.default)

	return create("Frame")({
		Size = props.Size,
		BackgroundTransparency = 1,
		LayoutOrder = props.LayoutOrder,
		AnchorPoint = props.AnchorPoint,
		Position = props.Position,

		create("TextButton")({
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromScale(1, 1),

			Text = props.Text or "",
			Activated = props.Activated,

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

return Button
