local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Workspace = game:GetService("Workspace")

-- Vide
-- Vide
local Vide = require(ReplicatedStorage.Packages.vide)
local create = Vide.create
local source = Vide.source
local cleanup = Vide.cleanup

-- Children
local function withChildren(instanceProps, props)
	for _, child in ipairs(props) do
		table.insert(instanceProps, child)
	end

	return instanceProps
end

local function getViewportSize()
	local camera = Workspace.CurrentCamera

	if camera then
		return camera.ViewportSize
	end

	return Vector2.new(1280, 720)
end

return function(props)
	local baseSize = props.BaseSize or Vector2.new(900, 600) -- actual designed inventory size
	local referenceViewport = props.ReferenceViewport or Vector2.new(1920, 1080) -- screen size where inventory reaches scale 1
	local minScale = props.MinScale or 0.1 -- smallest the inventory is allowed to shrink
	local maxScale = props.MaxScale or 1 -- largest the inventory is allowed to grow
	local viewportSize = source(getViewportSize())

	local camera = Workspace.CurrentCamera
	local disconnect

	if camera then
		disconnect = camera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
			viewportSize(camera.ViewportSize)
		end)

		cleanup(disconnect)
	end

	return create("Frame")({
		Name = props.Name or "AutoScaledFrame",

		Size = UDim2.fromScale(1, 1),
		Position = props.Position or UDim2.fromScale(0.5, 0.5),
		AnchorPoint = props.AnchorPoint or Vector2.new(0.5, 0.5),

		BackgroundTransparency = 1,

		create("Frame")(withChildren({
			Name = "ScaleTarget",

			Size = props.Size or UDim2.fromOffset(baseSize.X, baseSize.Y),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),

			BackgroundColor3 = props.BackgroundColor3 or Color3.fromRGB(24, 24, 28),
			BackgroundTransparency = props.BackgroundTransparency or 1,

			LayoutOrder = props.LayoutOrder,
			ZIndex = props.ZIndex or 1,

			create("UIScale")({
				Scale = function()
					local currentViewportSize = viewportSize()

					local viewportScale = math.min(
						currentViewportSize.X / referenceViewport.X,
						currentViewportSize.Y / referenceViewport.Y
					)

					local fitScale = math.min(currentViewportSize.X / baseSize.X, currentViewportSize.Y / baseSize.Y)

					local scale = math.min(viewportScale, fitScale)

					return math.clamp(scale, minScale, maxScale)
				end,
			}),
		}, props)),
	})
end
