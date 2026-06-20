local ReplicatedStorage = game:GetService("ReplicatedStorage")

local BuildServiceClient = require(ReplicatedStorage.Shared.Services.BuildService.BuildServiceClient)

BuildServiceClient:init()

while true do
	BuildServiceClient:attemptBuild(CFrame.new(10, 5, 1))
	task.wait(1)
end
