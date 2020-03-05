view: of_planes {
  sql_table_name: PUBLIC.OF_PLANES ;;

  dimension: iata {
    type: string
    sql: ${TABLE}."IATA" ;;
  }

  dimension: icao {
    type: string
    sql: ${TABLE}."ICAO" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
