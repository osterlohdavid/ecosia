view: ftouch_all {
  sql_table_name: mkt.ftouch_all ;;

  dimension: addon {
    type: number
    sql: ${TABLE}.addon ;;
  }

  dimension: arrival_spot {
    label: "Landing Spot"
    description: "Landingpage of the user"
    type: string
    sql: ${TABLE}.arrival_spot ;;
  }

  dimension: br_family {
    label: "Browser"
    type: string
    sql: ${TABLE}.br_family ;;
  }

  dimension: br_lang {
    label: "Language"
    type: string
    sql: ${TABLE}.br_lang ;;
  }

  dimension_group: arrival {
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
    hidden: yes
    sql: ${TABLE}.domain_userid ;;
  }

  dimension: dvce_ismobile {
    type: yesno
    label: "Is this a mobile?"
    sql: ${TABLE}.dvce_ismobile ;;
  }

  dimension: event_id {
    type: string
    hidden: yes
    sql: ${TABLE}.event_id ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.geo_country ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.mkt_campaign ;;
  }

  dimension: content {
    type: string
    sql: ${TABLE}.mkt_content ;;
  }

  dimension: medium {
    type: string
    sql: ${TABLE}.mkt_medium ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.mkt_source ;;
  }

  dimension: term {
    type: string
    sql: ${TABLE}.mkt_term ;;
  }

  dimension: os_type {
    type: string
    sql: ${TABLE}.os_family ;;
  }

  dimension: rank {
    type: number
    hidden:yes
    sql: ${TABLE}.r ;;
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
