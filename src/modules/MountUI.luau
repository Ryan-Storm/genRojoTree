local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local vide = require(ReplicatedStorage.Packages.vide)

local create = vide.create
local mount = vide.mount
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local App = require(ReplicatedStorage.Shared.Modules.App)
local CounterGUI = require(ReplicatedStorage.Shared.Modules.CounterGUI)
local SettingGUI = require(ReplicatedStorage.Shared.Modules.SettingsGUI)

return mount(function()
	return create("ScreenGui")({
		Name = "App",
		ResetOnSpawn = false,

		-- CounterGUI(),
		SettingGUI(),
	})
end, playerGui)
