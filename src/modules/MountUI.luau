local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RippleTessting = require(script.Parent.RippleTessting)
local vide = require(ReplicatedStorage.Packages.vide)

local create = vide.create
local mount = vide.mount
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local App = require(ReplicatedStorage.Shared.Modules.App)
local CounterGUI = require(ReplicatedStorage.Shared.Modules.CounterGUI)
local SettingGUI = require(ReplicatedStorage.Shared.Modules.SettingsGUI)
local Inventory_GUI = require(ReplicatedStorage.UI.Inventory["Inventory-GUI"])

return mount(function()
	return create("ScreenGui")({
		Name = "App",
		ResetOnSpawn = false,

		-- CounterGUI(),
		-- SettingGUI(),
		-- RippleTessting(),
		Inventory_GUI(),
	})
end, playerGui)
