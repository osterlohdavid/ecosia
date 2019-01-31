view: org_ecosia_ad_context_2 {
  sql_table_name: atomic.org_ecosia_ad_context_2 ;;

  dimension: bottom {
    type: string
    sql: ${TABLE}.bottom ;;
  }

  dimension: mainline {
    type: string
    sql: ${TABLE}.mainline ;;
  }

  dimension: ref_parent {
    type: string
    hidden: yes
    sql: ${TABLE}.ref_parent ;;
  }

  dimension: ref_root {
    type: string
    hidden: yes
    sql: ${TABLE}.ref_root ;;
  }

  dimension: ref_tree {
    type: string
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

  dimension: sidebar {
    type: string
    sql: ${TABLE}.sidebar ;;
  }

  measure: count {
    type: count
    drill_fields: [schema_name]
  }
}
