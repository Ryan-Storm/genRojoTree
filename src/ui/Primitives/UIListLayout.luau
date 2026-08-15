local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Vide = require(ReplicatedStorage.Packages.vide)
local create = Vide.create

return function(props)
	return create("UIListLayout")({
		FillDirection = props.FillDirection or Enum.FillDirection.Vertical,
		HorizontalAlignment = props.HorizontalAlignment or Enum.HorizontalAlignment.Left,
		VerticalAlignment = props.VerticalAlignment or Enum.VerticalAlignment.Top,
		SortOrder = props.SortOrder or Enum.SortOrder.LayoutOrder,
		Padding = props.Padding or UDim.new(0, 8),
	})
end
