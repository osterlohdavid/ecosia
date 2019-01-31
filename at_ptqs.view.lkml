view: at_ptqs {
  sql_table_name: pubcenter.at_ptqs ;;

  dimension: adctr {
    type: number
    sql: ${TABLE}.adctr ;;
  }

  dimension: addensity {
    type: number
    sql: ${TABLE}.addensity ;;
  }

  dimension: adimpressions {
    type: number
    sql: ${TABLE}.adimpressions ;;
  }

  dimension: adunitid {
    type: number
    value_format_name: id
    sql: ${TABLE}.adunitid ;;
  }

  dimension: adunitname {
    type: string
    sql: ${TABLE}.adunitname ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: cpc {
    type: number
    sql: ${TABLE}.cpc ;;
  }

  dimension: ctr {
    type: number
    sql: ${TABLE}.ctr ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: ecpm {
    type: number
    sql: ${TABLE}.ecpm ;;
  }

  dimension: estimatedrevenue {
    type: number
    sql: ${TABLE}.estimatedrevenue ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: ptqs {
    type: number
    sql: ${TABLE}.ptqs ;;
  }

  measure: count {
    type: count
    drill_fields: [adunitname]
  }
}
