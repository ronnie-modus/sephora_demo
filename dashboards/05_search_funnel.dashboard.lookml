- dashboard: search_funnel
  title: "Search & Purchase Funnel"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Search-to-purchase conversion analysis. Identifies low-converting queries, cart abandonment patterns, and the gap between intent and purchase."

  filters:
    - name: date
      title: "Session Date"
      type: field_filter
      explore: vw_search_funnel
      field: vw_search_funnel.session_date
      ui_config:
        type: relative_timeframes
        display: inline
      default_value: "90 days"

    - name: query_intent
      title: "Query Intent"
      type: field_filter
      explore: vw_search_funnel
      field: vw_search_funnel.query_intent
      ui_config:
        type: dropdown_menu
        display: inline

    - name: device_type
      title: "Device"
      type: field_filter
      explore: vw_search_funnel
      field: vw_search_funnel.device_type
      ui_config:
        type: button_toggles
        display: inline

  elements:
    - title: "Total sessions"
      name: total_sessions
      model: sephora_demo
      explore: vw_search_funnel
      type: single_value
      fields: [vw_search_funnel.session_count]
      listen:
        date: vw_search_funnel.session_date
        query_intent: vw_search_funnel.query_intent
        device_type: vw_search_funnel.device_type
      row: 0
      col: 0
      width: 5
      height: 4

    - title: "Conversion rate"
      name: conversion_rate
      model: sephora_demo
      explore: vw_search_funnel
      type: single_value
      fields: [vw_search_funnel.conversion_rate]
      listen:
        date: vw_search_funnel.session_date
        query_intent: vw_search_funnel.query_intent
        device_type: vw_search_funnel.device_type
      row: 0
      col: 5
      width: 5
      height: 4

    - title: "Cart add rate"
      name: cart_add_rate
      model: sephora_demo
      explore: vw_search_funnel
      type: single_value
      fields: [vw_search_funnel.cart_add_rate]
      listen:
        date: vw_search_funnel.session_date
        query_intent: vw_search_funnel.query_intent
        device_type: vw_search_funnel.device_type
      row: 0
      col: 10
      width: 5
      height: 4

    - title: "Cart abandonment rate"
      name: cart_abandon_rate
      model: sephora_demo
      explore: vw_search_funnel
      type: single_value
      fields: [vw_search_funnel.cart_abandon_rate]
      listen:
        date: vw_search_funnel.session_date
        query_intent: vw_search_funnel.query_intent
        device_type: vw_search_funnel.device_type
      row: 0
      col: 15
      width: 5
      height: 4

    - title: "Avg session duration (min)"
      name: avg_duration
      model: sephora_demo
      explore: vw_search_funnel
      type: single_value
      fields: [vw_search_funnel.avg_duration_min]
      listen:
        date: vw_search_funnel.session_date
        query_intent: vw_search_funnel.query_intent
        device_type: vw_search_funnel.device_type
      row: 0
      col: 20
      width: 4
      height: 4

    - title: "Conversion rate by query intent"
      name: conv_by_intent
      model: sephora_demo
      explore: vw_search_funnel
      type: looker_bar
      fields: [vw_search_funnel.query_intent, vw_search_funnel.session_count,
               vw_search_funnel.conversion_rate, vw_search_funnel.cart_add_rate]
      sorts: [vw_search_funnel.conversion_rate desc]
      limit: 15
      listen:
        date: vw_search_funnel.session_date
        device_type: vw_search_funnel.device_type
      row: 4
      col: 0
      width: 14
      height: 10

    - title: "Sessions by device type"
      name: sessions_by_device
      model: sephora_demo
      explore: vw_search_funnel
      type: looker_pie
      fields: [vw_search_funnel.device_type, vw_search_funnel.session_count]
      sorts: [vw_search_funnel.session_count desc]
      limit: 5
      listen:
        date: vw_search_funnel.session_date
        query_intent: vw_search_funnel.query_intent
      row: 4
      col: 14
      width: 10
      height: 10

    - title: "Top queries by volume with conversion rate"
      name: top_queries
      model: sephora_demo
      explore: vw_search_funnel
      type: table
      fields: [vw_search_funnel.search_queries, vw_search_funnel.query_intent,
               vw_search_funnel.session_count, vw_search_funnel.conversion_rate,
               vw_search_funnel.cart_add_rate, vw_search_funnel.cart_abandon_rate]
      sorts: [vw_search_funnel.session_count desc]
      limit: 25
      listen:
        date: vw_search_funnel.session_date
        query_intent: vw_search_funnel.query_intent
        device_type: vw_search_funnel.device_type
      row: 14
      col: 0
      width: 24
      height: 10

    - title: "Conversion trend over time"
      name: conversion_trend
      model: sephora_demo
      explore: vw_search_funnel
      type: looker_line
      fields: [vw_search_funnel.session_week, vw_search_funnel.conversion_rate,
               vw_search_funnel.cart_add_rate, vw_search_funnel.cart_abandon_rate]
      sorts: [vw_search_funnel.session_week]
      limit: 500
      listen:
        query_intent: vw_search_funnel.query_intent
        device_type: vw_search_funnel.device_type
      row: 24
      col: 0
      width: 24
      height: 8

    - title: "Conversion rate by BI tier"
      name: conv_by_tier
      model: sephora_demo
      explore: vw_search_funnel
      type: looker_column
      fields: [vw_search_funnel.beauty_insider_tier, vw_search_funnel.session_count,
               vw_search_funnel.conversion_rate]
      sorts: [vw_search_funnel.conversion_rate desc]
      limit: 5
      listen:
        date: vw_search_funnel.session_date
        device_type: vw_search_funnel.device_type
      row: 32
      col: 0
      width: 12
      height: 8

    - title: "Acquisition channel vs conversion"
      name: channel_conv
      model: sephora_demo
      explore: vw_search_funnel
      type: looker_bar
      fields: [vw_search_funnel.acquisition_channel, vw_search_funnel.session_count,
               vw_search_funnel.conversion_rate]
      sorts: [vw_search_funnel.conversion_rate desc]
      limit: 10
      listen:
        date: vw_search_funnel.session_date
        device_type: vw_search_funnel.device_type
      row: 32
      col: 12
      width: 12
      height: 8
