local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Vide = require(ReplicatedStorage.Packages.vide)
local create = Vide.create

return function(props)
	return create("UIGridLayout")({
		Name = props.Name or "UIGridLayout",

		CellSize = props.CellSize or UDim2.fromScale(0.2, 0.2),
		CellPadding = props.CellPadding or UDim2.fromScale(0.01, 0.01),

		FillDirection = props.FillDirection or Enum.FillDirection.Horizontal,
		HorizontalAlignment = props.HorizontalAlignment or Enum.HorizontalAlignment.Center,
		VerticalAlignment = props.VerticalAlignment or Enum.VerticalAlignment.Top,

		SortOrder = props.SortOrder or Enum.SortOrder.LayoutOrder,
	})
end
