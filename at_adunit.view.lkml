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
    sql: case when ${TABLE}.devicetype ='HiFi PHone' then 'Mobile'
    ELSE ${TABLE}.devicetype END;;
  }
  dimension: hour {
    type: number
    sql: ${TABLE}.hour ;;
  }

  dimension_group: date_hour {
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
    sql: cast(${date_date}|| ' ' || ${hour} ||':00:00' as timestamp)  ;;
  }



  dimension: language {
    type: string
    sql: ${TABLE}.language ;;
  }
    dimension: market {
      type: string
      sql: ${TABLE}.market ;;
      hidden: yes
  }
    dimension:market_geo {
      type: string
      map_layer_name: countries
      sql:  ${market};;
  }
  dimension: usercountry {
    type: location
    sql: ${TABLE}.usercountry ;;
  }
  dimension:country {
    type: string
    map_layer_name: countries
    sql:  ${usercountry};;
  }
   dimension: prim_key {
    type: number
    primary_key: yes
    sql: ${TABLE}.prim_key ;;
  }
  dimension: estimatedrevenue {
    type: number
    hidden:  yes
    sql: ${TABLE}.estimatedrevenue ;;
  }
  dimension: srpvs_raw {
    type: number
    hidden: yes
    sql: ${TABLE}.srpvs ;;
  }
  dimension: clicks_raw {
    hidden: yes
    type: number
    sql: ${TABLE}.clicks ;;
  }
  dimension: impressions_raw {
    type: number
    hidden: yes
    sql: ${TABLE}.impressions ;;
  }
  dimension: queries_raw {
    type: number
    hidden: yes
    sql: ${TABLE}.queries ;;
  }

  measure: gross_revenue_eur
  {type: sum
    sql:  ${estimatedrevenue};;
    }

  measure: cost_to_serve
    {type: sum
      label: "Cost To Serve EUR"
      sql:${srpvs_raw}/1000*0.88;;
    }
  measure: srpvs{
    type: sum
    sql: ${srpvs_raw} ;;
  }
  measure: clicks {
    type: sum
    sql: ${clicks_raw};;
  }
  measure: impressions {
    type: sum
    sql: ${impressions_raw} ;;
  }
  measure: queries {
    type: sum
    sql: ${queries_raw} ;;
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
