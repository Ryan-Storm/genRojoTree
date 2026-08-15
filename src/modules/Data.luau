local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DataServiceTyped = require(ReplicatedStorage.Packages.dataservicetyped)

type WeaponData = {
	dmg: number,
	swingSpeed: number,
}

type InventoryData = {
	items: { [string]: number },
	equippedItemId: string?,
}

local template = {
	-- Currency Project
	currency = 0,

	-- Settings Project
	settings = {
		music = true,
		sfx = true,
	},

	-- Inventory Project
	inventory = {
		items = {} :: { [string]: number },
		equipped = nil :: string?,
	},
}

return DataServiceTyped({
	template = template,
})
