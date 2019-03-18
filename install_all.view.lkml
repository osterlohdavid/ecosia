view: install_all {
  sql_table_name: install."all" ;;

## How do we make this field more end user friendly? Let's build a look from it together.
  dimension: addon {
    description: "Does the user have the Ecosia browser extension?"
    type: number
    sql: ${TABLE}.addon ;;
  }

  dimension: br_family {
    group_label: "Browser"
    label: "Browser Family"
    type: string
    sql: ${TABLE}.br_family ;;
  }

  dimension: br_lang {
    group_label: "Browser"
    label: "Browser Language"
    type: string
    sql: ${TABLE}.br_lang ;;
  }

  dimension: br_name {
    type: string
    group_label: "Browser"
    label: "Browser Name"
    sql: ${TABLE}.br_name ;;
  }

  dimension: br_version {
    type: string
    group_label: "Browser"
    label: "Browser Version"
    sql: ${TABLE}.br_version ;;
  }
## This one comes from Bing's data, the other one comes from the browser
  dimension: country {
    label: "Bing Country Allocation"
    description: "This comes from Bing's data"
    type: string
    map_layer_name: countries
    sql: UPPER(${TABLE}.country) ;;
  }

  dimension: devicetype {
    type: string
    group_label: "Device Details"
    label: "Device Type"
    sql: ${TABLE}.devicetype ;;
  }

  dimension: domain_userid {
    type: string
    hidden: yes
    sql: ${TABLE}.domain_userid ;;
  }

  dimension: dvce_ismobile {
    group_label: "Device Details"
    label: "Is it mobile?"
    type: yesno
    sql: ${TABLE}.dvce_ismobile ;;
  }
##superfluous, one above is enough
  dimension: dvce_type {
    hidden: yes
    type: string
    sql: ${TABLE}.dvce_type ;;
  }

  dimension: event_id {
    type: string
    hidden: yes
    sql: ${TABLE}.event_id ;;
  }

  dimension: firstsearch {
    label: "Has the user searched before?"
    type: yesno
    sql: ${TABLE}.firstsearch<1 ;;
  }

  dimension: geo_city {
    group_label: "Location"
    label: "City"
    type: string
    sql: ${TABLE}.geo_city ;;
  }

  dimension: geo_country {
    group_label: "Location"
    label: "Country"
    description: "Data comes from the browser, so it's where the user is right now"
    type: string
    sql: ${TABLE}.geo_country ;;
  }

  dimension: geo_region {
    group_label: "Location"
    label: "Region"
    type: string
    sql: ${TABLE}.geo_region ;;
  }

  dimension_group: install_timestamp {
    type: time
    label: "Install"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.install_timestamp ;;
  }

  dimension: language {
    type: string
    sql: ${TABLE}.language ;;
  }

##Not updated after the install. Unix Timestamp.
  dimension: lasttree {
    hidden: yes
    description: "The last time the tree counter went up, at the point of install."
    type: number
    sql: ${TABLE}.lasttree ;;
  }

  dimension: os_family {
    group_label: "Device Details"
    type: string
    sql: ${TABLE}.os_family ;;
  }


  dimension: personal {
    hidden: yes
    type: number
    sql: ${TABLE}.personal ;;
  }

  dimension: plt_name {
    hidden: yes
    type: string
    sql: ${TABLE}.plt_name ;;
  }

  dimension: plt_v {
    hidden: yes
    type: string
    sql: ${TABLE}.plt_v ;;
  }

  dimension: trees {
    description: "The value of the user's Tree Count"
    hidden: yes
    type: number
    sql: ${TABLE}.trees ;;
  }

dimension: tree_counter{
  description: "The value of the user's Tree Count"
  type: string
  sql:CASE
WHEN install_all.trees  < 1 THEN '0'
WHEN install_all.trees  >= 1 AND install_all.trees  < 10 THEN '1 to 9'
WHEN install_all.trees  >= 10 AND install_all.trees  < 30 THEN '10 to 29'
WHEN install_all.trees  >= 30 AND install_all.trees  < 100 THEN '30 to 99'
WHEN install_all.trees  >= 100 AND install_all.trees  < 500 THEN '100 to 499'
WHEN install_all.trees  >= 500 THEN '500 or Above'
ELSE 'Undefined'
END;;
}


  dimension: typetag {
    type: string
    sql: ${TABLE}.typetag ;;
  }

## Need to add more measures
  measure: count {
    type: count
    drill_fields: [plt_name, br_name]
  }

}
