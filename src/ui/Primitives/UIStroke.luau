local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Vide = require(ReplicatedStorage.Packages.vide)
local create = Vide.create

return function(props)
	return create("UIStroke")({
		Color = props.Color or Color3.fromRGB(255, 255, 255),
		Transparency = props.Transparency or 0,
		Thickness = props.Thickness or 1,
		ApplyStrokeMode = props.ApplyStrokeMode or Enum.ApplyStrokeMode.Contextual,
	})
end
