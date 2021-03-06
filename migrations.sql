-- 1 up
CREATE SCHEMA ew;

CREATE TABLE ew.pilots (
       id   CHARACTER VARYING(10) PRIMARY KEY CHECK (id ~ '^[0-9]+$' AND id::bigint < 2100000000),
       name TEXT                  NOT NULL UNIQUE
);

CREATE TABLE ew.harvestable_types (
       id     CHARACTER VARYING(5) PRIMARY KEY NOT NULL CHECK (id ~ '^[0-9]{1,5}$'),
       name   TEXT                 NOT NULL UNIQUE,
       volume NUMERIC              NOT NULL CHECK (volume > 0)
);

CREATE TABLE ew.ops (
       id      SERIAL                   PRIMARY KEY,
       foreman CHARACTER VARYING(10)    REFERENCES ew.pilots (id),
       start   TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT current_timestamp,
       finish  TIMESTAMP WITH TIME ZONE
);

CREATE TYPE pilot_role AS ENUM ('Miner', 'Defender', 'Hauler', 'Orca', 'Rorqual');

CREATE TABLE ew.op_participants (
       op_id    INTEGER               REFERENCES ew.ops (id),
       pilot_id CHARACTER VARYING(10) REFERENCES ew.pilots (id),
       role     pilot_role            NOT NULL,
       share    NUMERIC(3,2)          NOT NULL,
       paid     BOOLEAN               DEFAULT FALSE,
       PRIMARY KEY (op_id, pilot_id)
);

CREATE TABLE ew.harvested (
    op_id       INTEGER,
    pilot_id    CHARACTER VARYING(10),
    resource_id CHARACTER VARYING(5) REFERENCES ew.harvestable_types(id),
    units       INTEGER              NOT NULL DEFAULT 0,
    FOREIGN KEY (op_id, pilot_id) REFERENCES ew.op_participants (op_id, pilot_id)
);

CREATE INDEX harvested_op_id_idx ON ew.harvested (op_id);

INSERT INTO ew.harvestable_types VALUES
	('18', 'Plagioclase', 0.35),
	('19', 'Spodumain', 16),
	('20', 'Kernite', 1.2),
	('21', 'Hedbergite', 3),
	('22', 'Arkonor', 16),
	('1223', 'Bistot', 16),
	('1224', 'Pyroxeres', 0.3),
	('1225', 'Crokite', 16),
	('1226', 'Jaspet', 2),
	('1227', 'Omber', 0.6),
	('1228', 'Scordite', 0.15),
	('1229', 'Gneiss', 5),
	('1230', 'Veldspar', 0.1),
	('1231', 'Hemorphite', 3),
	('1232', 'Dark Ochre', 8),
	('11396', 'Mercoxit', 40),
	('16262', 'Clear Icicle', 1000),
	('16263', 'Glacial Mass', 1000),
	('16264', 'Blue Ice', 1000),
	('16265', 'White Glaze', 1000),
	('16266', 'Glare Crust', 1000),
	('16267', 'Dark Glitter', 1000),
	('16268', 'Gelidus', 1000),
	('16269', 'Krystallos', 1000),
	('17425', 'Crimson Arkonor', 16),
	('17426', 'Prime Arkonor', 16),
	('17428', 'Triclinic Bistot', 16),
	('17429', 'Monoclinic Bistot', 16),
	('17432', 'Sharp Crokite', 16),
	('17433', 'Crystalline Crokite', 16),
	('17436', 'Onyx Ochre', 8),
	('17437', 'Obsidian Ochre', 8),
	('17440', 'Vitric Hedbergite', 3),
	('17441', 'Glazed Hedbergite', 3),
	('17444', 'Vivid Hemorphite', 3),
	('17445', 'Radiant Hemorphite', 3),
	('17448', 'Pure Jaspet', 2),
	('17449', 'Pristine Jaspet', 2),
	('17452', 'Luminous Kernite', 1.2),
	('17453', 'Fiery Kernite', 1.2),
	('17455', 'Azure Plagioclase', 0.35),
	('17456', 'Rich Plagioclase', 0.35),
	('17459', 'Solid Pyroxeres', 0.3),
	('17460', 'Viscous Pyroxeres', 0.3),
	('17463', 'Condensed Scordite', 0.15),
	('17464', 'Massive Scordite', 0.15),
	('17466', 'Bright Spodumain', 16),
	('17467', 'Gleaming Spodumain', 16),
	('17470', 'Concentrated Veldspar', 0.1),
	('17471', 'Dense Veldspar', 0.1),
	('17865', 'Iridescent Gneiss', 5),
	('17866', 'Prismatic Gneiss', 5),
	('17867', 'Silvery Omber', 0.6),
	('17868', 'Golden Omber', 0.6),
	('17869', 'Magma Mercoxit', 40),
	('17870', 'Vitreous Mercoxit', 40),
	('17975', 'Thick Blue Ice', 1000),
	('17976', 'Pristine White Glaze', 1000),
	('17977', 'Smooth Glacial Mass', 1000),
	('17978', 'Enriched Clear Icicle', 1000),
	('25268', 'Amber Cytoserocin', 10),
	('25273', 'Golden Cytoserocin', 10),
	('25274', 'Viridian Cytoserocin', 10),
	('25275', 'Celadon Cytoserocin', 10),
	('25276', 'Malachite Cytoserocin', 10),
	('25277', 'Lime Cytoserocin', 10),
	('25278', 'Vermillion Cytoserocin', 10),
	('25279', 'Azure Cytoserocin', 10),
	('28695', 'Azure Mykoserocin', 10),
	('28694', 'Amber Mykoserocin', 10),
	('28696', 'Celadon Mykoserocin', 10),
	('28697', 'Golden Mykoserocin', 10),
	('28698', 'Lime Mykoserocin', 10),
	('28699', 'Malachite Mykoserocin', 10),
	('28700', 'Vermillion Mykoserocin', 10),
	('28701', 'Viridian Mykoserocin', 10),
	('30370', 'Fullerite-C50', 1),
	('30371', 'Fullerite-C60', 1),
	('30372', 'Fullerite-C70', 1),
	('30373', 'Fullerite-C72', 2),
	('30374', 'Fullerite-C84', 2),
	('30375', 'Fullerite-C28', 2),
	('30376', 'Fullerite-C32', 5),
	('30377', 'Fullerite-C320', 5),
	('30378', 'Fullerite-C540', 10);

COMMENT ON TABLE ew.harvestable_types IS 'Data ported from CCP/EVE Kronos 1.0 database';

-- 1 down
DROP TABLE ew.harvested;
DROP TABLE ew.op_participants
DROP TYPE pilot_role;
DROP TABLE ew.ops;
DROP TABLE ew.harvestable_types
DROP TABLE ew.pilots;
DROP SCHEMA ew;

-- 2 up
CREATE EXTENSION pgcrypto;

-- 2 down
DROP EXTENSION pgcrypto;
