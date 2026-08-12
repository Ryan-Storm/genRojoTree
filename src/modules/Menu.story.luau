local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Vide = require(ReplicatedStorage.Packages.vide)
local App = require(ReplicatedStorage.Shared.Modules.App)

local story = {
	vide = Vide,
	story = function()
		return App()
	end,
}

return story
