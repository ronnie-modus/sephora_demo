- dashboard: seasonal_trends
  title: "Seasonal Trends"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Monthly revenue trends, seasonal demand patterns, and year-over-year comparisons by department and brand tier."

  filters:
    - name: department
      title: "Department"
      type: field_filter
      explore: vw_product_performance
      field: vw_product_performance.department
      ui_config:
        type: dropdown_menu
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
    - title: "Gross revenue by month"
      name: monthly_revenue
      model: sephora_demo
      explore: vw_product_performance
      type: looker_line
      fields: [vw_product_full.department, vw_product_performance.gross_revenue]
      pivots: [vw_product_full.department]
      sorts: [vw_product_performance.gross_revenue desc]
      limit: 500
      listen:
        brand_tier: vw_product_performance.brand_tier
      row: 0
      col: 0
      width: 24
      height: 10

    - title: "Total purchases by month and department"
      name: monthly_purchases
      model: sephora_demo
      explore: vw_product_performance
      type: looker_area
      fields: [vw_product_full.department, vw_product_performance.total_purchases]
      pivots: [vw_product_full.department]
      sorts: [vw_product_performance.total_purchases desc]
      limit: 500
      listen:
        brand_tier: vw_product_performance.brand_tier
      row: 10
      col: 0
      width: 16
      height: 10

    - title: "Revenue mix by department"
      name: dept_mix
      model: sephora_demo
      explore: vw_product_performance
      type: looker_pie
      fields: [vw_product_performance.department, vw_product_performance.gross_revenue]
      sorts: [vw_product_performance.gross_revenue desc]
      limit: 10
      listen:
        brand_tier: vw_product_performance.brand_tier
      row: 10
      col: 16
      width: 8
      height: 10

    - title: "Return rate trend by department"
      name: return_trend
      model: sephora_demo
      explore: vw_product_performance
      type: looker_line
      fields: [vw_product_full.department, vw_product_performance.avg_return_rate]
      pivots: [vw_product_full.department]
      sorts: [vw_product_performance.avg_return_rate desc]
      limit: 500
      listen:
        brand_tier: vw_product_performance.brand_tier
      note_state: expanded
      note_display: below
      note_text: "Rising return rates may indicate product-market mismatch, quality issues, or condition mislabelling."
      row: 20
      col: 0
      width: 12
      height: 8

    - title: "Repurchase rate trend by department"
      name: repurchase_trend
      model: sephora_demo
      explore: vw_product_performance
      type: looker_line
      fields: [vw_product_full.department, vw_product_performance.avg_repurchase_rate]
      pivots: [vw_product_full.department]
      sorts: [vw_product_performance.avg_repurchase_rate desc]
      limit: 500
      listen:
        brand_tier: vw_product_performance.brand_tier
      row: 20
      col: 12
      width: 12
      height: 8

    - title: "Revenue by brand tier over time"
      name: tier_revenue_trend
      model: sephora_demo
      explore: vw_product_performance
      type: looker_column
      fields: [vw_product_performance.brand_tier, vw_product_performance.gross_revenue]
      pivots: [vw_product_performance.brand_tier]
      sorts: [vw_product_performance.gross_revenue desc]
      limit: 500
      listen:
        department: vw_product_performance.department
      row: 28
      col: 0
      width: 24
      height: 8
