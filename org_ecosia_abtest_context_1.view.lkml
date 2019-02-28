view: org_ecosia_abtest_context_1 {
  sql_table_name: atomic.org_ecosia_abtest_context_1 ;;

  dimension: ab_tests {
    type: string
    hidden: yes
    label: "Which A/B Test"
    description: "Choose the A/B test for your test"
    sql: ${TABLE}.ab_tests ;;
  }

parameter: input{
type: unquoted
allowed_value: {label:"One"
  value: "1"}
allowed_value: {label:"Two"
  value:"2"}

}

  dimension: test_name_1 {
    type: string
    label: "Which A/B test"
    description: "Choose the A/B test for your test"
    sql: {% if input._parameter_value == '1' %} json_extract_path_text(JSON_EXTRACT_ARRAY_ELEMENT_TEXT(${ab_tests}, 0), 'test')
    {% elsif input._parameter_value=='2' %} json_extract_path_text(JSON_EXTRACT_ARRAY_ELEMENT_TEXT(${ab_tests}, 1), 'test')
    {% else %}
    json_extract_path_text(JSON_EXTRACT_ARRAY_ELEMENT_TEXT(${ab_tests}, 18), 'value')
    {% endif %}
    ;;
  }
  dimension: ab_2018_stg_value{
    type: string
    label: "Which A/B test group"
    description: "A/B test groups"
    sql: json_extract_path_text(JSON_EXTRACT_ARRAY_ELEMENT_TEXT(${ab_tests}, 0), 'value');;
  }

  dimension: test_name_2 {
    type: string
    label: "Which A/B test"
    description: "Choose the A/B test for your test"
    sql: json_extract_path_text(JSON_EXTRACT_ARRAY_ELEMENT_TEXT(${ab_tests}, 1), 'test');;
  }
  dimension: test_value_2 {
    type: string
    label: "Which A/B test group"
    description: "Choose the A/B test for your test"
    sql: json_extract_path_text(JSON_EXTRACT_ARRAY_ELEMENT_TEXT(${ab_tests}, 1), 'value');;
  }
  dimension: test_name_3 {
    type: string
    label: "Which A/B test"
    description: "Choose the A/B test for your test"
    sql: json_extract_path_text(JSON_EXTRACT_ARRAY_ELEMENT_TEXT(${ab_tests}, 2), 'test');;
  }
  dimension: test_value_3 {
    type: string
    label: "Which A/B test group"
    description: "Choose the A/B test for your test"
    sql: json_extract_path_text(JSON_EXTRACT_ARRAY_ELEMENT_TEXT(${ab_tests}, 2), 'value');;
  }

  dimension: ref_parent {
    type: string
    hidden: yes
    sql: ${TABLE}.ref_parent ;;
  }

  dimension: ref_root {
    type: string
    hidden:  yes
    sql: ${TABLE}.ref_root ;;
  }

  dimension: ref_tree {
    type: string
    hidden: yes
    sql: ${TABLE}.ref_tree ;;
  }

  dimension: root_id {
    type: string
    primary_key:  yes
    hidden: yes
    sql: ${TABLE}.root_id ;;
  }

  dimension_group: root_tstamp {
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
    sql: ${TABLE}.root_tstamp ;;
  }

  dimension: schema_format {
    type: string
    hidden: yes
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

  measure: count {
    type: count
    drill_fields: [schema_name]
  }
}
