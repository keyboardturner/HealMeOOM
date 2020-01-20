local HealerSpecs = {
	[105] = true,	--restoration druid
	[270] = true,	--mistweaver monk
	[65] = true,	--holy paladin
	[256] = true,	--discipline priest
	[257] = true,	--holy priest
	[264] = true,	--restoration shaman
};

local frankreynolds = CreateFrame("Frame")
local trashcan = true
local function TakeOutTheTrash()
	trashcan = true
end
frankreynolds:RegisterEvent("UNIT_HEALTH")

local function TheTrashMan()
	if UnitHealth("player") <= (UnitHealthMax("player")*.1) and trashcan == true then
		trashcan = false
		C_Timer.After(10, TakeOutTheTrash)
		DoEmote("HEALME", "player")
	end
end

frankreynolds:SetScript("OnEvent", TheTrashMan)

local billythekid = CreateFrame("Frame")
local bullets = true
local function ShootTheGun()
	bullets = true
end
billythekid:RegisterEvent("UNIT_POWER_UPDATE")

local function CowBoy()
	if HealerSpecs[GetSpecializationInfo(GetSpecialization())] and UnitPower("player", 0) <= (UnitPowerMax("player", 0)*.1) and bullets == true then
		bullets = false
		C_Timer.After(10, ShootTheGun)
		DoEmote("OOM", "player")
	end
end

billythekid:SetScript("OnEvent",CowBoy)