view: user_touch_facts {
  derived_table: {
    datagroup_trigger: daily
    sql: SELECT
        touches.domain_userid  AS "domain_userid",
        MIN(touches.collector_tstamp) AS "first_touch"
      FROM mkt.touches  AS touches

      GROUP BY 1
       ;;
  }

  dimension: domain_userid {
    type: string
    sql: ${TABLE}.domain_userid ;;
    primary_key: yes
    hidden: yes
  }

  dimension_group: first_user_touch {
    type: time
    hidden: yes
    timeframes: [
      raw,
      date,
      week,
      month,
      year
    ]
    sql: ${TABLE}.first_touch ;;
  }
}
