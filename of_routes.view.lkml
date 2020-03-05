view: of_routes {
  sql_table_name: PUBLIC.OF_ROUTES ;;

  dimension: airline {
    type: string
    sql: ${TABLE}."AIRLINE" ;;
  }

  dimension: airline_id {
    type: string
    sql: ${TABLE}."AIRLINE_ID" ;;
  }

  dimension: codeshare {
    type: string
    sql: ${TABLE}."CODESHARE" ;;
  }

  dimension: destination_airport {
    type: string
    sql: ${TABLE}."DESTINATION_AIRPORT" ;;
  }

  dimension: destination_airport_id {
    type: string
    sql: ${TABLE}."DESTINATION_AIRPORT_ID" ;;
  }

  dimension: equipment {
    type: string
    sql: ${TABLE}."EQUIPMENT" ;;
  }

  dimension: source_airport {
    type: string
    sql: ${TABLE}."SOURCE_AIRPORT" ;;
  }

  dimension: source_airport_id {
    type: string
    sql: ${TABLE}."SOURCE_AIRPORT_ID" ;;
  }

  dimension: stops {
    type: string
    sql: ${TABLE}."STOPS" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
