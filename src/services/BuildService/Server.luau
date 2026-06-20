--!strict

--[[
	Build Service

	This service creates a part at a regular interval.
]]

local replicatedstorage = game:GetService("ReplicatedStorage")
local Networker = require(replicatedstorage.Packages.networker)

local BuildServiceServer = {}

--////////////////////////////////////////////////////////////
-- Instance Variables
--////////////////////////////////////////////////////////////

local BUILD_COOLDOWN = 5

--////////////////////////////////////////////////////////////
-- Startup
--////////////////////////////////////////////////////////////

function BuildServiceServer.init(self: BuildServiceServer)
	self.previousBuildTime = 0
	self.networker = Networker.server.new("BuildService", self, {
		attemptBuild = self.attemptBuild,
	})
end

--////////////////////////////////////////////////////////////
-- Methods
--////////////////////////////////////////////////////////////

function BuildServiceServer.attemptBuild(self: BuildServiceServer, player: Player, cf: CFrame)
	local timeSinceLastBuild = os.time() - self.previousBuildTime

	if timeSinceLastBuild < BUILD_COOLDOWN then
		return
	end

	self.previousBuildTime = os.time()

	local part = Instance.new("Part")
	part.CFrame = cf
	part.Anchored = false
	part.Parent = workspace
end

--////////////////////////////////////////////////////////////
-- Type
--////////////////////////////////////////////////////////////

type BuildServiceServer = typeof(BuildServiceServer) & {
	previousBuildTime: number,
	networker: Networker.Server,
	attemptBuild: (self: BuildServiceServer, player: Player, cf: CFrame) -> (),
}

return BuildServiceServer :: BuildServiceServer
