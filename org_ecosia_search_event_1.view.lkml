view: org_ecosia_search_event_1 {
  sql_table_name: atomic.org_ecosia_search_event_1 ;;

  dimension: ads_shown {
    type: string
    label: "ad visible"
    sql: ${TABLE}.ads_shown ;;
  }

  dimension: comp_shown {
    type: string
    label: "computation visible"
    sql: ${TABLE}.comp_shown ;;
  }

  dimension: entity_shown {
    type: yesno
    label: "entity visible"
    sql: ${TABLE}.entity_shown ;;
  }

  dimension: page_num {
    type: number
    sql: ${TABLE}.page_num ;;
  }

  dimension: plt_name {
    type: string
    sql: ${TABLE}.plt_name ;;
  }

  dimension: plt_v {
    type: string
    sql: ${TABLE}.plt_v ;;
  }

  dimension: query {
    type: string
    sql: ${TABLE}.query ;;
  }

  dimension: ref_parent {
    type: string
    hidden:yes
    sql: ${TABLE}.ref_parent ;;
  }

  dimension: ref_root {
    type: string
    hidden: yes
    sql: ${TABLE}.ref_root ;;
  }

  dimension: ref_tree {
    type: string
    hidden: yes
    sql: ${TABLE}.ref_tree ;;
  }

  dimension: root_id {
    type: string
    primary_key: yes
    hidden: yes
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
    hidden: yes
    sql: ${TABLE}.schema_format ;;
  }

  dimension: schema_name {
    type: string
    hidden: yes
    sql: ${TABLE}.schema_name ;;
  }

  dimension: schema_vendor {
    type: string
    hidden: yes
    sql: ${TABLE}.schema_vendor ;;
  }

  dimension: schema_version {
    type: string
    hidden: yes
    sql: ${TABLE}.schema_version ;;
  }

  dimension: search_type {
    type: string
    sql: ${TABLE}.search_type ;;
  }

  measure: count {
    type: count
    drill_fields: [plt_name, schema_name]
  }
}
