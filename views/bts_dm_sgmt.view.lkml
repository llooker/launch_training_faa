view: bts_dm_sgmt {
  sql_table_name: PUBLIC.BTS_DM_SGMT ;;

  dimension: finkey {
    hidden: yes
    description: "key to match to bts_fin_b_q"
    type: string
    sql:  ${unique_carrier} || ${year} || ${quarter} ;;
  }

  dimension: air_time {
    type: string
    sql: ${TABLE}."AIR_TIME" ;;
  }

  dimension: index {
    primary_key: yes
    type: number
    sql: ${TABLE}."NUM_ID" ;;
  }

  dimension: aircraft_config {
    type: string
    sql: ${TABLE}."AIRCRAFT_CONFIG" ;;
  }

  dimension: aircraft_group {
    type: string
    sql: ${TABLE}."AIRCRAFT_GROUP" ;;
  }

  dimension: aircraft_type {
    type: string
    sql: ${TABLE}."AIRCRAFT_TYPE" ;;
  }

  dimension: airline_id {
    type: string
    sql: ${TABLE}."AIRLINE_ID" ;;
  }


  dimension: carrier {
    type: string
    sql: ${TABLE}."CARRIER" ;;
  }

  dimension: carrier_group {
    type: string
    sql: ${TABLE}."CARRIER_GROUP" ;;
  }

  dimension: carrier_group_new {
    type: string
    sql: ${TABLE}."CARRIER_GROUP_NEW" ;;
  }

  dimension: carrier_name {
    type: string
    sql: ${TABLE}."CARRIER_NAME" ;;
  }

  dimension: class {
    type: string
    sql: ${TABLE}."CLASS" ;;
  }

  dimension: departures_performed {
    type: number
    sql: ${TABLE}."DEPARTURES_PERFORMED" ;;
  }

  dimension: departures_scheduled {
    description: "Not all departures are scheduled"
    type: number
    sql: ${TABLE}."DEPARTURES_SCHEDULED" ;;
  }

  dimension: departure_diff {
    type: number
    sql: ${departures_performed} - ${departures_scheduled} ;;
  }



  dimension: dest {
    type: string
    sql: ${TABLE}."DEST" ;;
  }

  dimension: dest_airport_id {
    type: string
    sql: ${TABLE}."DEST_AIRPORT_ID" ;;
  }

  dimension: dest_airport_seq_id {
    type: string
    sql: ${TABLE}."DEST_AIRPORT_SEQ_ID" ;;
  }

  dimension: dest_city_market_id {
    type: string
    sql: ${TABLE}."DEST_CITY_MARKET_ID" ;;
  }

  dimension: dest_city_name {
    type: string
    sql: ${TABLE}."DEST_CITY_NAME" ;;
  }

  dimension: dest_state_abr {
    type: string
    sql: ${TABLE}."DEST_STATE_ABR" ;;
  }

  dimension: dest_state_fips {
    type: string
    sql: ${TABLE}."DEST_STATE_FIPS" ;;
  }

  dimension: dest_state_nm {
    type: string
    sql: ${TABLE}."DEST_STATE_NM" ;;
  }

  dimension: dest_wac {
    type: string
    sql: ${TABLE}."DEST_WAC" ;;
  }

  dimension: distance {
    type: string
    sql: ${TABLE}."DISTANCE" ;;
  }

  dimension: distance_group {
    type: string
    sql: ${TABLE}."DISTANCE_GROUP" ;;
  }

  dimension: freight {
    type: string
    sql: ${TABLE}."FREIGHT" ;;
  }

  dimension: mail {
    type: string
    sql: ${TABLE}."MAIL" ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}."MONTH" ;;
  }

  dimension: origin {
    type: string
    sql: ${TABLE}."ORIGIN" ;;
  }

  dimension: origin_airport_id {
    type: string
    sql: ${TABLE}."ORIGIN_AIRPORT_ID" ;;
  }

  dimension: origin_airport_seq_id {
    type: string
    sql: ${TABLE}."ORIGIN_AIRPORT_SEQ_ID" ;;
  }

  dimension: origin_city_market_id {
    type: string
    sql: ${TABLE}."ORIGIN_CITY_MARKET_ID" ;;
  }

  dimension: origin_city_name {
    type: string
    sql: ${TABLE}."ORIGIN_CITY_NAME" ;;
  }

  dimension: origin_state_abr {
    type: string
    sql: ${TABLE}."ORIGIN_STATE_ABR" ;;
  }

  dimension: origin_state_fips {
    type: string
    sql: ${TABLE}."ORIGIN_STATE_FIPS" ;;
  }

  dimension: origin_state_nm {
    type: string
    sql: ${TABLE}."ORIGIN_STATE_NM" ;;
  }

  dimension: origin_wac {
    type: string
    sql: ${TABLE}."ORIGIN_WAC" ;;
  }

  dimension: passengers {
    type: string
    sql: ${TABLE}."PASSENGERS" ;;
  }

  dimension: payload {
    type: string
    sql: ${TABLE}."PAYLOAD" ;;
  }

  dimension: quarter {
    type: string
    sql: ${TABLE}."QUARTER" ;;
  }

  dimension: ramp_to_ramp {
    type: string
    sql: ${TABLE}."RAMP_TO_RAMP" ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}."REGION" ;;
  }

  dimension: seats {
    type: string
    sql: ${TABLE}."SEATS" ;;
  }

  dimension: unique_carrier {
    type: string
    sql: ${TABLE}."UNIQUE_CARRIER" ;;
  }

  dimension: unique_carrier_entity {
    type: string
    sql: ${TABLE}."UNIQUE_CARRIER_ENTITY" ;;
  }

  dimension: unique_carrier_name {
    type: string
    sql: ${TABLE}."UNIQUE_CARRIER_NAME" ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}."YEAR" ;;
  }

  dimension: year_month {
    type: string
    sql: ${year} || ' ' || ${str_month}
      ;;
  }
  dimension: str_month {
    hidden: no
    type: string
    sql:case
          when ${month} = 1  then '01'
          when ${month} = 2 then '02'
          when ${month} = 3 then '03'
          when ${month} = 4  then '04'
          when ${month} = 5  then '05'
          when ${month} = 6 then '06'
          when ${month} = 7 then '07'
          when ${month} = 8 then '08'
          when ${month} = 9 then '09'
          when ${month} = 10 then '10'
          when ${month} = 11 then '11'
          when ${month} = 12 then '12'
        end;;
  }

  measure: count {
    type: count
    drill_fields: [unique_carrier_name, carrier_name, origin_city_name, dest_city_name]
  }

  ###   MEASURES    ###

  measure: sum_seats {
    label: "Seats"
    type: sum
    sql: ${seats} ;;
  }
  measure: sum_payload {
    type: sum
    description: "Pounds"
    label: "Payload"
    sql: ${payload} ;;
  }

  measure: sum_depatures {
    type: sum
    label: "Departures"
    sql: ${departures_performed} ;;
  }

  measure: sum_schd_departure {
    type: sum
    label: "Scheduled Departures"
    sql: ${departures_scheduled} ;;
  }
  measure: sum_diff_dep {
    type: sum
    label: "Departure and Scheduled Departure Differnece"
    sql: ${departure_diff} ;;
  }


}
