- dashboard: review_intelligence
  title: "Review Intelligence"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Rating distribution by skin type, skin tone, and age group. Surfaces who a product works for versus who it underserves."

  filters:
    - name: department
      title: "Department"
      type: field_filter
      explore: vw_segment_ratings
      field: vw_product_full.department
      ui_config:
        type: button_toggles
        display: inline
      default_value: "Makeup"

    - name: brand
      title: "Brand"
      type: field_filter
      explore: vw_segment_ratings
      field: vw_segment_ratings.brand_name
      ui_config:
        type: dropdown_menu
        display: inline

  elements:
    - title: "Total reviews in selection"
      name: total_reviews
      model: sephora_demo
      explore: vw_segment_ratings
      type: single_value
      fields: [vw_segment_ratings.total_reviews]
      listen:
        department: vw_segment_ratings.department
        brand: vw_segment_ratings.brand_name
      row: 0
      col: 0
      width: 6
      height: 4

    - title: "Overall avg rating"
      name: overall_rating
      model: sephora_demo
      explore: vw_segment_ratings
      type: single_value
      fields: [vw_segment_ratings.avg_rating]
      listen:
        department: vw_segment_ratings.department
        brand: vw_segment_ratings.brand_name
      row: 0
      col: 6
      width: 6
      height: 4

    - title: "Avg recommendation rate"
      name: recommendation_rate
      model: sephora_demo
      explore: vw_segment_ratings
      type: single_value
      fields: [vw_segment_ratings.avg_recommendation_rate]
      listen:
        department: vw_segment_ratings.department
        brand: vw_segment_ratings.brand_name
      row: 0
      col: 12
      width: 6
      height: 4

    - title: "Avg helpfulness score"
      name: helpfulness
      model: sephora_demo
      explore: vw_segment_ratings
      type: single_value
      fields: [vw_segment_ratings.avg_helpfulness]
      listen:
        department: vw_segment_ratings.department
        brand: vw_segment_ratings.brand_name
      row: 0
      col: 18
      width: 6
      height: 4

    - title: "Avg rating by skin type"
      name: rating_by_skin_type
      model: sephora_demo
      explore: vw_segment_ratings
      type: looker_column
      fields: [vw_segment_ratings.reviewer_skin_type, vw_segment_ratings.avg_rating,
               vw_segment_ratings.total_reviews]
      sorts: [vw_segment_ratings.avg_rating desc]
      limit: 10
      listen:
        department: vw_segment_ratings.department
        brand: vw_segment_ratings.brand_name
      row: 4
      col: 0
      width: 12
      height: 8

    - title: "Avg rating by skin tone"
      name: rating_by_skin_tone
      model: sephora_demo
      explore: vw_segment_ratings
      type: looker_column
      fields: [vw_segment_ratings.reviewer_skin_tone, vw_segment_ratings.avg_rating,
               vw_segment_ratings.total_reviews]
      sorts: [vw_segment_ratings.avg_rating desc]
      limit: 10
      listen:
        department: vw_segment_ratings.department
        brand: vw_segment_ratings.brand_name
      row: 4
      col: 12
      width: 12
      height: 8

    - title: "Avg rating by age group"
      name: rating_by_age
      model: sephora_demo
      explore: vw_segment_ratings
      type: looker_column
      fields: [vw_segment_ratings.reviewer_age_group, vw_segment_ratings.avg_rating,
               vw_segment_ratings.total_reviews]
      sorts: [vw_segment_ratings.reviewer_age_group]
      limit: 10
      listen:
        department: vw_segment_ratings.department
        brand: vw_segment_ratings.brand_name
      row: 12
      col: 0
      width: 12
      height: 8

    - title: "Skin tone × skin type rating heatmap"
      name: tone_type_heatmap
      model: sephora_demo
      explore: vw_segment_ratings
      type: table
      fields: [vw_segment_ratings.reviewer_skin_type, vw_segment_ratings.reviewer_skin_tone,
               vw_segment_ratings.avg_rating, vw_segment_ratings.total_reviews]
      pivots: [vw_segment_ratings.reviewer_skin_tone]
      sorts: [vw_segment_ratings.reviewer_skin_type]
      limit: 10
      listen:
        department: vw_segment_ratings.department
        brand: vw_segment_ratings.brand_name
      row: 12
      col: 12
      width: 12
      height: 8

    - title: "Products with highest skin-type rating variance"
      name: segment_variance
      model: sephora_demo
      explore: vw_segment_ratings
      type: table
      fields: [vw_segment_ratings.product_name, vw_segment_ratings.brand_name,
               vw_segment_ratings.reviewer_skin_type, vw_segment_ratings.avg_rating,
               vw_segment_ratings.total_reviews, vw_segment_ratings.avg_recommendation_rate]
      sorts: [vw_segment_ratings.avg_rating desc]
      limit: 30
      listen:
        department: vw_segment_ratings.department
        brand: vw_segment_ratings.brand_name
      row: 20
      col: 0
      width: 24
      height: 10
