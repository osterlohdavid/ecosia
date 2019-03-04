view: install_attr_agg {
  sql_table_name: install.attr_agg ;;

  dimension: dvce_ismobile {
    type: yesno
    sql: ${TABLE}.dvce_ismobile ;;
  }

  dimension: dvce_type {
    type: string
    sql: ${TABLE}.dvce_type ;;
  }

  dimension: geo_country {
    type: string
    sql: ${TABLE}.geo_country ;;
  }

  dimension_group: install_timestamp {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.install_timestamp ;;
  }

  dimension: installs {
    type: number
    sql: ${TABLE}.installs ;;
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

  dimension: ten_trees {
    type: string
    sql: ${TABLE}.ten_trees ;;
  }

  dimension: typetag {
    type: string
    sql: ${TABLE}.typetag ;;
  }

  measure: count {
    type: count
    drill_fields: [plt_name]
  }
}
