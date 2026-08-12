--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Networker = require(ReplicatedStorage.Packages.networker)
local Data = require(ReplicatedStorage.Shared.Modules.Data).server

local CounterServiceServer = {}

function CounterServiceServer.init(self: CounterServiceServer)
	self.networker = Networker.server.new("CounterService", self, {
		incrementCurrency = self.incrementCurrency,
	})
end

function CounterServiceServer.incrementCurrency(self: CounterServiceServer, player: Player)
	Data.Service:waitForData(player)
	local playerData = Data[player]

	playerData.currency(function(current: number)
		return current + 1
	end)

	-- This works too
	-- playerData.currency(playerData.currency() + 1)
end

type CounterServiceServer = typeof(CounterServiceServer) & {
	networker: Networker.Server,
	incrementCurrency: (self: CounterServiceServer, player: Player) -> (),
}

return CounterServiceServer :: CounterServiceServer
