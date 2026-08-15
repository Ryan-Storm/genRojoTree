local ReplicatedStorage = game:GetService("ReplicatedStorage")

local DataServiceTyped = require(ReplicatedStorage.Packages.dataservicetyped)
local Vide = require(ReplicatedStorage.Packages.vide)

return function(dataValue: DataServiceTyped.Value<any>)
	local value = Vide.source(dataValue())
	local disconnect = dataValue.Changed(function(newValue)
		value(newValue)
	end)

	Vide.cleanup(disconnect)

	return value
end
