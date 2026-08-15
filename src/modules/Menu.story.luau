local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CounterGUI = require(script.Parent.CounterGUI)
local RippleTessting = require(script.Parent.RippleTessting)
local Vide = require(ReplicatedStorage.Packages.vide)
local App = require(ReplicatedStorage.Shared.Modules.App)

local story = {
	vide = Vide,
	story = function()
		return RippleTessting()
	end,
}

return story
