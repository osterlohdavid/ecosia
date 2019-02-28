
view: revenue_report_product_ad {
  derived_table: {

    sql:
      SELECT
        row_number() OVER(ORDER BY date,hour,adunitid,devicetype) AS prim_key,
        *
      FROM pubcenter.at_productad ;;
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
    description: "Timeframe when the revenue was generated"
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



  dimension: device_type {
    type: string
    sql: case when ${TABLE}.devicetype ='HiFi Phone' then 'Mobile' when ${TABLE}.devicetype= 'PC' then 'Desktop'
      ELSE ${TABLE}.devicetype END;;
    drill_fields: [detail*]
  }
  dimension: language {
    type: string
    sql: ${TABLE}.language ;;
    drill_fields: [detail*]
  }

  dimension:market {
    type: string
    description: "Bing market allocated to the user"
    map_layer_name: countries
    sql: ${TABLE}.market;;
    drill_fields: [detail*]
  }

  dimension:country {
    type: string
    description: "User's location country"
    map_layer_name: countries
    sql:  ${TABLE}.usercountry;;
    drill_fields: [detail*]
  }
  dimension: estimatedrevenue {
    type: number
    hidden:  yes
    sql: ${TABLE}.estimatedrevenue ;;
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

  measure: gross_revenue{
    description: "Gross revenue in EUR"
    type: sum
    sql:  ${estimatedrevenue};;
    }

  measure: clicks {
    type: sum
    sql: ${clicks_raw};;
    }
  measure: impressions {
    type: sum
    sql: ${impressions_raw} ;;
    }

  measure: net_revenue {
    description: "Net revenue in EUR (after paying MSFT loyalties, cost to serve and other additional fees)"
    type: sum
      ###FORMULA: (Gross revenue *98,78% (aka Revenue Adjustment) * 95% (aka Fees for Credit card and such)
      # )
      #  * 88% (12% deduction from MSFT as Royalties)
    sql:( ${TABLE}.estimatedrevenue*0.9878*0.95)*0.88 ;;
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

  set: detail {
    fields: [
        adunitname,
        adunitid,
        country,
        device_type,
        revenue_week,
        revenue_year,
        revenue_month,
        language,
        market
      ]
    }
}
