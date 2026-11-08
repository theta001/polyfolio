DROP TABLE IF EXISTS asset_weights;
DROP TABLE IF EXISTS account_weights;
DROP TABLE IF EXISTS weight_systems;
ALTER TABLE accounts DROP COLUMN tax_classification;
ALTER TABLE accounts DROP COLUMN owner_entity;
ALTER TABLE assets DROP COLUMN duration;
