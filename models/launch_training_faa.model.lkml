connection: "faa_demo_warren"

# include all the views
include: "/views/*.view"

datagroup: poc_flights_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: poc_flights_default_datagroup

explore: bts_delays {
  label: "Delays"
  persist_for: "15 minutes"
  join: origin {

    from: of_arprt
    sql_on: ${bts_delays.origin} = ${origin.iata};;
    relationship: many_to_one
    type: left_outer
    fields: [origin.GEO_LOC]
  }
  join: destination {
    from: of_arprt
    sql_on: ${bts_delays.dest} = ${destination.iata} ;;
    relationship: many_to_one
    type: left_outer
    fields: [destination.GEO_LOC]
  }


}

explore: bts_dm_mrkt {
  hidden: yes
}

explore: bts_dm_sgmt {
  hidden: yes
}



explore: of_arln {
  hidden: yes

}

explore: of_arprt {
  hidden: yes
}

explore: of_planes {
  hidden: yes
}

explore: of_routes {
  hidden: yes
}
