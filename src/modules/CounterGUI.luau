local ReplicatedStorage = game:GetService("ReplicatedStorage")

--////////////////////////////////////////////////////////////
-- Vide
--////////////////////////////////////////////////////////////

local vide = require(ReplicatedStorage.Packages.vide)

local create = vide.create
local source = vide.source
local effect = vide.effect

--////////////////////////////////////////////////////////////
-- Data
--////////////////////////////////////////////////////////////

local Data = require(ReplicatedStorage.Shared.Modules.Data).client

local currency = source(Data.currency())
Data.currency.Changed(function(newCurrency)
	currency(newCurrency)
end)

--////////////////////////////////////////////////////////////
-- Counter Service
--////////////////////////////////////////////////////////////

local CounterServiceClient = require(ReplicatedStorage.Shared.Services.CounterService.CounterServiceClient)

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

		create("UICorner")({
			Name = "UICorner",
		}),

		create("TextLabel")({
			Name = "TextLabel",
			BackgroundTransparency = 1,
			FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
			Position = UDim2.fromScale(0, 0.1),
			Size = UDim2.new(1, 0, 0, 50),
			TextColor3 = Color3.new(1, 1, 1),
			TextScaled = true,
			TextStrokeColor3 = Color3.new(1, 1, 1),
			Text = function()
				return tostring(currency())
			end,
		}),
	})
end
