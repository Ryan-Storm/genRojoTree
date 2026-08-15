local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Vide = require(ReplicatedStorage.Packages.vide)
local create = Vide.create

return function(props)
	return create("UIGridLayout")({
		CellSize = props.CellSize or UDim2.fromOffset(64, 64),
		CellPadding = props.CellPadding or UDim2.fromOffset(8, 8),
		FillDirection = props.FillDirection or Enum.FillDirection.Horizontal,
		HorizontalAlignment = props.HorizontalAlignment or Enum.HorizontalAlignment.Left,
		VerticalAlignment = props.VerticalAlignment or Enum.VerticalAlignment.Top,
		SortOrder = props.SortOrder or Enum.SortOrder.LayoutOrder,
	})
end
