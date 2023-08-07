SELECT DISTINCT
    a.encounter_name,
    a.instance_id,
    a.instance_name,
    a.source_unit,
    a.source_name,
    a.source_flags,
    a.dest_unit,
    a.dest_name,
    a.dest_flags,
    a.spell_id,
    a.spell_name,
    a.is_harmful,
    a.is_helpful,
    a.is_raid,
    a.is_boss_aura,
    a.is_stealable,
    a.can_apply_aura,
    wowhead_link(a)     AS link
FROM auras a
WHERE 1 = 1
AND NOT is_player(a.source_flags)
AND NOT is_party(a.source_flags)
AND NOT is_pet(a.source_flags)
AND NOT is_guardian(a.source_flags)
AND a.is_harmful
ORDER BY a.instance_id, a.encounter_name, a.spell_id;

SELECT DISTINCT
    sb.instance_name,
    sb.encounter_name,
    sb.spell_id,
    sb.spell_name,
    sb.link
FROM (
    SELECT DISTINCT
        a.encounter_name,
        a.instance_id,
        a.instance_name,
        a.source_unit,
        a.source_name,
        a.source_flags,
        a.dest_unit,
        a.dest_name,
        a.dest_flags,
        a.spell_id,
        a.spell_name,
        a.is_harmful,
        a.is_helpful,
        a.is_raid,
        a.is_boss_aura,
        a.is_stealable,
        a.can_apply_aura,
        wowhead_link(a)     AS link
    FROM auras a
    WHERE 1 = 1
    AND NOT is_player(a.source_flags)
    AND NOT is_party(a.source_flags)
    AND NOT is_pet(a.source_flags)
    AND NOT is_guardian(a.source_flags)
    AND a.is_harmful
    ORDER BY a.instance_id, a.encounter_name, a.spell_id
) AS sb
ORDER BY sb.instance_name, sb.encounter_name, sb.spell_id;