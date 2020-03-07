local mod	= DBM:NewMod("TalonGuards", "DBM-BWL", 1)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("@file-date-integer@")
mod:SetCreatureID(12460, 12461, 99999)--99999 to prevent mod from ending combat after one of each talon guard type die. Mod will effectively ALWAYS wipe, but it has disabled stats/reporting so irrelevant
mod:SetModelID(12460)
mod:RegisterCombat("combat")
mod.noStatistics = true

mod:RegisterEventsInCombat(
	"SPELL_DAMAGE",
	"SPELL_PERIODIC_DAMAGE",
	"PLAYER_TARGET_CHANGED"
)

local warnVuln			= mod:NewAnnounce("WarnVuln", 1)

local vulnerabilities = {
	-- [guid]: {topHit, school}
}

--Constants
local vulnMobs = {
	[12460] = "Death Talon Wyrmguard",
	[12461] = "Death Talon Overseer",
--	[14020] = "Chromaggus",
}

-- https://wow.gamepedia.com/COMBAT_LOG_EVENT
local spellInfo = {
	[2] =	{"Holy",	{r=255, g=230, b=128},	"135924"},-- Smite
	[4] =	{"Fire",	{r=255, g=128, b=0},	"135808"},-- Pyroblast
	[8] =	{"Nature",	{r=77, g=255, b=77},	"136006"},-- Wrath
	[16] =	{"Frost",	{r=128, g=255, b=255},	"135846"},-- Frostbolt
	[32] =	{"Shadow",	{r=128, g=128, b=255},	"136197"},-- Shadow Bolt
	[64] =	{"Arcane",	{r=255, g=128, b=255},	"136096"},-- Arcane Missiles
}

local vulnSpells = {
	[22277] = 4,
	[22280] = 8,
	[22278] = 16,
	[22279] = 32,
	[22281] = 64,
}

--Local Functions
-- in theory this should only alert on a new vulnerability on your target or when you change target
local function update_vulnerability(self)
	local target = UnitGUID("target")
	local tinfo	= vulnerabilities[target]
	local cid = self:GetCIDFromGUID(target)
	if tinfo == nil or vulnMobs[cid] == nil then
		return
	end

	local info = spellInfo[tinfo[2]]
	local name = L[info[1]] or info[1]

	warnVuln.icon = info[3]
	warnVuln:Show(name)
end

local function check_spell_damage(self, target, amount, spellSchool, periodic)
	local topVulnHit = vulnerabilities[target] and vulnerabilities[target][1] or 700
	if amount > topVulnHit then
		DBM:Debug("Update vuln "..tostring(amount)..' > '..tostring(topVulnHit)..' '..tostring(target))
		vulnerabilities[target] = {amount, spellSchool}
		update_vulnerability(self)
	end
end

local function check_target_vulns(self)
	local target = UnitGUID("target")
	local cid = self:GetCIDFromGUID(target)
	if vulnMobs[cid] == nil then
		return
	end

	--for i = 1, 32 do
		--local spellid = select(10, UnitBuff('target', i))
		local spellId = select(10, DBM:UnitBuff("target", 22277, 22280, 22278, 22279, 22281)) or 0
		local vulnSchool = vulnSpells[spellid]
		if vulnSchool ~= nil then
			return check_spell_damage(self, target, 10000, vulnSchool, false)
		end
	--end
end

function mod:OnCombatStart()
	table.wipe(vulnerabilities)
	check_target_vulns(self)
end

function mod:OnCombatEnd()
	table.wipe(vulnerabilities)
end

function mod:SPELL_DAMAGE(_, _, _, _, destGUID, _, _, _, _, _, spellSchool, amount)
	check_spell_damage(self, destGUID, amount, spellSchool, false)
end

function mod:SPELL_PERIODIC_DAMAGE(_, _, _, _, destGUID, _, _, _, _, _, spellSchool, amount)
	check_spell_damage(self, destGUID, amount, spellSchool, true)
end

function mod:PLAYER_TARGET_CHANGED()
	check_target_vulns(self)
	update_vulnerability(self)
end
