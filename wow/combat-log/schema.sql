DROP FUNCTION IF EXISTS wowhead_link;
DROP TABLE IF EXISTS auras;

CREATE TABLE IF NOT EXISTS auras (
    id                  BIGSERIAL,

    instance_id         integer,
    instance_name       varchar(255),

    encounter_id         integer,
    encounter_name       varchar(255),

    dest_unit           varchar(32),
    dest_name           varchar(255),
    dest_flags          integer,

    source_unit         varchar(32),
    source_name         varchar(255),
    source_flags        integer,

    spell_id            varchar(16),
    spell_name          varchar(255),
    spell_description   text,

    can_apply_aura      boolean DEFAULT false,
    dispel_name         varchar(255),
    is_boss_aura        boolean DEFAULT false,
    is_harmful          boolean DEFAULT false,
    is_helpful          boolean DEFAULT false,
    is_nameplate_only   boolean DEFAULT false,
    is_raid             boolean DEFAULT false,
    is_stealable        boolean DEFAULT false,
    "event"             varchar(255)
);

CREATE OR REPLACE FUNCTION wowhead_link(v auras)
RETURNS text AS $$
BEGIN
    IF (v.spell_id IS NULL) THEN
        RETURN NULL;
    ELSE
        RETURN format('https://www.wowhead.com/spell=%s', v.spell_id);
    END IF;
END;
$$ LANGUAGE plpgsql;

-- COMBATLOG_OBJECT_AFFILIATION_PARTY integer := 2;
-- COMBATLOG_OBJECT_AFFILIATION_RAID integer := 4;
-- COMBATLOG_OBJECT_CONTROL_PLAYER integer := 256;
-- COMBATLOG_OBJECT_TYPE_PLAYER integer := 1024;
-- COMBATLOG_OBJECT_TYPE_PET integer := 4096;
-- COMBATLOG_OBJECT_TYPE_GUARDIAN integer := 8192;
CREATE OR REPLACE FUNCTION CombatLog_Object_IsA(flag integer, mask integer)
RETURNS boolean AS $$
BEGIN
    RETURN (flag::bit(16) & mask::bit(16))::integer = mask;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION is_player(flag integer)
RETURNS boolean AS $$
BEGIN
    RETURN CombatLog_Object_IsA(flag, 1024);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION is_pet(flag integer)
RETURNS boolean AS $$
BEGIN
    RETURN CombatLog_Object_IsA(flag, 4096);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION is_guardian(flag integer)
RETURNS boolean AS $$
BEGIN
    RETURN CombatLog_Object_IsA(flag, 8192);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION is_party(flag integer)
RETURNS boolean AS $$
BEGIN
    RETURN CombatLog_Object_IsA(flag, 2);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION is_enemy(flag integer)
RETURNS boolean AS $$
BEGIN
    RETURN CombatLog_Object_IsA(flag, 64);
END;
$$ LANGUAGE plpgsql;

\COPY auras(instance_id,instance_name,encounter_id,encounter_name,dest_unit,dest_name,dest_flags,source_unit,source_name,source_flags,spell_id,spell_name,spell_description,can_apply_aura,dispel_name,is_boss_aura,is_harmful,is_helpful,is_nameplate_only,is_raid,is_stealable, "event") FROM '/home/wow/combat_log.csv' WITH (FORMAT CSV, DELIMITER '\', HEADER true);

UPDATE auras a SET dest_unit = 'player' WHERE is_player(a.dest_flags);
UPDATE auras a SET dest_unit = 'pet' WHERE (is_pet(a.dest_flags) OR is_guardian(a.dest_flags));

UPDATE auras a SET source_unit = 'player' WHERE is_player(a.source_flags);
UPDATE auras a SET source_unit = 'pet' WHERE (is_pet(a.source_flags) OR is_guardian(a.source_flags));
