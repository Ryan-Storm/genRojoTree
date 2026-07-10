local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--////////////////////////////////////////////////////////////
-- Build Service
--////////////////////////////////////////////////////////////

local BuildServiceClient = require(ReplicatedStorage.Shared.Services.BuildService.BuildServiceClient)

BuildServiceClient:init()

-- while true do
-- 	BuildServiceClient:attemptBuild(CFrame.new(10, 5, 1))
-- 	task.wait(1)
-- end

-- [[]]

--////////////////////////////////////////////////////////////
-- Data Servce
--////////////////////////////////////////////////////////////

local Data = require(ReplicatedStorage.Shared.Modules.Data).client

Data.currency.Changed(function(n)
	print("Currency Changed To ", n)
end)

-- task.wait(6)

-- print(Data())

--////////////////////////////////////////////////////////////
-- Vide UI
--////////////////////////////////////////////////////////////

local MountUI = require(ReplicatedStorage.Shared.Modules.MountUI)
