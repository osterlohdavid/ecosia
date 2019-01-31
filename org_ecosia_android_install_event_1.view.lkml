view: org_ecosia_android_install_event_1 {
  sql_table_name: atomic.org_ecosia_android_install_event_1 ;;

  dimension: app_referral {
    type: string
    sql: ${TABLE}.app_referral ;;
  }

  dimension: app_v {
    type: string
    sql: ${TABLE}.app_v ;;
  }

  dimension: ref_parent {
    type: string
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

  dimension: utm_campaign {
    type: string
    sql: ${TABLE}.utm_campaign ;;
  }

  dimension: utm_content {
    type: string
    sql: ${TABLE}.utm_content ;;
  }

  dimension: utm_medium {
    type: string
    sql: ${TABLE}.utm_medium ;;
  }

  dimension: utm_source {
    type: string
    sql: ${TABLE}.utm_source ;;
  }

  dimension: utm_term {
    type: string
    sql: ${TABLE}.utm_term ;;
  }

  measure: count {
    type: count
    drill_fields: [schema_name]
  }
}
