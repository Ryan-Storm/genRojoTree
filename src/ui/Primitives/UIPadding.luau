local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Vide = require(ReplicatedStorage.Packages.vide)
local create = Vide.create

local function toUDim(value)
	if typeof(value) == "UDim" then
		return value
	end

	return UDim.new(0, value or 0)
end

return function(props)
	local padding = props.Padding or 0

	return create("UIPadding")({
		PaddingTop = toUDim(props.PaddingTop or padding),
		PaddingBottom = toUDim(props.PaddingBottom or padding),
		PaddingLeft = toUDim(props.PaddingLeft or padding),
		PaddingRight = toUDim(props.PaddingRight or padding),
	})
end
