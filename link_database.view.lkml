view: link_database {
  sql_table_name: mkt.link_database ;;

  dimension: campaign_type {
    type: string
    sql: ${TABLE}."campaign type" ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: countrycode {
    label: "Country Code"
    type: string
    sql: ${TABLE}."country/code" ;;
  }

  dimension: final_url {
    label: "Final URL (Typetag)"
    type: string
    sql: ${TABLE}."final url" ;;
  }

  dimension: final_url__analytics {
    label: "Final URL (Short.cm)"
    type: string
    sql: ${TABLE}."final url + analytics" ;;
  }
##same as 'Typetag'
  dimension: gid {
    hidden: yes
    type: string
    sql: ${TABLE}.gid ;;
  }
###QUESTION: what is this? (NM)
  dimension: index {
    type: number
    sql: ${TABLE}.index ;;
  }

  dimension: landing_page {
    type: string
    sql: ${TABLE}."landing page" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: os {
    type: string
    sql: ${TABLE}.os ;;
  }

  dimension: payment_model {
    type: string
    sql: ${TABLE}."payment model" ;;
  }

  dimension: person {
    type: string
    sql: ${TABLE}.person ;;
  }

  dimension: typetag {
    type: string
    sql: ${TABLE}.typetag ;;
  }

  dimension: utm_campaign {
    type: string
    sql: ${TABLE}."utm campaign" ;;
  }

  dimension: utm_medium {
    type: string
    sql: ${TABLE}."utm medium" ;;
  }

  dimension: utm_source {
    type: string
    sql: ${TABLE}."utm source" ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
