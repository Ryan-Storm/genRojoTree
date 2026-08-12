--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Networker = require(ReplicatedStorage.Packages.networker)

local CounterServiceClient = {}

function CounterServiceClient.init(self: CounterServiceClient)
	self.networker = Networker.client.new("CounterService", self)
end

function CounterServiceClient.incrementCurrency(self: CounterServiceClient)
	self.networker:fire("incrementCurrency")
end

type CounterServiceClient = typeof(CounterServiceClient) & {
	networker: Networker.Client,
}

return CounterServiceClient :: CounterServiceClient
