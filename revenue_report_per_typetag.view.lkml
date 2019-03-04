view: revenue_report_per_typetag {
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
    hidden: yes
  }

  dimension: adunitname {
    type: string
    sql: ${TABLE}.adunitname ;;
    hidden: yes
  }

  dimension_group: revenue {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
      month_name
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
    drill_fields: [detail*]
  }


  dimension: ptqs {
    type: number
    sql: ${TABLE}.ptqs ;;
  }

  dimension: typetag {
    type: string
    description: "Typetag is to connect Bing revenue data with frontend tracking events"
    sql: ${TABLE}.typetag ;;
  }
  dimension: hour_raw {
    type: number
    hidden: yes
    sql: ${TABLE}.hour ;;
  }

  dimension: hour {
    type: date_hour
    group_label: "Revenue Date"
    convert_tz: no
    datatype: date
    sql: cast(${revenue_date}|| ' ' || ${hour_raw} ||':00:00' as timestamp)  ;;
    drill_fields: [detail*]
  }


  dimension: devicetype {
    label: "Device Type"
    view_label: "Locality"
    type: string
    sql: case when ${TABLE}.devicetype ='HiFi Phone' then 'Mobile' when ${TABLE}.devicetype= 'PC' then 'Desktop'
      ELSE ${TABLE}.devicetype END;;
    drill_fields: [detail*]
  }


  dimension: language {
    group_label: "Locality"
    view_label: "Locality"
    type: string
    sql: ${TABLE}.language ;;
    drill_fields: [detail*]
  }

  dimension:market {
    group_label: "Locality"
    view_label: "Locality"
    type: string
    description: "Bing market allocated to the user"
    map_layer_name: countries
    sql: ${TABLE}.market;;
    drill_fields: [detail*]
  }

  dimension:country {
    group_label: "Locality"
    view_label: "Locality"
    type: string
    description: "User location country"
    map_layer_name: countries
    sql:  ${TABLE}.usercountry;;
    drill_fields: [detail*]
  }
  dimension: prim_key {
    type: number
    primary_key: yes
    hidden: yes
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

  measure: gross_revenue{
    type: sum
    sql:  ${estimatedrevenue};;
  }

  measure: cost_to_serve{
    view_label: "Locality"
    type: sum
    label: "Cost To Serve EUR"
    description: "Calculates the cost of 1000 searches"
    sql:${srpvs_raw}/1000*0.88;;
  }
  measure: srpvs{
    type: sum
    sql: ${srpvs_raw} ;;
    drill_fields: [detail*]
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
    drill_fields: [detail*]
  }
  measure: net_revenue {
    label: "Net Revenue (EUR)"
    type: sum
    ###FORMULA: (Gross revenue *98,78% (aka Revenue Adjustment) * 95% (aka Fees for Credit card and such)
    #  - Cost To Serve (which is 1 USD per 1000 srpvs with current exchange rate 0.88 EUR))
    #  * 88% (12% deduction fro MSFT as Royalties)
    sql:( ${TABLE}.estimatedrevenue*0.9878*0.95 - (${TABLE}.srpvs/1000)*0.88)*0.88 ;;
    value_format: "\"€\"0"
    drill_fields: [detail*]
  }
  measure: gross_rpmi{
    label: "Gross RPM - Ad Impressions (EUR)"
    description: "Gross revenue per thousand ad impressions"
    type: number
    sql: ${gross_revenue}/(${impressions}/1000) ;;
    value_format: "\"€\"0.00"
    drill_fields: [detail*]
  }
  measure: click_trough_rate {
    description: "% of Ad Impressions that were clicked"
    type: number
    sql: ${clicks}/(${impressions}) ;;
    value_format: "0.000%"
  }

  measure: net_rpm{
    label: "Net RPM (EUR)"
    type: number
    sql: ${net_revenue}/(${srpvs}/1000) ;;
    value_format: "\"€\"0.00"
    drill_fields: [detail*]
  }
  set: detail {
    fields: [
      adunitname,
      adunitid,
      country,
      devicetype,
      revenue_week,
      revenue_year,
      revenue_month,
      language,
      market
    ]
  }
}
