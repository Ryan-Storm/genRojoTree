local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local vide = require(ReplicatedStorage.Packages.vide)

local mount = vide.mount
local player = Players.LocalPlayer
local App = require(ReplicatedStorage.Shared.Modules.App)

return mount(App, player.PlayerGui)
