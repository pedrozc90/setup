local data = dofile("data.lua")

local file = "combat_log.csv"
local separator = "\\"
local headers = {
    "instance_id",
    "instance_name",
    "encounter_id",
    "encounter_name",
    "dest_unit",
    "dest_name",
    "dest_flags",
    "source_unit",
    "source_name",
    "source_flags",
    "spell_id",
    "spell_name",
    "spell_description",
    "can_apply_aura",
    "dispel_name",
    "is_boss_aura",
    "is_harmful",
    "is_helpful",
    "is_nameplate_only",
    "is_raid",
    "is_stealable",
    "event"
}

local file = assert(io.open(file, "w"))
file:write(table.concat(headers, separator) .. "\n")

for instanceID, instanceData in pairs(data) do
    for _, row in ipairs(instanceData) do
        local spellDescription = string.gsub(row.spellDescription or "", "%s+", " ")
        local line =
            instanceID
            .. separator .. (row.instanceName or "")
            .. separator .. (row.encounterID or "")
            .. separator .. (row.encounterName or "")
            .. separator .. (row.destUnit or row.distUnit or "")
            .. separator .. (row.destName or "")
            .. separator .. (row.destFlags or "")
            .. separator .. (row.sourceUnit or "")
            .. separator .. (row.sourceName or "")
            .. separator .. (row.sourceFlags or "")
            .. separator .. (row.spellID or "")
            .. separator .. (row.spellName or "")
            .. separator .. (spellDescription)
            .. separator .. tostring(row.canApplyAura or false)
            .. separator .. tostring(row.dispelName or false)
            .. separator .. tostring(row.isBossAura or false)
            .. separator .. tostring(row.isHarmful or false)
            .. separator .. tostring(row.isHelpful or false)
            .. separator .. tostring(row.isNameplateOnly or false)
            .. separator .. tostring(row.isRaid or false)
            .. separator .. tostring(row.isStealable or false)
            .. separator .. tostring(row.event or "?")
        file:write(line .. "\n")
    end
end

file:close()
