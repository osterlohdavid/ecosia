connection: "hot_cluster"

include: "*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }

explore: revenue_report_per_country {
  view_label: "Bing Ad Report (per Adunit)"
  description: "This Explore is derived from MSFT revenue data"
  }


explore: events {
  join: org_ecosia_ecfg_context_1 {
    view_label: "ECFG User cookie data"
    type: left_outer
    relationship: one_to_one
    sql_on: ${events.event_id} = ${org_ecosia_ecfg_context_1.root_id} ;;
  }
  join: org_ecosia_abtest_context_1 {
    view_label: "AB Test"
    type: left_outer
    relationship: one_to_one
    sql_on: ${events.event_id} = ${org_ecosia_abtest_context_1.root_id} ;;
  }
  join: org_ecosia_ad_context_2 {
    view_label: "Ad Shown Details"
    type: left_outer
    relationship: one_to_one
    sql_on: ${events.event_id} = ${org_ecosia_ad_context_2.root_id} ;;
  }
  join: org_ecosia_advert_click_event_1 {
    view_label: "Ad Click Details"
    type: left_outer
    relationship: one_to_one
    sql_on: ${events.event_id} = ${org_ecosia_advert_click_event_1.root_id} ;;
  }
  join: org_ecosia_android_install_event_1 {
    view_label: "Android Installs"
    type: left_outer
    relationship: one_to_one
    sql_on: ${events.event_id} = ${org_ecosia_android_install_event_1.root_id} ;;
  }
  join: org_ecosia_install_event_1 {
    view_label: "All Installs"
    type: left_outer
    relationship: one_to_one
    sql_on: ${events.event_id} = ${org_ecosia_install_event_1.root_id} ;;
  }
  join: org_ecosia_ios_install_event_1 {
    view_label: "iOS Installs"
    type: left_outer
    relationship: one_to_one
    sql_on: ${events.event_id} = ${org_ecosia_ios_install_event_1.root_id} ;;
  }
  join: org_ecosia_knowledge_context_1 {
    view_label: "Entity Information Received"
    type: left_outer
    relationship: one_to_one
    sql_on: ${events.event_id} = ${org_ecosia_install_event_1.root_id} ;;
  }
  join: org_ecosia_search_event_1 {
    view_label: "Search Event Details"
    type: left_outer
    relationship: one_to_one
    sql_on: ${events.event_id} = ${org_ecosia_search_event_1.root_id} ;;
  }
  join: org_ecosia_slottings_context_1 {
    view_label: "Slotting Signals"
    type: left_outer
    relationship: one_to_one
    sql_on: ${events.event_id} = ${org_ecosia_slottings_context_1.root_id} ;;
  }
}

explore: search_events{
  view_name: org_ecosia_search_event_1
  join: org_ecosia_ecfg_context_1 {
    view_label: "ECFG"
    type: left_outer
    relationship: one_to_one
    sql_on: ${org_ecosia_search_event_1.root_id} = ${org_ecosia_ecfg_context_1.root_id} ;;
  }
  join: org_ecosia_ad_context_2 {
    view_label: "Ad Shown Details"
    type: left_outer
    relationship: one_to_one
    sql_on: ${org_ecosia_search_event_1.root_id} = ${org_ecosia_ad_context_2.root_id} ;;
  }
  join: org_ecosia_knowledge_context_1 {
    view_label: "Entity Information Received"
    type: left_outer
    relationship: one_to_one
    sql_on: ${org_ecosia_search_event_1.root_id} = ${org_ecosia_knowledge_context_1.root_id} ;;
  }
  join: org_ecosia_slottings_context_1 {
    view_label: "Slotting Signals"
    type: left_outer
    relationship: one_to_one
    sql_on: ${org_ecosia_search_event_1.root_id} = ${org_ecosia_slottings_context_1.root_id} ;;
  }
  join: org_ecosia_weather_context_1 {
    view_label: "Weather Widget info"
    type: left_outer
    relationship: one_to_one
    sql_on: ${org_ecosia_search_event_1.root_id} = ${org_ecosia_weather_context_1.root_id} ;;
  }
  join: events {
    view_label: "Events Info"
    type: left_outer
    relationship: one_to_one
    sql_on: ${org_ecosia_search_event_1.root_id} = ${events.event_id} ;;
  }
}
