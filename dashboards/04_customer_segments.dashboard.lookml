- dashboard: customer_segments
  title: "Customer Segments & LTV"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Beauty Insider tier analysis: LTV, purchase behaviour, repurchase rates, and churn risk by segment."

  filters:
    - name: bi_tier
      title: "Beauty Insider Tier"
      type: field_filter
      explore: customer_analysis
      field: vw_customer_ltv.beauty_insider_tier
      ui_config:
        type: button_toggles
        display: inline

    - name: acquisition_source
      title: "Acquisition Source"
      type: field_filter
      explore: customer_analysis
      field: vw_customer_ltv.acquisition_source
      ui_config:
        type: dropdown_menu
        display: inline

  elements:
    - title: "Total customers"
      name: total_customers
      model: sephora_demo
      explore: customer_analysis
      type: single_value
      fields: [vw_customer_ltv.customer_count]
      listen:
        bi_tier: vw_customer_ltv.beauty_insider_tier
        acquisition_source: vw_customer_ltv.acquisition_source
      row: 0
      col: 0
      width: 5
      height: 4

    - title: "Avg lifetime spend"
      name: avg_ltv
      model: sephora_demo
      explore: customer_analysis
      type: single_value
      fields: [vw_customer_ltv.avg_lifetime_spend]
      listen:
        bi_tier: vw_customer_ltv.beauty_insider_tier
        acquisition_source: vw_customer_ltv.acquisition_source
      row: 0
      col: 5
      width: 5
      height: 4

    - title: "Avg order value"
      name: avg_aov
      model: sephora_demo
      explore: customer_analysis
      type: single_value
      fields: [vw_customer_ltv.avg_order_value]
      listen:
        bi_tier: vw_customer_ltv.beauty_insider_tier
        acquisition_source: vw_customer_ltv.acquisition_source
      row: 0
      col: 10
      width: 5
      height: 4

    - title: "Avg repurchase rate"
      name: avg_repurchase
      model: sephora_demo
      explore: customer_analysis
      type: single_value
      fields: [vw_customer_ltv.avg_repurchase_rate]
      listen:
        bi_tier: vw_customer_ltv.beauty_insider_tier
        acquisition_source: vw_customer_ltv.acquisition_source
      row: 0
      col: 15
      width: 5
      height: 4

    - title: "% at churn risk (90+ days inactive)"
      name: churn_risk_pct
      model: sephora_demo
      explore: customer_analysis
      type: single_value
      fields: [vw_customer_ltv.pct_at_churn_risk]
      listen:
        bi_tier: vw_customer_ltv.beauty_insider_tier
        acquisition_source: vw_customer_ltv.acquisition_source
      row: 0
      col: 20
      width: 4
      height: 4

    - title: "LTV by BI tier"
      name: ltv_by_tier
      model: sephora_demo
      explore: customer_analysis
      type: looker_column
      fields: [vw_customer_ltv.beauty_insider_tier, vw_customer_ltv.avg_lifetime_spend,
               vw_customer_ltv.avg_order_value, vw_customer_ltv.avg_repurchase_rate]
      sorts: [vw_customer_ltv.avg_lifetime_spend desc]
      limit: 10
      row: 4
      col: 0
      width: 12
      height: 10

    - title: "Customer count by tier"
      name: count_by_tier
      model: sephora_demo
      explore: customer_analysis
      type: looker_pie
      fields: [vw_customer_ltv.beauty_insider_tier, vw_customer_ltv.customer_count]
      sorts: [vw_customer_ltv.customer_count desc]
      limit: 5
      row: 4
      col: 12
      width: 6
      height: 10

    - title: "Churn risk by tier"
      name: churn_by_tier
      model: sephora_demo
      explore: customer_analysis
      type: looker_column
      fields: [vw_customer_ltv.beauty_insider_tier, vw_customer_ltv.pct_at_churn_risk,
               vw_customer_ltv.customer_count]
      sorts: [vw_customer_ltv.beauty_insider_tier]
      limit: 5
      row: 4
      col: 18
      width: 6
      height: 10

    - title: "LTV by acquisition source"
      name: ltv_by_acquisition
      model: sephora_demo
      explore: customer_analysis
      type: looker_bar
      fields: [vw_customer_ltv.acquisition_source, vw_customer_ltv.avg_lifetime_spend,
               vw_customer_ltv.customer_count]
      sorts: [vw_customer_ltv.avg_lifetime_spend desc]
      limit: 15
      row: 14
      col: 0
      width: 12
      height: 10

    - title: "Skin type distribution by tier"
      name: skin_type_by_tier
      model: sephora_demo
      explore: customer_analysis
      type: looker_column
      fields: [vw_customer_ltv.beauty_insider_tier, vw_customer_ltv.skin_type,
               vw_customer_ltv.customer_count]
      pivots: [vw_customer_ltv.skin_type]
      sorts: [vw_customer_ltv.beauty_insider_tier]
      limit: 10
      row: 14
      col: 12
      width: 12
      height: 10

    - title: "Signup cohorts by tier"
      name: signup_cohorts
      model: sephora_demo
      explore: customer_analysis
      type: looker_area
      fields: [vw_customer_ltv.signup_month, vw_customer_ltv.beauty_insider_tier,
               vw_customer_ltv.customer_count]
      pivots: [vw_customer_ltv.beauty_insider_tier]
      sorts: [vw_customer_ltv.signup_month]
      limit: 500
      row: 24
      col: 0
      width: 24
      height: 8
