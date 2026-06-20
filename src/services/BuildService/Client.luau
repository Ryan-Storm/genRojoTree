--!strict

--[[
    Build Service Client

    This service is responsible for sending build requests to the server.
]]

local replicatedstorage = game:GetService("ReplicatedStorage")
local Networker = require(replicatedstorage.Packages.networker)

local BuildServiceClient = {}

--////////////////////////////////////////////////////////////
-- Startup
--////////////////////////////////////////////////////////////

function BuildServiceClient.init(self: BuildServiceClient)
	self.networker = Networker.client.new("BuildService", self)
end

--////////////////////////////////////////////////////////////
-- Methods
--////////////////////////////////////////////////////////////

--[[
    Attempts to build a part at the given location

    @param cf The CFrame where the part should be built
]]
function BuildServiceClient.attemptBuild(self: BuildServiceClient, cf: CFrame)
	print("Attempting to build at: " .. tostring(cf))
	self.networker:fire("attemptBuild", cf)
end

--////////////////////////////////////////////////////////////
-- Type
--////////////////////////////////////////////////////////////

type BuildServiceClient = typeof(BuildServiceClient) & {
	networker: Networker.Client,
}

return BuildServiceClient :: BuildServiceClient
