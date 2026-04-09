- dashboard: product_comparison
  title: "Product Comparison"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Head-to-head product comparison using real return rates, repurchase rates, and rating by skin tone."

  filters:
    - name: product_a
      title: "Product A"
      type: field_filter
      explore: vw_product_full
      field: vw_product_full.product_name
      ui_config:
        type: advanced
        display: inline

    - name: product_b
      title: "Product B"
      type: field_filter
      explore: vw_product_full
      field: vw_product_full.product_name
      ui_config:
        type: advanced
        display: inline

  elements:
    - title: "Return rate comparison"
      name: return_rate_comparison
      model: sephora_demo
      explore: vw_product_full
      type: looker_column
      fields: [vw_product_full.product_name, vw_product_performance.avg_return_rate]
      sorts: [vw_product_full.product_name]
      limit: 10
      listen:
        product_a: vw_product_full.product_name
        product_b: vw_product_full.product_name
      row: 0
      col: 0
      width: 8
      height: 8

    - title: "Repurchase rate comparison"
      name: repurchase_rate_comparison
      model: sephora_demo
      explore: vw_product_full
      type: looker_column
      fields: [vw_product_full.product_name, vw_product_performance.avg_repurchase_rate]
      sorts: [vw_product_full.product_name]
      limit: 10
      listen:
        product_a: vw_product_full.product_name
        product_b: vw_product_full.product_name
      row: 0
      col: 8
      width: 8
      height: 8

    - title: "Gross vs effective revenue"
      name: revenue_comparison
      model: sephora_demo
      explore: vw_product_full
      type: looker_column
      fields: [vw_product_full.product_name, vw_product_performance.gross_revenue,
               vw_product_performance.effective_revenue]
      sorts: [vw_product_full.product_name]
      limit: 10
      listen:
        product_a: vw_product_full.product_name
        product_b: vw_product_full.product_name
      row: 0
      col: 16
      width: 8
      height: 8

    - title: "Rating by skin tone"
      name: rating_by_tone
      model: sephora_demo
      explore: vw_product_full
      type: looker_column
      fields: [vw_product_full.product_name, vw_segment_ratings.reviewer_skin_tone,
               vw_segment_ratings.avg_rating]
      pivots: [vw_segment_ratings.reviewer_skin_tone]
      sorts: [vw_product_full.product_name]
      limit: 10
      listen:
        product_a: vw_product_full.product_name
        product_b: vw_product_full.product_name
      row: 8
      col: 0
      width: 14
      height: 10

    - title: "Rating by skin type"
      name: rating_by_type
      model: sephora_demo
      explore: vw_product_full
      type: looker_column
      fields: [vw_product_full.product_name, vw_segment_ratings.reviewer_skin_type,
               vw_segment_ratings.avg_rating]
      pivots: [vw_segment_ratings.reviewer_skin_type]
      sorts: [vw_product_full.product_name]
      limit: 10
      listen:
        product_a: vw_product_full.product_name
        product_b: vw_product_full.product_name
      row: 8
      col: 14
      width: 10
      height: 10

    - title: "Full performance table"
      name: full_comparison_table
      model: sephora_demo
      explore: vw_product_full
      type: table
      fields: [vw_product_full.product_name, vw_product_full.brand_name,
               vw_product_full.price, vw_product_performance.total_purchases,
               vw_product_performance.gross_revenue, vw_product_performance.effective_revenue,
               vw_product_performance.avg_return_rate, vw_product_performance.avg_repurchase_rate,
               vw_product_performance.avg_recommendation_rate]
      sorts: [vw_product_performance.gross_revenue desc]
      limit: 10
      listen:
        product_a: vw_product_full.product_name
        product_b: vw_product_full.product_name
      row: 18
      col: 0
      width: 24
      height: 8

    - title: "Customers also bought"
      name: copurchase
      model: sephora_demo
      explore: vw_product_full
      type: table
      fields: [vw_product_full.product_name, vw_copurchase_enriched.product_b_name,
               vw_copurchase_enriched.product_b_brand, vw_copurchase_enriched.product_b_department,
               vw_copurchase_enriched.avg_affinity_score, vw_copurchase_enriched.avg_pct_of_a_buyers]
      sorts: [vw_copurchase_enriched.avg_affinity_score desc]
      limit: 15
      listen:
        product_a: vw_product_full.product_name
        product_b: vw_product_full.product_name
      row: 26
      col: 0
      width: 24
      height: 8
