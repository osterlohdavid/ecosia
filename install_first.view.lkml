view: install_first {
  sql_table_name: install.first ;;

  dimension: domain_userid {
    type: string
    hidden: yes
    sql: ${TABLE}.domain_userid ;;
  }

  dimension_group: first_install {
    type: time
    hidden: yes
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
