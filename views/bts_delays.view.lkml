view: bts_delays {
  view_label: "Flight Info"
  sql_table_name: PUBLIC.BTS_DELAYS ;;
  drill_fields: [reporting_airline, crsarrstring, crsdepstring, arrdelay, depdelay, origin.name, destination.name]


  dimension: finkey {
    hidden: yes
    type: string
    sql: ${reporting_airline} ||  ${year} || ${quarter};;
  }
  dimension: index {
    type: number
    hidden: yes
    primary_key: yes
    sql: ${TABLE}."NUM_ID" ;;
  }
  dimension: actualelapsedstring {
    type: string
    sql: ${TABLE}."ACTUALELAPSEDSTRING" ;;
  }

  dimension: airstring {
    type: string
    sql: ${TABLE}."AIRSTRING" ;;
  }

###   Arival INFO   ###


  dimension: arrdel15 {
    group_label: "Arival Info"
    type: string
    sql: ${TABLE}."ARRDEL15" ;;
  }

  dimension: arrdelay {
    group_label: "Delay Info"
    type: string
    sql: ${TABLE}."ARRDELAY" ;;
  }

  dimension: arrdelayminutes {
    group_label: "Delay Info"
    type: number
    sql: ${TABLE}."ARRDELAYMINUTES" ;;
  }

  dimension: arrivaldelaygroups {
    group_label: "Delay Info"
    type: string
    sql: ${TABLE}."ARRIVALDELAYGROUPS" ;;
  }

  dimension: arrstring {
    group_label: "Arival Info"
    type: string
    sql: ${TABLE}."ARRSTRING" ;;
  }

  dimension: arrstringblk {
    group_label: "Arival Info"
    type: string
    description: "Hourly block of Arrival time"
    sql: ${TABLE}."ARRSTRINGBLK" ;;
  }

###   Cancelation information

  dimension: cancellationcode {
    group_label: "Cancelation Info"
    label: "Cancelation"
    type: string
    sql: ${TABLE}."CANCELLATIONCODE" ;;
  }

  dimension: cancelled {
    group_label: "Cancelation Info"
    type: number
    sql: ${TABLE}."CANCELLED" ;;
  }


  dimension: carrierdelay {
    group_label: "Delay Info"
    type: number
    sql: ${TABLE}."CARRIERDELAY" ;;
  }

  dimension: crsarrstring {
    label: "Arrival Time"
    group_label: "Arival Info"
    type: string
    sql: ${TABLE}."CRSARRSTRING" ;;
  }

  dimension: crsdepstring {
    label: "Departure Time"
    group_label: "Departure Info"
    type: string
    sql: ${TABLE}."CRSDEPSTRING" ;;
  }

  dimension: crselapsedstring {
    type: string
    sql: ${TABLE}."CRSELAPSEDSTRING" ;;
  }

  dimension: dayofmonth {
    hidden: yes
    type: string
    sql: ${TABLE}."DAYOFMONTH" ;;
  }

  dimension: dayofweek {
    hidden: yes
    type: string
    sql: ${TABLE}."DAYOFWEEK" ;;
  }

  ###   Departure Delay Info    ###

  dimension: departuredelaygroups {
    group_label: "Delay Info"
    type: string
    sql: ${TABLE}."DEPARTUREDELAYGROUPS" ;;
  }

  dimension: depdel15 {
    group_label: "Delay Info"
    hidden: yes
    type: string
    sql: ${TABLE}."DEPDEL15" ;;
  }

  dimension: is_flight_delayed_departure {
    description: "Is the flight delayed by more than 15 minutes on departure"
    group_label: "Delay Info"
    type: yesno
    sql:  ${depdel15} = '1.0' ;;
  }

  measure: count_of_delayed_departure_flights {
    description: "count of flights delayed by more than 15 minutes on departure"
    type: count
    filters: {
      field: is_flight_delayed_departure
      value: "yes"
    }
  }

  measure: percentage_flights_delayed_on_departure {
    description: "Percent of flights delayed by more than 15 minutes on departure"
    type: number
    sql: ${count_of_delayed_departure_flights}/nullif(${count},0) ;;
    value_format_name: percent_1
  }

  dimension: depdelay {
    group_label: "Delay Info"
    type: string
    sql: ${TABLE}."DEPDELAY" ;;
  }

  dimension: depdelayminutes {
    group_label: "Delay Info"
    type: string
    sql: ${TABLE}."DEPDELAYMINUTES" ;;
  }

  dimension: depstring {
    group_label: "Departure Delay Info"
    type: string
    sql: ${TABLE}."DEPSTRING" ;;
  }

  dimension: depstringblk {
    group_label: "Departure Delay Info"
    type: string
    description: "Hourly block of departure time"
    sql: ${TABLE}."DEPSTRINGBLK" ;;
  }

  ###   Destination info ###

  dimension: dest {
    group_label: "Destination"
    type: string
    sql: ${TABLE}."DEST" ;;
  }

  dimension: destairportid {
    group_label: "Destination"
    type: string
    sql: ${TABLE}."DESTAIRPORTID" ;;
  }

  dimension: destairportseqid {
    group_label: "Destination"
    type: string
    sql: ${TABLE}."DESTAIRPORTSEQID" ;;
  }

  dimension: destcitymarketid {
    group_label: "Destination"
    type: string
    sql: ${TABLE}."DESTCITYMARKETID" ;;
  }

  dimension: destcityname {
    group_label: "Destination"
    type: string
    sql: ${TABLE}."DESTCITYNAME" ;;
  }

  dimension: deststate {
    group_label: "Destination"
    map_layer_name: us_states
    type: string
    sql: ${TABLE}."DESTSTATE" ;;
  }

  dimension: deststatefips {
    group_label: "Destination"
    type: string
    sql: ${TABLE}."DESTSTATEFIPS" ;;
  }

  dimension: deststatename {
    group_label: "Destination"
    map_layer_name: us_states
    type: string
    sql: ${TABLE}."DESTSTATENAME" ;;
  }

  dimension: destwac {
    group_label: "Destination"
    type: string
    sql: ${TABLE}."DESTWAC" ;;
  }

  dimension: geoloc {
    label: "Geo-Location"
    group_label: "Destination"
    type: location
    sql_latitude: ${destination.latitude} ;;
    sql_longitude: ${destination.longitude} ;;
  }


  ### Distance Info ###

  dimension: distance {
    type: number
    sql: ${TABLE}."DISTANCE"::DECIMAL ;;
  }

  dimension: distancegroup {
    type: string
    sql: ${TABLE}."DISTANCEGROUP" ;;
  }

  ###   Divergence Info   ###

  dimension: div1_airport {
    group_label: "Diverted"
    type: string
    sql: ${TABLE}."DIV1AIRPORT" ;;
  }

  dimension: div1_airportid {
    group_label: "Diverted"
    type: string
    sql: ${TABLE}."DIV1AIRPORTID" ;;
  }

  dimension: div1_airportseqid {
    group_label: "Diverted"
    type: string
    sql: ${TABLE}."DIV1AIRPORTSEQID" ;;
  }

  dimension: div1_longestgstring {
    group_label: "Diverted"
    type: string
    sql: ${TABLE}."DIV1LONGESTGSTRING" ;;
  }

  dimension: div1_tailnum {
    group_label: "Diverted"
    type: string
    sql: ${TABLE}."DIV1TAILNUM" ;;
  }

  dimension: div1_totalgstring {
    group_label: "Diverted"
    type: string
    sql: ${TABLE}."DIV1TOTALGSTRING" ;;
  }

  dimension: div1_wheelsoff {
    group_label: "Diverted"
    type: string
    sql: ${TABLE}."DIV1WHEELSOFF" ;;
  }

  dimension: div1_wheelson {
    group_label: "Diverted"
    type: string
    sql: ${TABLE}."DIV1WHEELSON" ;;
  }

  dimension: div2_airport {
    group_label: "Diverted"
    type: string
    sql: ${TABLE}."DIV2AIRPORT" ;;
  }

  dimension: div2_airportid {
    group_label: "Diverted"
    type: string
    sql: ${TABLE}."DIV2AIRPORTID" ;;
  }

  dimension: div2_airportseqid {
    group_label: "Diverted"
    type: string
    sql: ${TABLE}."DIV2AIRPORTSEQID" ;;
  }

  dimension: div2_longestgstring {
    group_label: "Diverted"
    type: string
    sql: ${TABLE}."DIV2LONGESTGSTRING" ;;
  }

  dimension: div2_tailnum {
    group_label: "Diverted"
    type: string
    sql: ${TABLE}."DIV2TAILNUM" ;;
  }

  dimension: div2_totalgstring {
    group_label: "Diverted"
    type: string
    sql: ${TABLE}."DIV2TOTALGSTRING" ;;
  }

  dimension: div2_wheelsoff {
    group_label: "Diverted"
    type: string
    sql: ${TABLE}."DIV2WHEELSOFF" ;;
  }

  dimension: div2_wheelson {
    group_label: "Diverted"
    type: string
    sql: ${TABLE}."DIV2WHEELSON" ;;
  }

  dimension: div3_airport {
    group_label: "Diverted"
    type: string
    sql: ${TABLE}."DIV3AIRPORT" ;;
  }

  dimension: div3_airportid {
    group_label: "Diverted"
    type: string
    sql: ${TABLE}."DIV3AIRPORTID" ;;
  }

  dimension: div3_airportseqid {
    group_label: "Diverted"
    type: string
    sql: ${TABLE}."DIV3AIRPORTSEQID" ;;
  }

  dimension: div3_longestgstring {
    group_label: "Diverted"
    type: string
    sql: ${TABLE}."DIV3LONGESTGSTRING" ;;
  }

  dimension: div3_tailnum {
    group_label: "Diverted"
    type: string
    sql: ${TABLE}."DIV3TAILNUM" ;;
  }

  dimension: div3_totalgstring {
    group_label: "Diverted"
    type: string
    sql: ${TABLE}."DIV3TOTALGSTRING" ;;
  }

  dimension: div3_wheelsoff {
    group_label: "Diverted"
    type: string
    sql: ${TABLE}."DIV3WHEELSOFF" ;;
  }

  dimension: div3_wheelson {
    group_label: "Diverted"
    type: string
    sql: ${TABLE}."DIV3WHEELSON" ;;
  }

  dimension: div4_airport {
    group_label: "Diverted"
    type: string
    sql: ${TABLE}."DIV4AIRPORT" ;;
  }

  dimension: div4_airportid {
    group_label: "Diverted"
    type: string
    sql: ${TABLE}."DIV4AIRPORTID" ;;
  }

  dimension: div4_airportseqid {
    group_label: "Diverted"
    type: string
    sql: ${TABLE}."DIV4AIRPORTSEQID" ;;
  }

  dimension: div4_longestgstring {
    group_label: "Diverted"
    type: string
    sql: ${TABLE}."DIV4LONGESTGSTRING" ;;
  }

  dimension: div4_tailnum {
    group_label: "Diverted"
    type: string
    sql: ${TABLE}."DIV4TAILNUM" ;;
  }

  dimension: div4_totalgstring {
    group_label: "Diverted"
    type: string
    sql: ${TABLE}."DIV4TOTALGSTRING" ;;
  }

  dimension: div4_wheelsoff {
    group_label: "Diverted"
    type: string
    sql: ${TABLE}."DIV4WHEELSOFF" ;;
  }

  dimension: div4_wheelson {
    group_label: "Diverted"
    type: string
    sql: ${TABLE}."DIV4WHEELSON" ;;
  }

  dimension: div5_airport {
    group_label: "Diverted"
    type: string
    sql: ${TABLE}."DIV5AIRPORT" ;;
  }

  dimension: div5_airportid {
    group_label: "Diverted"
    type: string
    sql: ${TABLE}."DIV5AIRPORTID" ;;
  }

  dimension: div5_airportseqid {
    group_label: "Diverted"
    type: string
    sql: ${TABLE}."DIV5AIRPORTSEQID" ;;
  }

  dimension: div5_longestgstring {
    group_label: "Diverted"
    type: string
    sql: ${TABLE}."DIV5LONGESTGSTRING" ;;
  }

  dimension: div5_tailnum {
    group_label: "Diverted"
    type: string
    sql: ${TABLE}."DIV5TAILNUM" ;;
  }

  dimension: div5_totalgstring {
    group_label: "Diverted"
    type: string
    sql: ${TABLE}."DIV5TOTALGSTRING" ;;
  }

  dimension: div5_wheelsoff {
    group_label: "Diverted"
    type: string
    sql: ${TABLE}."DIV5WHEELSOFF" ;;
  }

  dimension: div5_wheelson {
    group_label: "Diverted"
    type: string
    sql: ${TABLE}."DIV5WHEELSON" ;;
  }

  dimension: divactualelapsedstring {
    group_label: "Diverted"
    type: string
    sql: ${TABLE}."DIVACTUALELAPSEDSTRING" ;;
  }

  dimension: divairportlandings {
    group_label: "Diverted"
    type: string
    sql: ${TABLE}."DIVAIRPORTLANDINGS" ;;
  }

  dimension: divarrdelay {
    group_label: "Delay Info"
    type: number
    sql: ${TABLE}."DIVARRDELAY" ;;
  }

  dimension: divdistance {
    group_label: "Diverted"
    type: string
    sql: ${TABLE}."DIVDISTANCE" ;;
  }

  dimension: diverted {
    group_label: "Diverted"
    type: string
    sql: ${TABLE}."DIVERTED" ;;
  }

  dimension: divreacheddest {
    group_label: "Diverted"
    type: string
    sql: ${TABLE}."DIVREACHEDDEST" ;;
  }

  dimension: dot_id_reporting_airline {
    type: string
    sql: ${TABLE}."DOT_ID_REPORTING_AIRLINE" ;;
  }

  dimension: firstdepstring {
    type: string
    sql: ${TABLE}."FIRSTDEPSTRING" ;;
  }

  dimension: flight_number_reporting_airline {
    type: string
    sql: ${TABLE}."FLIGHT_NUMBER_REPORTING_AIRLINE" ;;
  }

  dimension_group: flightdate {
    type: time
    timeframes: [
      raw,
      date,
      week,
      quarter,
      year,
      month_num,
      fiscal_month_num
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."FLIGHTDATE" ;;
  }


  dimension: flights {
    hidden: yes  #Data have 1 flight per row
    type: number
    sql: ${TABLE}."FLIGHTS" ;;
  }

  dimension: iata_code_reporting_airline {
    type: string
    sql: ${TABLE}."IATA_CODE_REPORTING_AIRLINE" ;;
  }



  dimension: lateaircraftdelay {
    group_label: "Delay Info"
    type: string
    sql: ${TABLE}."LATEAIRCRAFTDELAY" ;;
  }

  dimension: longestaddgstring {
    type: string
    sql: ${TABLE}."LONGESTADDGSTRING" ;;
  }

  dimension: month {
    hidden: yes
    type: number
    sql: ${TABLE}."MONTH" ;;
  }

  dimension: nasdelay {
    group_label: "Delay Info"
    type: number
    sql: ${TABLE}."NASDELAY" ;;
  }

###   Origin Data ###

  dimension: origin {
    group_label: "Origin"
    type: string
    sql: ${TABLE}."ORIGIN" ;;
  }

  dimension: originairportid {
    group_label: "Origin"
    type: string
    sql: ${TABLE}."ORIGINAIRPORTID" ;;
  }

  dimension: originairportseqid {
    group_label: "Origin"
    type: string
    sql: ${TABLE}."ORIGINAIRPORTSEQID" ;;
  }

  dimension: origincitymarketid {
    group_label: "Origin"
    type: string
    sql: ${TABLE}."ORIGINCITYMARKETID" ;;
  }

  dimension: origincityname {
    group_label: "Origin"
    type: string
    sql: ${TABLE}."ORIGINCITYNAME" ;;
  }

  dimension: originstate {
    group_label: "Origin"
    type: string
    sql: ${TABLE}."ORIGINSTATE" ;;
  }

  dimension: originstatefips {
    group_label: "Origin"
    type: string
    sql: ${TABLE}."ORIGINSTATEFIPS" ;;
  }

  dimension: originstatename {
    group_label: "Origin"
    map_layer_name: us_states
    type: string
    sql: ${TABLE}."ORIGINSTATENAME" ;;
  }

  dimension: originwac {
    group_label: "Origin"
    type: string
    sql: ${TABLE}."ORIGINWAC" ;;
  }

  dimension: origin_geoloc {
    group_label: "Origin"
    label: "Geo-Location"
    type: location
    sql_latitude: ${origin.latitude} ;;
    sql_longitude: ${origin.longitude} ;;
  }

  dimension: quarter {
    hidden: no
    type: string
    sql: ${TABLE}."QUARTER" ;;
  }

  dimension: reporting_airline {
    type: string
    sql: ${TABLE}."REPORTING_AIRLINE" ;;
  }

  dimension: securitydelay {
    group_label: "Delay Info"
    type: number
    sql: ${TABLE}."SECURITYDELAY" ;;
  }

  dimension: tail_number {
    type: string
    sql: ${TABLE}."TAIL_NUMBER" ;;
  }

  dimension: taxiin {
    type: string
    sql: ${TABLE}."TAXIIN" ;;
  }

  dimension: taxiout {
    type: string
    sql: ${TABLE}."TAXIOUT" ;;
  }

  dimension: totaladdgstring {
    type: string
    sql: ${TABLE}."TOTALADDGSTRING" ;;
  }

  dimension: weatherdelay {
    group_label: "Delay Info"
    type: number
    sql: ${TABLE}."WEATHERDELAY" ;;
  }

  dimension: wheelsoff {
    type: string
    sql: ${TABLE}."WHEELSOFF" ;;
  }

  dimension: wheelson {
    type: string
    sql: ${TABLE}."WHEELSON" ;;
  }

  dimension: year {
    hidden: yes
    type: string
    sql: ${TABLE}."YEAR" ;;
  }

  ####  MEASURES  ###


  measure: count {
    type: count
    drill_fields: [origincityname, originstatename, destcityname, deststatename]
  }

  measure: sum_arr_dely {
    type: sum
    label: "Total Arrival Delay"
    sql:  ${arrdelay} ;;
    description: "minutes"
  }

  measure: sum_crr_dely {
    type: sum
    label: "Total Carrier Delay"
    sql:  ${carrierdelay} ;;
    description: "minutes"
  }


  measure: sum_NAS_dely {
    type: sum
    label: "Total NAS Delay"
    sql:  ${nasdelay} ;;
    description: "minutes"
  }

  measure: sum_Sec_dely {
    type: sum
    label: "Security Delay"
    sql:  ${securitydelay} ;;
    description: "minutes"
  }

  measure: Sum_Weather_Delay {
    label: "Weather Delay"
    type: sum
    sql: ${weatherdelay} ;;
    description: "minutes"
  }

  measure: avg_weather_delay {
    type: average
    sql: ${weatherdelay} ;;
    description: "minutes"
    value_format_name: decimal_1
  }

  # measure: cnt_flights {
  #   label: "Total Flights"   There is only one flight per row - so count works as the total flight
  #   type: sum
  #   sql: ${flights} ;;
  # }
  measure: sum_delay_total {
    label: "Delay Total"
    type: sum
    sql: ${arrdelayminutes} ;;
  }
  measure: sum_dep_delay{
    label: "Departure Delay"
    type: sum
    sql: ${depdelay} ;;
  }
  measure: sum_lateaircraftdelay {
    label: "Late Aircraft Delay"
    type: sum
    sql: ${lateaircraftdelay} ;;
  }
  measure: sum_divarrdelay {
    label: "Divergence Delay"
    type: sum
    sql: ${TABLE}.divarrdelay ;;
  }
  measure: sum_cancelld{
    label: "Cancelled"
    type: sum
    sql: ${cancelled} ;;
  }
}
