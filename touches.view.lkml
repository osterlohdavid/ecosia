view: touches {
  sql_table_name: mkt.touches ;;

  dimension: addon {
    type: number
    sql: ${TABLE}.addon ;;
  }

  dimension: br_family {
    type: string
    sql: ${TABLE}.br_family ;;
  }

  dimension: br_lang_2 {
    type: string
    sql: ${TABLE}.br_lang_2 ;;
  }

  dimension_group: collector_tstamp {
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
    sql: ${TABLE}.collector_tstamp ;;
  }

  dimension: domain_userid {
    type: string
    sql: ${TABLE}.domain_userid ;;
  }

  dimension: dvce_ismobile {
    type: yesno
    sql: ${TABLE}.dvce_ismobile ;;
  }

  dimension: event_id {
    type: string
    sql: ${TABLE}.event_id ;;
  }

  dimension: geo_country {
    type: string
    sql: ${TABLE}.geo_country ;;
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

  dimension: page_url {
    type: string
    sql: ${TABLE}.page_url ;;
  }

  dimension: page_urlhost {
    type: string
    sql: ${TABLE}.page_urlhost ;;
  }

  dimension: page_urlpath {
    type: string
    sql: ${TABLE}.page_urlpath ;;
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
    drill_fields: []
  }
}
