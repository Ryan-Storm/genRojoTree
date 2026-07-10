local ReplicatedStorage = game:GetService("ReplicatedStorage")
local vide = require(ReplicatedStorage.Packages.vide)

local create = vide.create

return function()
	return create("ScreenGui")({
		Name = "Vide",

		create("TextLabel")({
			Text = "Hello World",
			Size = UDim2.fromScale(0.25, 0.25),
			TextScaled = true,
		}),
	})
end
