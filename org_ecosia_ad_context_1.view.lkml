view: org_ecosia_ad_context_1 {
  sql_table_name: atomic.org_ecosia_ad_context_1 ;;

  dimension: adname_1 {
    type: string
    sql: ${TABLE}.adname_1 ;;
  }

  dimension: adname_2 {
    type: string
    sql: ${TABLE}.adname_2 ;;
  }

  dimension: adname_3 {
    type: string
    sql: ${TABLE}.adname_3 ;;
  }

  dimension: adname_4 {
    type: string
    sql: ${TABLE}.adname_4 ;;
  }

  dimension: adnameside_1 {
    type: string
    sql: ${TABLE}.adnameside_1 ;;
  }

  dimension: adnameside_2 {
    type: string
    sql: ${TABLE}.adnameside_2 ;;
  }

  dimension: adnameside_3 {
    type: string
    sql: ${TABLE}.adnameside_3 ;;
  }

  dimension: ref_parent {
    type: string
    sql: ${TABLE}.ref_parent ;;
  }

  dimension: ref_root {
    type: string
    sql: ${TABLE}.ref_root ;;
  }

  dimension: ref_tree {
    type: string
    sql: ${TABLE}.ref_tree ;;
  }

  dimension: root_id {
    type: string
    sql: ${TABLE}.root_id ;;
  }

  dimension_group: root_tstamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.root_tstamp ;;
  }

  dimension: schema_format {
    type: string
    sql: ${TABLE}.schema_format ;;
  }

  dimension: schema_name {
    type: string
    sql: ${TABLE}.schema_name ;;
  }

  dimension: schema_vendor {
    type: string
    sql: ${TABLE}.schema_vendor ;;
  }

  dimension: schema_version {
    type: string
    sql: ${TABLE}.schema_version ;;
  }

  measure: count {
    type: count
    drill_fields: [schema_name]
  }
}
