use diesel::prelude::*;
use serde::{Deserialize, Serialize};
use crate::schema::{weight_systems, account_weights, asset_weights};

#[derive(Debug, Clone, Queryable, Selectable, Insertable, AsChangeset, Serialize, Deserialize)]
#[diesel(table_name = weight_systems)]
pub struct DbWeightSystem {
    pub id: String,
    pub name: String,
    pub is_default: bool,
    pub created_at: chrono::NaiveDateTime,
}

#[derive(Debug, Clone, Queryable, Selectable, Insertable, AsChangeset, Serialize, Deserialize)]
#[diesel(table_name = account_weights)]
pub struct DbAccountWeight {
    pub id: String,
    pub account_id: String,
    pub weight_system_id: String,
    pub weight_value: f64,
}

#[derive(Debug, Clone, Queryable, Selectable, Insertable, AsChangeset, Serialize, Deserialize)]
#[diesel(table_name = asset_weights)]
pub struct DbAssetWeight {
    pub id: String,
    pub asset_id: String,
    pub weight_system_id: String,
    pub weight_value: f64,
}
