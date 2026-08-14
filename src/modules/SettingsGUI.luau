local ReplicatedStorage = game:GetService("ReplicatedStorage")

--////////////////////////////////////////////////////////////
-- Vide
--////////////////////////////////////////////////////////////

local vide = require(ReplicatedStorage.Packages.vide)

local create = vide.create
local source = vide.source
local effect = vide.effect
local cleanup = vide.cleanup

--////////////////////////////////////////////////////////////
-- Data
--////////////////////////////////////////////////////////////

local Data = require(ReplicatedStorage.Shared.Modules.Data).client

--////////////////////////////////////////////////////////////
-- Settings Service
--////////////////////////////////////////////////////////////

local SettingServiceClient = require(ReplicatedStorage.Shared.Services.SettingService.SettingServiceClient)

--////////////////////////////////////////////////////////////
-- Toggle Element
--////////////////////////////////////////////////////////////

local function SettingToggle(props)
	return create("Frame")({
		Size = UDim2.new(1, 0, 0, 50),
		LayoutOrder = props.layoutOrder or 0,

		create("TextLabel")({
			Size = UDim2.fromScale(0.5, 1),
			Text = props.label,
		}),

		create("TextButton")({
			Position = UDim2.fromScale(0.5, 0),
			Size = UDim2.fromScale(0.5, 1),

			Text = function()
				return if props.enabled() then "On" else "Off"
			end,

			Activated = function()
				props.onToggle(not props.enabled())
			end,
		}),
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
	local musicEnabled = dataValueSource(Data.settings.music)
	local sfxEnabled = dataValueSource(Data.settings.sfx)

	return create("Frame")({
		Name = "Frame",
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(0, 2, 9),
		BorderColor3 = Color3.new(),
		BorderSizePixel = 0,
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(250, 250),

		create("UIListLayout")({
			Name = "ListLayout",
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 8),
		}),

		SettingToggle({
			label = "Music",
			enabled = musicEnabled,
			layoutOrder = 1,
			onToggle = function(nextEnabled)
				SettingServiceClient:setMusicEnabled(nextEnabled)
			end,
		}),

		SettingToggle({
			label = "SFX",
			enabled = sfxEnabled,
			layoutOrder = 2,
			onToggle = function(nextEnabled)
				SettingServiceClient:setSfxEnabled(nextEnabled)
			end,
		}),
	})

	-- return create("Frame")({
	-- 	Name = "Frame",
	-- 	AnchorPoint = Vector2.new(0.5, 0.5),
	-- 	BackgroundColor3 = Color3.fromRGB(0, 2, 9),
	-- 	BorderColor3 = Color3.new(),
	-- 	BorderSizePixel = 0,
	-- 	Position = UDim2.fromScale(0.5, 0.5),
	-- 	Size = UDim2.fromOffset(250, 250),

	-- 	create("UICorner")({
	-- 		Name = "UICorner",
	-- 	}),

	-- 	create("TextLabel")({
	-- 		Name = "MusicSetting",
	-- 		BackgroundTransparency = 1,
	-- 		FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
	-- 		Position = UDim2.fromScale(0, 0.1),
	-- 		Size = UDim2.new(1, 0, 0, 50),
	-- 		TextColor3 = Color3.new(1, 1, 1),
	-- 		TextScaled = true,
	-- 		TextStrokeColor3 = Color3.new(1, 1, 1),
	-- 		Text = function()
	-- 			if musicEnabled() then
	-- 				return "Enabled"
	-- 			else
	-- 				return "Disabled"
	-- 			end
	-- 		end,
	-- 	}),

	-- 	create("TextButton")({
	-- 		Name = "TextButton",
	-- 		AnchorPoint = Vector2.new(0.5, 0),
	-- 		BackgroundColor3 = Color3.fromRGB(1, 255, 9),
	-- 		FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
	-- 		Position = UDim2.fromScale(0.5, 0.5),
	-- 		Size = UDim2.fromScale(0.8, 0.25),
	-- 		Text = "Click Me!",
	-- 		TextColor3 = Color3.new(),
	-- 		TextSize = 14,

	-- 		Activated = function()
	-- 			SettingServiceClient:setMusicEnabled(not musicEnabled())
	-- 		end,

	-- 		TextWrapped = true,
	-- 	}),
	-- })
end
