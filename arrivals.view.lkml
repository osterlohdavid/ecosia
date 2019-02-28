view: arrivals {
  sql_table_name: mkt.arrivals ;;

  dimension: arrivals {
    type: number
    sql: ${TABLE}.arrivals ;;
  }

  dimension_group: collector_tstamp {
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
    sql: ${TABLE}.collector_tstamp ;;
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
