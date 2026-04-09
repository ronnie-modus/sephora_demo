- dashboard: brand_scorecard
  title: "Brand Scorecard"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Per-brand commercial health: return rate, repurchase rate, revenue, and AI recommendation effectiveness. Flags divergence between revenue rank and satisfaction signals."

  filters:
    - name: brand_tier
      title: "Brand Tier"
      type: field_filter
      explore: vw_product_performance
      field: vw_product_performance.brand_tier
      ui_config:
        type: button_toggles
        display: inline

    - name: department
      title: "Department"
      type: field_filter
      explore: vw_product_performance
      field: vw_product_performance.department
      ui_config:
        type: dropdown_menu
        display: inline

  elements:
    - title: "Brands in selection"
      name: brand_count
      model: sephora_demo
      explore: vw_product_performance
      type: single_value
      fields: [vw_product_performance.product_count]
      listen:
        brand_tier: vw_product_performance.brand_tier
        department: vw_product_performance.department
      row: 0
      col: 0
      width: 6
      height: 4

    - title: "Total effective revenue"
      name: total_eff_rev
      model: sephora_demo
      explore: vw_product_performance
      type: single_value
      fields: [vw_product_performance.effective_revenue]
      listen:
        brand_tier: vw_product_performance.brand_tier
        department: vw_product_performance.department
      row: 0
      col: 6
      width: 6
      height: 4

    - title: "Avg return rate"
      name: avg_rr
      model: sephora_demo
      explore: vw_product_performance
      type: single_value
      fields: [vw_product_performance.avg_return_rate]
      listen:
        brand_tier: vw_product_performance.brand_tier
        department: vw_product_performance.department
      row: 0
      col: 12
      width: 6
      height: 4

    - title: "Avg repurchase rate"
      name: avg_rep
      model: sephora_demo
      explore: vw_product_performance
      type: single_value
      fields: [vw_product_performance.avg_repurchase_rate]
      listen:
        brand_tier: vw_product_performance.brand_tier
        department: vw_product_performance.department
      row: 0
      col: 18
      width: 6
      height: 4

    - title: "Full brand scorecard"
      name: brand_table
      model: sephora_demo
      explore: vw_product_performance
      type: table
      fields: [vw_product_performance.brand_name, vw_product_performance.brand_tier,
               vw_product_performance.department, vw_product_performance.product_count,
               vw_product_performance.total_purchases, vw_product_performance.gross_revenue,
               vw_product_performance.effective_revenue, vw_product_performance.revenue_lost_to_returns,
               vw_product_performance.avg_return_rate, vw_product_performance.avg_repurchase_rate,
               vw_product_performance.avg_recommendation_rate, vw_product_performance.avg_skin_match_rate]
      sorts: [vw_product_performance.effective_revenue desc]
      limit: 50
      listen:
        brand_tier: vw_product_performance.brand_tier
        department: vw_product_performance.department
      row: 4
      col: 0
      width: 24
      height: 14

    - title: "Return rate vs repurchase rate (bubble = revenue)"
      name: quality_scatter
      model: sephora_demo
      explore: vw_product_performance
      type: looker_scatter
      fields: [vw_product_performance.brand_name, vw_product_performance.avg_return_rate,
               vw_product_performance.avg_repurchase_rate, vw_product_performance.effective_revenue]
      sorts: [vw_product_performance.effective_revenue desc]
      limit: 30
      listen:
        brand_tier: vw_product_performance.brand_tier
        department: vw_product_performance.department
      note_state: expanded
      note_display: below
      note_text: "Top-right quadrant (low return, high repurchase) = strongest brand health."
      row: 18
      col: 0
      width: 24
      height: 12
