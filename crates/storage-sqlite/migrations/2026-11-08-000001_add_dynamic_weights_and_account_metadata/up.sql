ALTER TABLE assets ADD COLUMN duration FLOAT NOT NULL DEFAULT 0.0;
ALTER TABLE accounts ADD COLUMN owner_entity TEXT NOT NULL DEFAULT 'Primary';
ALTER TABLE accounts ADD COLUMN tax_classification TEXT NOT NULL DEFAULT 'Standard Taxable';

CREATE TABLE weight_systems (
    id TEXT NOT NULL PRIMARY KEY,
    name TEXT NOT NULL,
    is_default BOOLEAN NOT NULL DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE account_weights (
    id TEXT NOT NULL PRIMARY KEY,
    account_id TEXT NOT NULL,
    weight_system_id TEXT NOT NULL,
    weight_value FLOAT NOT NULL DEFAULT 1.0,
    FOREIGN KEY(account_id) REFERENCES accounts(id) ON DELETE CASCADE,
    FOREIGN KEY(weight_system_id) REFERENCES weight_systems(id) ON DELETE CASCADE,
    UNIQUE(account_id, weight_system_id)
);

CREATE TABLE asset_weights (
    id TEXT NOT NULL PRIMARY KEY,
    asset_id TEXT NOT NULL,
    weight_system_id TEXT NOT NULL,
    weight_value FLOAT NOT NULL DEFAULT 1.0,
    FOREIGN KEY(asset_id) REFERENCES assets(id) ON DELETE CASCADE,
    FOREIGN KEY(weight_system_id) REFERENCES weight_systems(id) ON DELETE CASCADE,
    UNIQUE(asset_id, weight_system_id)
);
