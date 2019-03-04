view: install_attr {
  sql_table_name: install.attr ;;

  dimension: addon {
    type: number
    sql: ${TABLE}.addon ;;
  }

  dimension_group: arrival_tp {
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
    sql: ${TABLE}.arrival_tp ;;
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

  dimension: mkt_campaign {
    type: string
    sql: ${TABLE}.mkt_campaign ;;
  }

  dimension: mkt_content {
    type: string
    sql: ${TABLE}.mkt_content ;;
  }

  dimension: mkt_medium {
    type: string
    sql: ${TABLE}.mkt_medium ;;
  }

  dimension: mkt_source {
    type: string
    sql: ${TABLE}.mkt_source ;;
  }

  dimension: mkt_term {
    type: string
    sql: ${TABLE}.mkt_term ;;
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

  dimension: refr_medium {
    type: string
    sql: ${TABLE}.refr_medium ;;
  }

  dimension: refr_source {
    type: string
    sql: ${TABLE}.refr_source ;;
  }

  dimension: refr_term {
    type: string
    sql: ${TABLE}.refr_term ;;
  }

  dimension: refr_urlhost {
    type: string
    sql: ${TABLE}.refr_urlhost ;;
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
