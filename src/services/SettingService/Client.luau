--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Networker = require(ReplicatedStorage.Packages.networker)

local SettingServiceClient = {}

function SettingServiceClient.init(self: SettingServiceClient)
	self.networker = Networker.client.new("SettingService", self)
end

function SettingServiceClient.setMusicEnabled(self: SettingServiceClient, enabled: boolean)
	self.networker:fire("setMusicEnabled", enabled)
end

function SettingServiceClient.setSfxEnabled(self: SettingServiceClient, enabled: boolean)
	self.networker:fire("setSfxEnabled", enabled)
end

type SettingServiceClient = typeof(SettingServiceClient) & {
	networker: Networker.Client,
}

return SettingServiceClient :: SettingServiceClient
