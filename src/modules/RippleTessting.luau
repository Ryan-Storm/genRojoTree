local ReplicatedStorage = game:GetService("ReplicatedStorage")

--////////////////////////////////////////////////////////////
-- Vide
--////////////////////////////////////////////////////////////

local vide = require(ReplicatedStorage.Packages.vide)

local create = vide.create
local source = vide.source
local effect = vide.effect
local cleanup = vide.cleanup
local changed = vide.changed

--////////////////////////////////////////////////////////////
-- Ripple
--////////////////////////////////////////////////////////////

local videRipple = require(ReplicatedStorage.Packages["vide-ripple"])
local useSpring = videRipple.useSpring
local config = videRipple.config

local function Button()
	local getValue, spring = useSpring(0, config.wobbly)

	return create("TextButton")({
		Text = "Button",
		TextScaled = true,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = function()
			return UDim2.fromOffset(100 + getValue(), 50 + getValue())
		end,

		changed("GuiState", function(state: Enum.GuiState)
			if state == Enum.GuiState.Hover then
				spring:setGoal(20)
			elseif state == Enum.GuiState.Press then
				spring:setGoal(-20, { impulse = -100 })
			else
				spring:setGoal(0)
			end
		end),
	})
end

--////////////////////////////////////////////////////////////
-- Value Source
--////////////////////////////////////////////////////////////

local function dataValueSource(dataValue)
	local state = source(dataValue())

	local disconnect = dataValue.Changed(function(newValue)
		state(newValue)
	end)

	cleanup(disconnect)

	return state
end

--////////////////////////////////////////////////////////////
-- GUI
--////////////////////////////////////////////////////////////

return function()
	return create("Frame")({
		Name = "Frame",
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(0, 2, 9),
		BorderColor3 = Color3.new(),
		BorderSizePixel = 0,
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(250, 250),

		Button(),
	})
end
