view: org_ecosia_ecfg_context_1 {
  view_label: "ECFG cookie context"
  sql_table_name: atomic.org_ecosia_ecfg_context_1 ;;


  dimension: addon {
    type: yesno
    sql: ${TABLE}.addon ;;
  }

  dimension: adult {
    type: string
    sql: ${TABLE}.adult ;;
  }

  dimension: autosuggest {
    type: number
    sql: ${TABLE}.autosuggest ;;
  }

  dimension: cid {
    type: string
    sql: ${TABLE}.cid ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: custom {
    type: number
    sql: ${TABLE}.custom ;;
  }

  dimension: devicetype {
    type: string
    sql: ${TABLE}.devicetype ;;
  }

  dimension: ecfgcookie {
    type: string
    sql: ${TABLE}.ecfgcookie ;;
  }

  dimension: firstrun {
    type: number
    sql: ${TABLE}.firstrun ;;
  }

  dimension: firstsearch {
    type: number
    sql: ${TABLE}.firstsearch ;;
  }

  dimension: language {
    type: string
    sql: LOWER(${TABLE}.language) ;;
  }

  dimension: lasttree {
    type: number
    sql: ${TABLE}.lasttree ;;
  }

  dimension: market {
    type: string
    sql: ${TABLE}.market ;;
  }

  dimension: newtab {
    type: number
    sql: ${TABLE}.newtab ;;
  }

  dimension: notification {
    type: number
    sql: ${TABLE}.notification ;;
  }

  dimension: personal {
    type: number
    sql: ${TABLE}.personal ;;
  }

  dimension: ref_parent {
    type: string
    sql: ${TABLE}.ref_parent ;;
  }

  dimension: ref_root {
    type: string
    sql: ${TABLE}.ref_root ;;
  }

  dimension: ref_tree {
    type: string
    sql: ${TABLE}.ref_tree ;;
  }

  dimension: root_id {
    type: string
    sql: ${TABLE}.root_id ;;
  }

  dimension_group: root_tstamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.root_tstamp ;;
  }

  dimension: schema_format {
    type: string
    sql: ${TABLE}.schema_format ;;
  }

  dimension: schema_name {
    type: string
    hidden: yes
    sql: ${TABLE}.schema_name ;;
  }

  dimension: schema_vendor {
    type: string
    hidden: yes
    sql: ${TABLE}.schema_vendor ;;
  }

  dimension: schema_version {
    type: string
    hidden: yes
    sql: ${TABLE}.schema_version ;;
  }

  dimension: trees {
    type: number
    sql: ${TABLE}.trees ;;
  }

  dimension: typetag {
    type: string
    sql: ${TABLE}.typetag ;;
  }

  measure: count {
    type: count
    drill_fields: [schema_name]
  }
}
