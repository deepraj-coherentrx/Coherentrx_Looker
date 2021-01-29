connection: "db-som-changeinvestigator"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
   # include a LookML dashboard called my_dashboard

explore: som_invastigator_change {label: "Admin Investigator to assign Patients"
  view_name: vw_som_change_investigator_looker


  #access_filter: {
    #field: vw_som_change_investigator_looker.admininvemail
    #user_attribute: "email"
  #}
}


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
