local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Vide = require(ReplicatedStorage.Packages.vide)
local Inventory_GUI = require(ReplicatedStorage.UI.Inventory["Inventory-GUI"])

local story = {
	vide = Vide,
	story = function()
		return Inventory_GUI()
	end,
}

return story
