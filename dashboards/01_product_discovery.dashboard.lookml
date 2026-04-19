- dashboard: product_discovery
  title: "Product Discovery"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Find products that match a customer skin profile. Ranked by segment-matched ratings and repurchase rate."

  filters:
    - name: department
      title: "Department"
      type: field_filter
      explore: vw_product_full
      field: vw_product_full.department
      ui_config:
        type: button_toggles
        display: inline
      default_value: "Skincare"

    - name: skin_type
      title: "Skin Type"
      type: field_filter
      explore: vw_product_full
      field: vw_segment_ratings.reviewer_skin_type
      ui_config:
        type: dropdown_menu
        display: inline

    - name: skin_concern
      title: "Skin Concern"
      type: field_filter
      explore: vw_product_full
      field: vw_product_full.skin_concern
      ui_config:
        type: advanced
        display: inline

    - name: max_price
      title: "Max Price"
      type: field_filter
      explore: vw_product_full
      field: vw_product_full.price
      ui_config:
        type: slider
        display: inline
      default_value: "<= 100"

  elements:
    - title: "Products matching profile"
      name: product_match_count
      model: ecommerce_demo
      explore: vw_product_full
      type: single_value
      fields: [vw_product_full.count]
      listen:
        department: vw_product_full.department
        max_price: vw_product_full.price
      row: 0
      col: 0
      width: 4
      height: 4

    - title: "Avg price in selection"
      name: avg_price
      model: ecommerce_demo
      explore: vw_product_full
      type: single_value
      fields: [vw_product_full.avg_price]
      listen:
        department: vw_product_full.department
        max_price: vw_product_full.price
      row: 0
      col: 4
      width: 4
      height: 4

    - title: "Avg segment rating"
      name: avg_segment_rating
      model: ecommerce_demo
      explore: vw_product_full
      type: single_value
      fields: [vw_segment_ratings.avg_rating]
      listen:
        department: vw_product_full.department
        skin_type: vw_segment_ratings.reviewer_skin_type
        max_price: vw_product_full.price
      row: 0
      col: 8
      width: 4
      height: 4

    - title: "Top rated products for skin type"
      name: top_products_by_segment
      model: ecommerce_demo
      explore: vw_product_full
      type: table
      fields: [vw_product_full.product_name, vw_product_full.brand_name,
               vw_product_full.price, vw_segment_ratings.avg_rating,
               vw_segment_ratings.total_reviews, vw_segment_ratings.avg_recommendation_rate,
               vw_product_full.skin_type_fit, vw_product_full.key_ingredients]
      sorts: [vw_segment_ratings.avg_rating desc]
      limit: 20
      listen:
        department: vw_product_full.department
        skin_type: vw_segment_ratings.reviewer_skin_type
        max_price: vw_product_full.price
      row: 4
      col: 0
      width: 24
      height: 12

    - title: "Rating by skin type — top products"
      name: rating_by_skin_type
      model: ecommerce_demo
      explore: vw_product_full
      type: looker_column
      fields: [vw_product_full.product_name, vw_segment_ratings.reviewer_skin_type,
               vw_segment_ratings.avg_rating]
      pivots: [vw_segment_ratings.reviewer_skin_type]
      sorts: [vw_segment_ratings.avg_rating desc]
      limit: 10
      listen:
        department: vw_product_full.department
        max_price: vw_product_full.price
      row: 16
      col: 0
      width: 16
      height: 10

    - title: "Products by finish type"
      name: products_by_finish
      model: ecommerce_demo
      explore: vw_product_full
      type: looker_pie
      fields: [vw_product_full.finish_type, vw_product_full.count]
      sorts: [vw_product_full.count desc]
      limit: 8
      listen:
        department: vw_product_full.department
        max_price: vw_product_full.price
      row: 16
      col: 16
      width: 8
      height: 10
