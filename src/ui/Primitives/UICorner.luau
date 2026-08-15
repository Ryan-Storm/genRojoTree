local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Vide = require(ReplicatedStorage.Packages.vide)
local create = Vide.create

return function(props)
	return create("UICorner")({
		CornerRadius = props.CornerRadius or UDim.new(0, 8),
	})
end
