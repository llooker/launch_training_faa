view: of_arprt {
  sql_table_name: PUBLIC.OF_ARPRT ;;

  dimension: Airport_ID {
    type: string
    primary_key: yes
    sql: ${TABLE}."AIRLINE_ID" ;;
  }

  dimension: altitude {
    type: number
    sql: ${TABLE}."ALTITUDE" ;;
  }

  measure: avg_altitude {
    type: average
    sql: ${altitude} ;;
    drill_fields: [Airport_ID, name, country]
  }

  dimension: city {
    type: string
    sql: ${TABLE}."CITY" ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}."COUNTRY" ;;
  }

  dimension: dst {
    type: string
    sql: ${TABLE}."DST" ;;
  }

  dimension: iata {
    type: string
    sql: ${TABLE}."IATA" ;;
  }

  dimension: icao {
    type: string
    sql: ${TABLE}."ICAO" ;;
  }

  dimension: latitude {
    type: number
    group_label: "COORDINATES"
    sql: ${TABLE}."LATITUDE" ;;
  }

  dimension: longitude {
    type: number
    group_label: "COORDINATES"
    sql: ${TABLE}."LONGITUDE" ;;
  }

  dimension: GEO_LOC {
    label: "GEOGRAPHIC LOCATION"
    group_label: "LOCATION"
    type: location
    sql_longitude: ${longitude} ;;
    sql_latitude: ${latitude} ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}."SOURCE" ;;
  }

  dimension: timezone {
    type: number
    sql: ${TABLE}."TIMEZONE" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."TYPE" ;;
  }

  dimension: tz_database {
    type: string
    sql: ${TABLE}."TZ_DATABASE" ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
