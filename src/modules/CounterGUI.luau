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
-- Primitives
--////////////////////////////////////////////////////////////

local Frame = require(ReplicatedStorage.UI.Primitives.Frame)
local TextLabel = require(ReplicatedStorage.UI.Primitives.TextLabel)
local Button = require(ReplicatedStorage.UI.Primitives.Button)
local UICorner = require(ReplicatedStorage.UI.Primitives.UICorner)
local UIPadding = require(ReplicatedStorage.UI.Primitives.UIPadding)
local UIStroke = require(ReplicatedStorage.UI.Primitives.UIStroke)

--////////////////////////////////////////////////////////////
-- Data
--////////////////////////////////////////////////////////////

local Data = require(ReplicatedStorage.Shared.Modules.Data).client

--////////////////////////////////////////////////////////////
-- Counter Service
--////////////////////////////////////////////////////////////

local CounterServiceClient = require(ReplicatedStorage.Shared.Services.CounterService.CounterServiceClient)

--////////////////////////////////////////////////////////////
-- GUI
--////////////////////////////////////////////////////////////

return function()
	local currency = source(Data.currency())
	local disconnect = Data.currency.Changed(function(newCurrency)
		currency(newCurrency)
	end)
	cleanup(disconnect)

	return Frame({
		Name = "CounterPanel",
		Size = UDim2.fromOffset(250, 250),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),

		UICorner({ Radius = 8 }),
		UIStroke({ Color = Color3.fromRGB(80, 80, 90) }),
		UIPadding({ Padding = 12 }),

		TextLabel({
			Text = function()
				return tostring(currency())
			end,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.1),
			TextSize = 80,
		}),

		Button({
			Text = "Click Me!",
			Activated = function()
				CounterServiceClient:incrementCurrency()
			end,
			Size = UDim2.fromScale(0.5, 0.1),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
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
	-- 		Name = "TextLabel",
	-- 		BackgroundTransparency = 1,
	-- 		FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
	-- 		Position = UDim2.fromScale(0, 0.1),
	-- 		Size = UDim2.new(1, 0, 0, 50),
	-- 		TextColor3 = Color3.new(1, 1, 1),
	-- 		TextScaled = true,
	-- 		TextStrokeColor3 = Color3.new(1, 1, 1),
	-- 		Text = function()
	-- 			return tostring(currency())
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
	-- 			CounterServiceClient:incrementCurrency()
	-- 		end,

	-- 		TextWrapped = true,
	-- 	}),
	-- })
end
