local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Vide
local vide = require(ReplicatedStorage.Packages.vide)
local InventoryPanel = require(ReplicatedStorage.UI.Inventory.InventoryComponenets.InventoryPanel)

local create = vide.create
local source = vide.source
local effect = vide.effect
local cleanup = vide.cleanup

-- Primitives
local Frame = require(ReplicatedStorage.UI.Primitives.Frame)
local TextLabel = require(ReplicatedStorage.UI.Primitives.TextLabel)
local Button = require(ReplicatedStorage.UI.Primitives.Button)
local ImageLabel = require(ReplicatedStorage.UI.Primitives.ImageLabel)
local UICorner = require(ReplicatedStorage.UI.Primitives.UICorner)
local UIPadding = require(ReplicatedStorage.UI.Primitives.UIPadding)
local UIStroke = require(ReplicatedStorage.UI.Primitives.UIStroke)

-- Image Ids
local imageIds = require(ReplicatedStorage.UI.imageIds)

-- Data
local Data = require(ReplicatedStorage.Shared.Modules.Data).client

return function()
	return InventoryPanel()
end
