local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DataServiceTyped = require(ReplicatedStorage.Packages.dataservicetyped)

type WeaponData = {
	dmg: number,
	swingSpeed: number,
}

local template = {
	currency = 0,
	inventory = {
		apples = 5,
		oranges = 10,
	},
	settings = {
		music = true,
	},
	tutorial = {
		step = {},
		completed = false,
	},
	words = {} :: { string },
	weapons = {} :: { [string]: WeaponData },
}

return DataServiceTyped({
	template = template,
})
