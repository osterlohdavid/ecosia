  view: at_typetag {
    derived_table: {
      sql:
      SELECT
        row_number() OVER(ORDER BY date,hour,adunitid,devicetype) AS prim_key,
        *
      FROM pubcenter.at_typetag;;
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

  dimension: devicetype {
    type: string
    sql: ${TABLE}.devicetype ;;
  }

  dimension: estimatedrevenue {
    type: number
    sql: ${TABLE}.estimatedrevenue ;;
  }

  dimension: hour {
    type: number
    sql: ${TABLE}.hour ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: market {
    type: string
    sql: ${TABLE}.market ;;
  }

  dimension: ptqs {
    type: number
    sql: ${TABLE}.ptqs ;;
  }

  dimension: queries {
    type: number
    sql: ${TABLE}.queries ;;
  }

  dimension: srpvs {
    type: number
    sql: ${TABLE}.srpvs ;;
  }

  dimension: typetag {
    type: string
    sql: ${TABLE}.typetag ;;
  }
    dimension: prim_key {
      type: number
      primary_key: yes
      sql: ${TABLE}.prim_key ;;
    }

  measure: count {
    type: count
    drill_fields: [adunitname]
  }
}