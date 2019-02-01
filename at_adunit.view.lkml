view: at_adunit {
 derived_table: {
    sql:
      SELECT
        row_number() OVER(ORDER BY date,hour,adunitid,devicetype) AS prim_key,
        *
      FROM pubcenter.at_adunit ;;
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
    label: "Device Type"
    type: string
    sql: ${TABLE}.devicetype ;;
  }

  dimension: hour {
    type: number
    sql: ${TABLE}.hour ;;
  }
  dimension: dateandtime
  {
    type: date_time
    datatype: datetime
    sql: ${TABLE}.date||' '||${TABLE}.hour||':00:00' ;;
    }

  dimension: language {
    type: string
    sql: ${TABLE}.language ;;
  }

  dimension: market {
    type: string
    sql: ${TABLE}.market ;;
  }



  dimension: usercountry {
    type: string
    sql: ${TABLE}.usercountry ;;
  }

   dimension: prim_key {
    type: number
    primary_key: yes
    sql: ${TABLE}.prim_key ;;
  }
  measure: estimatedrevenue {
    label: "Gross Revenue (EUR)"
    type: number
    sql:SUM( ${TABLE}.estimatedrevenue) ;;
  }
  measure: srpvs {
    label: "SRPVS"
    type: number
    sql: SUM(${TABLE}.srpvs) ;;
  }
  measure: clicks {
    label: "Clicks"
    type: number
    sql: SUM(${TABLE}.clicks) ;;
  }
  measure: impressions {
    type: number
    sql: SUM(${TABLE}.impressions) ;;
  }
  measure: queries {
    type: number
    sql: SUM(${TABLE}.queries) ;;
  }
}
