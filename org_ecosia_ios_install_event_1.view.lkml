view: org_ecosia_ios_install_event_1 {
  sql_table_name: atomic.org_ecosia_ios_install_event_1 ;;

  dimension: app_id {
    type: string
    sql: ${TABLE}.app_id ;;
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

  measure: count {
    type: count
    drill_fields: [schema_name]
  }
}
