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

explore: events {
  join: org_ecosia_ecfg_context_1 {
    view_label: "ECFG"
    type: left_outer
    relationship: one_to_one
    sql_on: ${events.event_id} = ${org_ecosia_ecfg_context_1.root_id} ;;
  }
}
