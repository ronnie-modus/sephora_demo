- dashboard: merchandising_performance
  title: "Merchandising Performance"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Brand and category commercial health — gross vs effective revenue, return rates, repurchase velocity, and channel mix."

  filters:
    - name: department
      title: "Department"
      type: field_filter
      explore: vw_product_performance
      field: vw_product_performance.department
      ui_config:
        type: button_toggles
        display: inline

    - name: brand_tier
      title: "Brand Tier"
      type: field_filter
      explore: vw_product_performance
      field: vw_product_performance.brand_tier
      ui_config:
        type: checkboxes
        display: inline

  elements:
    - title: "Total gross revenue"
      name: total_gross
      model: ecommerce_demo
      explore: vw_product_performance
      type: single_value
      fields: [vw_product_performance.gross_revenue]
      listen:
        department: vw_product_performance.department
        brand_tier: vw_product_performance.brand_tier
      row: 0
      col: 0
      width: 6
      height: 4

    - title: "Effective revenue (adj. for returns)"
      name: total_effective
      model: ecommerce_demo
      explore: vw_product_performance
      type: single_value
      fields: [vw_product_performance.effective_revenue]
      listen:
        department: vw_product_performance.department
        brand_tier: vw_product_performance.brand_tier
      row: 0
      col: 6
      width: 6
      height: 4

    - title: "Avg return rate"
      name: avg_return
      model: ecommerce_demo
      explore: vw_product_performance
      type: single_value
      fields: [vw_product_performance.avg_return_rate]
      listen:
        department: vw_product_performance.department
        brand_tier: vw_product_performance.brand_tier
      row: 0
      col: 12
      width: 6
      height: 4

    - title: "Avg repurchase rate"
      name: avg_repurchase
      model: ecommerce_demo
      explore: vw_product_performance
      type: single_value
      fields: [vw_product_performance.avg_repurchase_rate]
      listen:
        department: vw_product_performance.department
        brand_tier: vw_product_performance.brand_tier
      row: 0
      col: 18
      width: 6
      height: 4

    - title: "Revenue by department"
      name: rev_by_dept
      model: ecommerce_demo
      explore: vw_product_performance
      type: looker_column
      fields: [vw_product_performance.department, vw_product_performance.gross_revenue,
               vw_product_performance.effective_revenue]
      sorts: [vw_product_performance.gross_revenue desc]
      limit: 10
      listen:
        brand_tier: vw_product_performance.brand_tier
      row: 4
      col: 0
      width: 12
      height: 10

    - title: "Return rate vs repurchase rate by department"
      name: quality_by_dept
      model: ecommerce_demo
      explore: vw_product_performance
      type: looker_scatter
      fields: [vw_product_performance.department, vw_product_performance.avg_return_rate,
               vw_product_performance.avg_repurchase_rate, vw_product_performance.gross_revenue]
      sorts: [vw_product_performance.gross_revenue desc]
      limit: 10
      row: 4
      col: 12
      width: 12
      height: 10

    - title: "Top brands — gross vs effective revenue"
      name: brand_revenue
      model: ecommerce_demo
      explore: vw_product_performance
      type: looker_bar
      fields: [vw_product_performance.brand_name, vw_product_performance.gross_revenue,
               vw_product_performance.effective_revenue]
      sorts: [vw_product_performance.gross_revenue desc]
      limit: 20
      listen:
        department: vw_product_performance.department
        brand_tier: vw_product_performance.brand_tier
      row: 14
      col: 0
      width: 14
      height: 12

    - title: "Revenue lost to returns by brand"
      name: revenue_loss
      model: ecommerce_demo
      explore: vw_product_performance
      type: looker_bar
      fields: [vw_product_performance.brand_name, vw_product_performance.revenue_lost_to_returns]
      sorts: [vw_product_performance.revenue_lost_to_returns desc]
      limit: 15
      listen:
        department: vw_product_performance.department
        brand_tier: vw_product_performance.brand_tier
      row: 14
      col: 14
      width: 10
      height: 12

    - title: "Channel mix by department"
      name: channel_mix
      model: ecommerce_demo
      explore: vw_product_performance
      type: looker_column
      fields: [vw_product_performance.department, vw_product_performance.avg_pct_online,
               vw_product_performance.avg_pct_in_store, vw_product_performance.avg_pct_app]
      sorts: [vw_product_performance.avg_pct_online desc]
      limit: 10
      listen:
        brand_tier: vw_product_performance.brand_tier
      row: 26
      col: 0
      width: 16
      height: 8

    - title: "AI recommendation rate by brand"
      name: ai_rec_rate
      model: ecommerce_demo
      explore: vw_product_performance
      type: looker_bar
      fields: [vw_product_performance.brand_name, vw_product_performance.avg_recommendation_rate,
               vw_product_performance.avg_repurchase_rate]
      sorts: [vw_product_performance.avg_recommendation_rate desc]
      limit: 15
      listen:
        department: vw_product_performance.department
        brand_tier: vw_product_performance.brand_tier
      note_state: expanded
      note_display: below
      note_text: "High recommendation rate with low repurchase rate = AI driving trial, not loyalty."
      row: 26
      col: 16
      width: 8
      height: 8
