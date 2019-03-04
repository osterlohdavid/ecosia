view: arrivals {
  sql_table_name: mkt.arrivals ;;

  dimension: arrivals {
    type: number
    description: "Users Landing per day"
    sql: ${TABLE}.arrivals ;;
  }

  dimension_group: Arrival {
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

  measure: Aggregated {
    type: sum
    sql: ${arrivals} ;;
    drill_fields: []
  }
}
