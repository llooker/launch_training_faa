view: bts_dm_mrkt {
  sql_table_name: PUBLIC.BTS_DM_MRKT ;;

  dimension: finkey {
    type: string
    sql: ${unique_carrier} || ${year} || ${quarter}  ;;
  }

  dimension: airline_id {
    type: string
    sql: ${TABLE}."AIRLINE_ID" ;;
  }
  dimension: index {
    primary_key: yes
    type: number
    sql: ${TABLE}."NUM_ID" ;;
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
    group_label: "Cargo"
    type: string
    sql: ${TABLE}."FREIGHT" ;;
  }

  dimension: mail {
    group_label: "Cargo"
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
    group_label: "Cargo"
    type: string
    sql: ${TABLE}."PASSENGERS" ;;
  }

  dimension: quarter {
    type: string
    sql: ${TABLE}."QUARTER" ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}."REGION" ;;
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



###   MEASURES    ###
  measure: sum_passenger {
    label: "Total Passengers"
    type: sum
    sql: ${passengers} ;;
  }
  measure: sum_freight {
    label: "Total Freight"
    description: "Pounds"
    type: sum
    sql: ${freight} ;;
  }
  measure: sum_mail {
    label: "Total Mail"
    description: "Pounds"
    type: sum
    sql: ${mail} ;;
  }

  measure: count {
    type: count
    drill_fields: [unique_carrier_name, carrier_name, origin_city_name, dest_city_name]
  }
}
