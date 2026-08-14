--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Networker = require(ReplicatedStorage.Packages.networker)
local Data = require(ReplicatedStorage.Shared.Modules.Data).server

local SettingServiceServer = {}

function SettingServiceServer.init(self: SettingServiceServer)
	self.networker = Networker.server.new("SettingService", self, {
		setMusicEnabled = self.setMusicEnabled,
		setSfxEnabled = self.setSfxEnabled,
	})
end

function SettingServiceServer.setMusicEnabled(self: SettingServiceServer, player: Player, enabled: boolean)
	Data.Service:waitForData(player)
	local playerData = Data[player]

	playerData.settings.music(enabled)
end

function SettingServiceServer.setSfxEnabled(self: SettingServiceServer, player: Player, enabled: boolean)
	Data.Service:waitForData(player)
	local playerData = Data[player]

	playerData.settings.sfx(enabled)
end

type SettingServiceServer = typeof(SettingServiceServer) & {
	networker: Networker.Server,
	setMusicEnabled: (self: SettingServiceServer, player: Player, enabled: boolean) -> (),
	setSfxEnabled: (self: SettingServiceServer, player: Player, enabled: boolean) -> (),
}

return SettingServiceServer :: SettingServiceServer
