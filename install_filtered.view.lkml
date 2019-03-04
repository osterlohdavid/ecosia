view: install_filtered {
  sql_table_name: install.filtered ;;

  dimension: addon {
    type: number
    sql: ${TABLE}.addon ;;
  }

  dimension: br_family {
    type: string
    sql: ${TABLE}.br_family ;;
  }

  dimension: br_lang {
    type: string
    sql: ${TABLE}.br_lang ;;
  }

  dimension: br_name {
    type: string
    sql: ${TABLE}.br_name ;;
  }

  dimension: br_version {
    type: string
    sql: ${TABLE}.br_version ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: devicetype {
    type: string
    sql: ${TABLE}.devicetype ;;
  }

  dimension: domain_userid {
    type: string
    sql: ${TABLE}.domain_userid ;;
  }

  dimension: dvce_ismobile {
    type: yesno
    sql: ${TABLE}.dvce_ismobile ;;
  }

  dimension: dvce_type {
    type: string
    sql: ${TABLE}.dvce_type ;;
  }

  dimension: event_id {
    type: string
    sql: ${TABLE}.event_id ;;
  }

  dimension_group: first_addon_search_tstamp {
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
    sql: ${TABLE}.first_addon_search_tstamp ;;
  }

  dimension: firstsearch {
    type: number
    sql: ${TABLE}.firstsearch ;;
  }

  dimension: geo_city {
    type: string
    sql: ${TABLE}.geo_city ;;
  }

  dimension: geo_country {
    type: string
    sql: ${TABLE}.geo_country ;;
  }

  dimension: geo_region {
    type: string
    sql: ${TABLE}.geo_region ;;
  }

  dimension_group: install_timestamp {
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
    sql: ${TABLE}.install_timestamp ;;
  }

  dimension: language {
    type: string
    sql: ${TABLE}.language ;;
  }

  dimension: lasttree {
    type: number
    sql: ${TABLE}.lasttree ;;
  }

  dimension: os_family {
    type: string
    sql: ${TABLE}.os_family ;;
  }

  dimension: personal {
    type: number
    sql: ${TABLE}.personal ;;
  }

  dimension: plt_name {
    type: string
    sql: ${TABLE}.plt_name ;;
  }

  dimension: plt_v {
    type: string
    sql: ${TABLE}.plt_v ;;
  }

  dimension: r {
    type: number
    sql: ${TABLE}.r ;;
  }

  dimension: trees {
    type: number
    sql: ${TABLE}.trees ;;
  }

  dimension: typetag {
    type: string
    sql: ${TABLE}.typetag ;;
  }

  measure: count {
    type: count
    drill_fields: [plt_name, br_name]
  }
}
