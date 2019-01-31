view: org_ecosia_knowledge_context_1 {
  sql_table_name: atomic.org_ecosia_knowledge_context_1 ;;

  dimension: 0_entity_population {
    type: string
    sql: ${TABLE}."0.entity_population" ;;
  }

  dimension: 0_name {
    type: string
    sql: ${TABLE}."0.name" ;;
  }

  dimension: 0_typehint {
    type: string
    sql: ${TABLE}."0.typehint" ;;
  }

  dimension: 1_entity_population {
    type: string
    sql: ${TABLE}."1.entity_population" ;;
  }

  dimension: 1_name {
    type: string
    sql: ${TABLE}."1.name" ;;
  }

  dimension: 1_typehint {
    type: string
    sql: ${TABLE}."1.typehint" ;;
  }

  dimension: 2_entitypopulation {
    type: string
    sql: ${TABLE}."2.entitypopulation" ;;
  }

  dimension: 2_name {
    type: string
    sql: ${TABLE}."2.name" ;;
  }

  dimension: 2_typehint {
    type: string
    sql: ${TABLE}."2.typehint" ;;
  }

  dimension: 3_entitypopulation {
    type: string
    sql: ${TABLE}."3.entitypopulation" ;;
  }

  dimension: 3_name {
    type: string
    sql: ${TABLE}."3.name" ;;
  }

  dimension: 3_typehint {
    type: string
    sql: ${TABLE}."3.typehint" ;;
  }

  dimension: 4_entitypopulation {
    type: string
    sql: ${TABLE}."4.entitypopulation" ;;
  }

  dimension: 4_name {
    type: string
    sql: ${TABLE}."4.name" ;;
  }

  dimension: 4_typehint {
    type: string
    sql: ${TABLE}."4.typehint" ;;
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
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      4_name,
      3_name,
      2_name,
      1_name,
      0_name,
      schema_name
    ]
  }
}
