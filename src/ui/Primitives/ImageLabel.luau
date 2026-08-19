local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Vide = require(ReplicatedStorage.Packages.vide)
local create = Vide.create

local function withChildren(instanceProps, props)
	for _, child in ipairs(props) do
		table.insert(instanceProps, child)
	end

	return instanceProps
end

local function getSliceCenter(props)
	if props.SliceCenter then
		return props.SliceCenter
	end

	local offsets = props.SliceOffsets
	local imageSize = props.SliceImageSize

	if not offsets or not imageSize then
		return nil
	end

	local left = offsets.Left or 0
	local top = offsets.Top or 0
	local right = offsets.Right or 0
	local bottom = offsets.Bottom or 0

	return Rect.new(left, top, imageSize.X - right, imageSize.Y - bottom)
end

return function(props)
	return create("ImageLabel")(withChildren({
		Name = props.Name or "ImageLabel",

		Size = props.Size or UDim2.fromScale(1, 1),
		Position = props.Position or UDim2.fromScale(0.5, 0.5),
		AnchorPoint = props.AnchorPoint or Vector2.new(0.5, 0.5),

		BackgroundTransparency = props.BackgroundTransparency or 1,

		Image = props.Image or "",
		ImageColor3 = props.ImageColor3 or Color3.new(1, 1, 1),
		ImageTransparency = props.ImageTransparency or 0,

		ScaleType = props.ScaleType or Enum.ScaleType.Fit,
		SliceCenter = getSliceCenter(props),
		SliceScale = props.SliceScale or 1,

		LayoutOrder = props.LayoutOrder,
		ZIndex = props.ZIndex or 1,
	}, props))
end
