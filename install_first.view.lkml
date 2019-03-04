view: install_first {
  sql_table_name: install.first ;;

  dimension: domain_userid {
    type: string
    sql: ${TABLE}.domain_userid ;;
  }

  dimension_group: first_install_tp {
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
    sql: ${TABLE}.first_install_tp ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
