view: events {
  sql_table_name: atomic.events ;;

  dimension: event_id {
    primary_key: yes
    type: string
    hidden: yes
    sql: ${TABLE}.event_id ;;
  }

  dimension: app_id {
    hidden: yes
    type: string
    sql: ${TABLE}.app_id ;;
  }

  dimension: base_currency {
    type: string
    hidden: yes
    sql: ${TABLE}.base_currency ;;
  }

  dimension: br_colordepth {
    label: "Color depth"
    group_label: "Browser - More info"
    description: "Color resolution (in bits)"
    type: string
    hidden: no
    sql: ${TABLE}.br_colordepth ;;
  }

  dimension: br_cookies {
    description:"Are cookies allowed?"
    group_label: "Browser - More info"
    type: yesno
    hidden: no
    sql: ${TABLE}.br_cookies ;;
  }

  dimension: br_family {
    label: "Browser"
    group_label: "Browser"
    type: string
    sql: ${TABLE}.br_family ;;
  }

  dimension: br_features_director {
    group_label: "Browser - More info"
    type: yesno
    hidden: no
    sql: ${TABLE}.br_features_director ;;
  }

  dimension: br_features_flash {
    group_label: "Browser - More info"
    type: yesno
    hidden: no
    sql: ${TABLE}.br_features_flash ;;
  }

  dimension: br_features_gears {
    group_label: "Browser - More info"
    type: yesno
    hidden: no
    sql: ${TABLE}.br_features_gears ;;
  }

  dimension: br_features_java {
    group_label: "Browser - More info"
    type: yesno
    hidden: no
    sql: ${TABLE}.br_features_java ;;
  }

  dimension: br_features_pdf {
    group_label: "Browser - More info"
    type: yesno
    hidden: no
    sql: ${TABLE}.br_features_pdf ;;
  }

  dimension: br_features_quicktime {
    group_label: "Browser - More info"
    type: yesno
    hidden: no
    sql: ${TABLE}.br_features_quicktime ;;
  }

  dimension: br_features_realplayer {
    group_label: "Browser - More info"
    type: yesno
    hidden:  no
    sql: ${TABLE}.br_features_realplayer ;;
  }

  dimension: br_features_silverlight {
    group_label: "Browser - More info"
    type: yesno
    hidden:  no
    sql: ${TABLE}.br_features_silverlight ;;
  }

  dimension: br_features_windowsmedia {
    group_label: "Browser - More info"
    type: yesno
    hidden:  no
    sql: ${TABLE}.br_features_windowsmedia ;;
  }

  dimension: br_lang {
    label: "Browser Language"
    group_label: "Browser"
    type: string
    sql: ${TABLE}.br_lang ;;
  }

  dimension: br_name {
    label: " Full Browser Name"
    group_label: "Browser - More info"
    type: string
    sql: ${TABLE}.br_name ;;
  }

  dimension: br_renderengine {
    group_label: "Browser - More info"
    hidden: yes
    type: string
    sql: ${TABLE}.br_renderengine ;;
  }

  dimension: br_type {
    group_label: "Browser - More info"
    type: string
    label: "Browser Type"
    sql: ${TABLE}.br_type ;;
  }

  dimension: br_version {
    group_label: "Browser"
    type: string
    label: "Browser Version"
    sql: ${TABLE}.br_version ;;
  }


  dimension: br_viewheight {
    group_label: "Browser - More info"
    hidden: yes
    type: number
    sql: ${TABLE}.br_viewheight ;;
  }

  dimension: viewheight {
    group_label: "Browser - More info"
    hidden: no
    type: tier
    tiers: [400,550,768,992,1200]
    sql: ${TABLE}.br_viewheight ;;
  }
  dimension: br_viewwidth {
    group_label: "Browser - More info"
    hidden: yes
    type: number
    sql: ${TABLE}.br_viewwidth ;;
  }

  dimension: viewwidth {
    group_label: "Browser - More info"
    hidden: no
    type: tier
    tiers: [400,550,768,992,1200]
    sql: ${TABLE}.br_viewwidth ;;
  }
  dimension_group: event {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.collector_tstamp ;;
  }

  dimension_group: derived_tstamp {
    hidden: yes
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.derived_tstamp ;;
  }

##designer things
  dimension: doc_charset {
    type: string
    hidden:  yes
    sql: ${TABLE}.doc_charset ;;
  }

  dimension: doc_height {
    type: number
    hidden:  yes
    sql: ${TABLE}.doc_height ;;
  }

  dimension: doc_width {
    type: number
    hidden:  yes
    sql: ${TABLE}.doc_width ;;
  }

  dimension: domain_sessionid {
    hidden: yes
    type: string
    sql: ${TABLE}.domain_sessionid ;;
  }

  dimension: domain_sessionidx {
    hidden: yes
    type: number
    sql: ${TABLE}.domain_sessionidx ;;
  }

  dimension: domain_userid {
    hidden: yes
    type: string
    sql: ${TABLE}.domain_userid ;;
  }

  dimension_group: dvce_created_tstamp {
    ### not set properly in the
    hidden: yes
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.dvce_created_tstamp ;;
  }

  dimension: dvce_ismobile {
    type: yesno
    group_label: "Device"
    label: "Is the device mobile?"
    sql: ${TABLE}.dvce_ismobile ;;
  }

###talk to designers about this
  dimension: dvce_screenheight {
    hidden: yes
    type: number
    sql: ${TABLE}.dvce_screenheight ;;
  }

  dimension: device_screenheight {
    group_label: "Device"
    hidden: yes
    ##required_access_grants: [can_see_designer_fields]
    type: tier
    tiers: [400,550,768,992,1200]
    style: integer
    sql: ${TABLE}.dvce_screenheight ;;
  }

  dimension: dvce_screenwidth {
    group_label: "Device"
    hidden: yes
    type: number
    sql: ${TABLE}.dvce_screenwidth ;;
  }
  dimension: device_screenwidth {
    group_label: "Device"
    ##required_access_grants: [can_see_designer_fields]
    type: tier
    tiers: [400,550,768,992,1200]
    style: integer
    sql: ${TABLE}.dvce_screenwidth ;;
  }
  dimension: landscaped_device{
    type: yesno
    group_label: "Device"
    sql: ${dvce_screenwidth}>${dvce_screenheight} ;;
  }


  dimension_group: dvce_sent_tstamp {
    hidden: yes
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.dvce_sent_tstamp ;;
  }

  dimension: dvce_type {
    type: string
    group_label: "Device"
    label: "Device Type"
    sql: ${TABLE}.dvce_type ;;
  }

  dimension: etl_tags {
    type: string
    hidden: yes
    sql: ${TABLE}.etl_tags ;;
  }

  dimension_group: etl_tstamp {
    hidden: yes
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.etl_tstamp ;;
  }

  dimension: event {
    hidden: yes
    type: string
    sql: ${TABLE}.event ;;
  }

  dimension: event_fingerprint {
    hidden: yes
    type: string
    sql: ${TABLE}.event_fingerprint ;;
  }

  dimension: event_format {
    hidden: yes
    type: string
    sql: ${TABLE}.event_format ;;
  }

  dimension: event_name {
    type: string
    sql: ${TABLE}.event_name ;;
  }

  dimension: event_vendor {
    hidden: yes
    type: string
    sql: ${TABLE}.event_vendor ;;
  }

  dimension: event_version {
    type: string
    hidden: yes
    sql: ${TABLE}.event_version ;;
  }

  dimension: geo_city {
    group_label: "Location"
    type: string
    sql: ${TABLE}.geo_city ;;
  }

  dimension: geo_country {
    group_label: "Location"
    type: string
    sql: ${TABLE}.geo_country ;;
  }
### we have to discuss how to use it for offline marketing campaign tracking
  dimension: geo_latitude {
    ###deleted after 4 days
    group_label: "Location"
    type: number
    hidden:  yes
    sql: ${TABLE}.geo_latitude ;;
  }

  dimension: geo_longitude {
    ###deleted after 4 days
    group_label: "Location"
    type: number
    hidden:  yes
    sql: ${TABLE}.geo_longitude ;;
  }

  dimension: geo_region {
    group_label: "Location"
    type: string
    sql: ${TABLE}.geo_region ;;
  }

  dimension: geo_region_name {
    group_label: "Location"
    type: string
    sql: ${TABLE}.geo_region_name ;;
  }

  dimension: geo_timezone {
    group_label: "Location information"
    hidden: yes
    type: string
    sql: ${TABLE}.geo_timezone ;;
  }

  dimension: geo_zipcode {
    group_label: "Location information"
    hidden: yes
    type: string
    sql: ${TABLE}.geo_zipcode ;;
  }

  dimension: ip_domain {
    type: string
    hidden: yes
    sql: ${TABLE}.ip_domain ;;
  }

  dimension: ip_isp {
    type: string
    hidden:  yes
    sql: ${TABLE}.ip_isp ;;
  }

### could be maaaybe useful at some point for product
  dimension: ip_netspeed {
    type: string
    hidden: yes
    sql: ${TABLE}.ip_netspeed ;;
  }

  dimension: ip_organization {
    type: string
    hidden: yes
    sql: ${TABLE}.ip_organization ;;
  }

  dimension: campaign {
    group_label: "UTM parameters campaign info"
    type: string
    sql: ${TABLE}.mkt_campaign ;;
  }

  dimension: clickid {
    group_label: "UTM parameters campaign info"
    type: string
    hidden: yes
    sql: ${TABLE}.mkt_clickid ;;
  }

  dimension: content {
    group_label: "UTM parameters campaign info"
    label: "Campaign Content"
    type: string
    sql: ${TABLE}.mkt_content ;;
  }

  dimension: medium {
    group_label: "UTM parameters campaign info"
    label: "Campaign Medium"
    type: string
    sql: ${TABLE}.mkt_medium ;;
  }

  dimension: network {
    group_label: "UTM parameters campaign info"
    label: "Campaign Network"
    type: string
    sql: ${TABLE}.mkt_network ;;
  }

  dimension: mkt_source {
    group_label: "UTM parameters campaign info"
    label: "Campaign Source"
    type: string
    sql: ${TABLE}.mkt_source ;;
  }

  dimension: mkt_term {
    group_label: "UTM parameters campaign info"
    label: "Campaign Source"
    type: string
    sql: ${TABLE}.mkt_term ;;
  }

  dimension: name_tracker {
    type: string
    hidden: yes
    sql: ${TABLE}.name_tracker ;;
  }

  dimension: network_userid {
    type: string
    hidden:  yes
    sql: ${TABLE}.network_userid ;;
  }

  dimension: os_family {
    type: string
    group_label: "OS Information"
    label: "Operating System"
    sql: ${TABLE}.os_family ;;
  }

  dimension: os_manufacturer {
    type: string
    group_label: "OS Information"
    hidden:  yes
    sql: ${TABLE}.os_manufacturer ;;
  }

  dimension: os_name {
    type: string
    group_label: "OS Information"
    label:"Operating System Name"
    sql: ${TABLE}.os_name ;;
  }

  dimension: os_timezone {
    hidden: yes
    type: string
    sql: ${TABLE}.os_timezone ;;
  }

  dimension: page_referrer {
    group_label: "Page Information"
    description: "The page directly before this page"
    type: string
    sql: ${TABLE}.page_referrer ;;
  }

  dimension: page_title {
    group_label: "Page Information"
    type: string
    sql: ${TABLE}.page_title ;;
  }

  dimension: page_url {
    group_label: "Page Information"
    type: string
    sql: ${TABLE}.page_url ;;
  }

  dimension: page_urlfragment {
    group_label: "Page Information"
    label: "Further URL detail"
    type: string
    sql: ${TABLE}.page_urlfragment ;;
  }

##we can group this later if needed
  dimension: page_urlhost {
    group_label: "Page Information"
    type: string
    hidden: yes
    sql: ${TABLE}.page_urlhost ;;
  }

  dimension: page_urlpath {
    group_label: "Page Information"
    hidden: yes
    type: string
    sql: ${TABLE}.page_urlpath ;;
  }

  dimension: page_urlport {
    group_label: "Page Information"
    hidden: yes
    type: number
    sql: ${TABLE}.page_urlport ;;
  }

  dimension: page_urlquery {
    group_label: "Page Information"
    hidden: yes
    type: string
    sql: ${TABLE}.page_urlquery ;;
  }

  dimension: page_urlscheme {
    group_label: "Page Information"
    hidden: yes
    type: string
    sql: ${TABLE}.page_urlscheme ;;
  }

  dimension: platform {
    hidden: yes
    type: string
    sql: ${TABLE}.platform ;;
  }

###talk to designers on this
  dimension: pp_xoffset_max {
    type: number
    hidden:  yes
    sql: ${TABLE}.pp_xoffset_max ;;
  }

  dimension: pp_xoffset_min {
    type: number
    hidden:  yes
    sql: ${TABLE}.pp_xoffset_min ;;
  }

  dimension: pp_yoffset_max {
    type: number
    hidden:  yes
    sql: ${TABLE}.pp_yoffset_max ;;
  }

  dimension: pp_yoffset_min {
    type: number
    hidden:  yes
    sql: ${TABLE}.pp_yoffset_min ;;
  }

  dimension: refr_domain_userid {
    type: string
    hidden: yes
    sql: ${TABLE}.refr_domain_userid ;;
  }

  dimension_group: refr_dvce_tstamp {
    hidden: yes
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.refr_dvce_tstamp ;;
  }

  dimension: refr_medium {
    group_label: "Referral Page Information"
    label: "Type of referer"
    type: string
    sql: ${TABLE}.refr_medium ;;
  }

  dimension: refr_source {
    group_label: "Referral Page Information"
    label: "Name of referer"
    type: string
    sql: ${TABLE}.refr_source ;;
  }

  dimension: refr_term {
    group_label: "Referral Page Information"
    label: "SEO keywords"
    type: string
    sql: ${TABLE}.refr_term ;;
  }

  dimension: refr_urlfragment {
    group_label: "Referral Page Information"
    hidden: yes
    type: string
    sql: ${TABLE}.refr_urlfragment ;;
  }

  dimension: refr_urlhost {
    group_label: "Referral Page Information"
    label: "Referer URL"
    type: string
    sql: ${TABLE}.refr_urlhost ;;
  }

  dimension: refr_urlpath {
    group_label: "Referral Page Information"
    label: "Referer URL details"
    type: string
    sql: ${TABLE}.refr_urlpath ;;
  }

  dimension: refr_urlport {
    group_label: "Referral Page Information"
    hidden: yes
    type: number
    sql: ${TABLE}.refr_urlport ;;
  }

  dimension: refr_urlquery {
    group_label: "Referral Page Information"
    type: string
    sql: ${TABLE}.refr_urlquery ;;
  }

  dimension: refr_urlscheme {
    group_label: "Referral Page Information"
    hidden: yes
    type: string
    sql: ${TABLE}.refr_urlscheme ;;
  }

  dimension: se_action {
    type: string
    group_label: "Event Description"
    label: "Action performed"
    description: "A type of action e.g. click, start-video, launch"
    sql: ${TABLE}.se_action ;;
  }

  dimension: se_category {
    type: string
    label: "Event Category"
    group_label: "Event Description"
    description: "A wider description of where/how the event is triggered, can be e.g. location (info, app intro, serp)"
    sql: ${TABLE}.se_category ;;
  }

  dimension: se_label {
    type: string
    group_label: "Event Description"
    description: "The object of the action, e.g maps, video"
    label: "Event Label"
    sql: ${TABLE}.se_label ;;
  }

  dimension: se_property {
    type: string
    group_label: "Event Description"
    label: "Event Property"
    description: "A property associated with the object of the action"
    sql: ${TABLE}.se_property ;;
  }

  dimension: se_value {
    type: number
    group_label: "Event Description"
    label: "Event Value"
    description: "A numerical value associated with the event"
    sql: ${TABLE}.se_value ;;
  }

  dimension: ti_category {
    type: string
    hidden: yes
    sql: ${TABLE}.ti_category ;;
  }

  dimension: ti_currency {
    type: string
    hidden: yes
    sql: ${TABLE}.ti_currency ;;
  }

  dimension: ti_name {
    type: string
    hidden: yes
    sql: ${TABLE}.ti_name ;;
  }

  dimension: ti_orderid {
    type: string
    hidden: yes
    sql: ${TABLE}.ti_orderid ;;
  }

  dimension: ti_price {
    type: number
    hidden: yes
    sql: ${TABLE}.ti_price ;;
  }

  dimension: ti_price_base {
    type: number
    hidden: yes
    sql: ${TABLE}.ti_price_base ;;
  }

  dimension: ti_quantity {
    type: number
    hidden: yes
    sql: ${TABLE}.ti_quantity ;;
  }

  dimension: ti_sku {
    type: string
    hidden: yes
    sql: ${TABLE}.ti_sku ;;
  }

  dimension: tr_affiliation {
    type: string
    hidden: yes
    sql: ${TABLE}.tr_affiliation ;;
  }

  dimension: tr_city {
    type: string
    hidden: yes
    sql: ${TABLE}.tr_city ;;
  }

  dimension: tr_country {
    type: string
    hidden: yes
    sql: ${TABLE}.tr_country ;;
  }

  dimension: tr_currency {
    type: string
    hidden: yes
    sql: ${TABLE}.tr_currency ;;
  }

  dimension: tr_orderid {
    type: string
    hidden: yes
    sql: ${TABLE}.tr_orderid ;;
  }

  dimension: tr_shipping {
    type: number
    hidden: yes
    sql: ${TABLE}.tr_shipping ;;
  }

  dimension: tr_shipping_base {
    type: number
    hidden: yes
    sql: ${TABLE}.tr_shipping_base ;;
  }

  dimension: tr_state {
    type: string
    hidden: yes
    sql: ${TABLE}.tr_state ;;
  }

  dimension: tr_tax {
    type: number
    hidden: yes
    sql: ${TABLE}.tr_tax ;;
  }

  dimension: tr_tax_base {
    type: number
    hidden: yes
    sql: ${TABLE}.tr_tax_base ;;
  }

  dimension: tr_total {
    type: number
    hidden: yes
    sql: ${TABLE}.tr_total ;;
  }

  dimension: tr_total_base {
    type: number
    hidden: yes
    sql: ${TABLE}.tr_total_base ;;
  }

  dimension_group: true_tstamp {
    hidden: yes
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.true_tstamp ;;
  }

  dimension: txn_id {
    type: number
    hidden: yes
    sql: ${TABLE}.txn_id ;;
  }

  dimension: user_fingerprint {
    type: string
    hidden: yes
    sql: ${TABLE}.user_fingerprint ;;
  }

  dimension: user_id {
    type: string
    hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: user_ipaddress {
    type: string
    hidden: yes
    sql: ${TABLE}.user_ipaddress ;;
  }

  dimension: useragent {
    type: string
    hidden: yes
    sql: ${TABLE}.useragent ;;
  }

  dimension: v_collector {
    type: string
    hidden: yes
    sql: ${TABLE}.v_collector ;;
  }

  dimension: v_etl {
    type: string
    hidden: yes
    sql: ${TABLE}.v_etl ;;
  }

  dimension: v_tracker {
    type: string
    hidden: yes
    sql: ${TABLE}.v_tracker ;;
  }

  measure: number_of_events {
    type: count
    drill_fields: [detail*]
  }

  measure: number_of_users
  {type:count_distinct
    sql: ${TABLE}.domain_userid ;;
    drill_fields: [detail*]
    }

  measure: number_of_sessions
  {type:count_distinct
    sql: ${TABLE}.session_id ;;
    drill_fields: [detail*]
    }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      event_id,
      event_name,
      dvce_ismobile,
      name_tracker,
      br_family,
      os_name,
      br_name,
      geo_region_name,
      geo_country,
      geo_city,

    ]
  }
}
