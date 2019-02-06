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
  dimension: estimatedrevenue {
    type: number
    sql: ${TABLE}.estimatedrevenue ;;
  }
  measure: gross_revenue_eur
  {type: sum
    label: "Gross Revenue EUR"
    sql:${TABLE}.estimatedrevenue;;
    }

  measure: cost_to_serve
    {type: sum
      label: "Cost To Serve EUR"
      sql:${TABLE}.srpvs/1000*0.88;;
    }
  measure: srpvs {
    label: "SRPVS"
    type: sum
    sql: ${TABLE}.srpvs ;;
  }
  measure: clicks {
    label: "Clicks"
    type: sum
    sql: ${TABLE}.clicks ;;
  }
  measure: impressions {
    type: sum
    sql: ${TABLE}.impressions ;;
  }
  measure: queries {
    type: sum
    sql: ${TABLE}.queries ;;
  }
  measure: net_revenue {
    label: "Net_Revenue (EUR)"
    type: sum
    ###FORMULA: (Gross revenue *98,78% (aka Revenue Adjustment) * 95% (aka Fees for Credit card and such)
    #  - Cost To Serve (which is 1 USD per 1000 srpvs with current exchange rate 0.88 EUR))
    #  * 88% (12% deduction fro MSFT as Royalties)
    sql:( ${TABLE}.estimatedrevenue*0.9878*0.95 - (${TABLE}.srpvs/1000)*0.88)*0.88 ;;
  }
  measure: net_rpm{
    label: "Net RPM (EUR)"
    type: number
    sql: ${net_revenue}/${TABLE}.srpvs/1000 ;;
  }
}
