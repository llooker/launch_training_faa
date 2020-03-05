view: of_arln {
  sql_table_name: PUBLIC.OF_ARLN ;;

  dimension: active {
    type: string
    sql: ${TABLE}."ACTIVE" ;;
  }

  dimension: airline_id {
    type: string
    primary_key: yes
    sql: ${TABLE}."AIRLINE_ID" ;;
  }

  dimension: alias {
    type: string
    sql: ${TABLE}."ALIAS" ;;
  }

  dimension: callsign {
    type: string
    sql: ${TABLE}."CALLSIGN" ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}."COUNTRY" ;;
  }

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
