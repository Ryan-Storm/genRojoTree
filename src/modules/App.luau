local ReplicatedStorage = game:GetService("ReplicatedStorage")
local vide = require(ReplicatedStorage.Packages.vide)

local create = vide.create
local source = vide.source
local effect = vide.effect

return function()
	local count = source(0)

	effect(function()
		print(count())
	end)

	return create("Frame")({
		Name = "Frame",
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(0, 2, 9),
		BorderColor3 = Color3.new(),
		BorderSizePixel = 0,
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(250, 250),

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
				return tostring(count())
			end,
		}),

		create("TextButton")({
			Name = "TextButton",
			AnchorPoint = Vector2.new(0.5, 0),
			BackgroundColor3 = Color3.fromRGB(1, 255, 9),
			FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromScale(0.8, 0.25),
			Text = "Click Me!",
			TextColor3 = Color3.new(),
			TextSize = 14,

			Activated = function()
				count(count() + 1)
			end,

			TextWrapped = true,
		}),

		create("UICorner")({
			Name = "UICorner",
		}),
	})
end
