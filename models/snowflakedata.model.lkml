connection: "snowflake_demo"

# include all the views
include: "/views/**/*.view"

datagroup: snowflakedata_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: snowflakedata_default_datagroup

explore: call_center {}

explore: catalog_page {}

explore: catalog_returns {}

explore: catalog_sales {}

explore: customer {}

explore: customer_address {}

explore: customer_demographics {}

explore: date_dim {}

explore: dbgen_version {}

explore: household_demographics {}

explore: income_band {}

explore: inventory {}

explore: item {}

explore: promotion {}

explore: reason {}

explore: ship_mode {}

explore: store {}

explore: store_returns {}

explore: store_returns_bkp {}

explore: store_sales {
  join:  customer{
    type: left_outer
    relationship: many_to_one
    sql_on: ${store_sales.ss_store_sk} = ${customer.c_customer_sk} ;;
  }
}

explore: store_sales_bkp {}

explore: time_dim {}

explore: warehouse {}

explore: web_page {}

explore: web_returns {}

explore: web_returns_bkp {}

explore: web_sales {}

explore: web_sales_bkp {}

explore: web_site {}
