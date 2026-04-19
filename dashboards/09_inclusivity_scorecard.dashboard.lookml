- dashboard: inclusivity_scorecard
  title: "Inclusivity Scorecard"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Shade range coverage vs actual customer satisfaction by skin tone. Classifies brands as Inclusive, Performance gap, Coverage gap, or Compound gap."

  filters:
    - name: brand_tier
      title: "Brand Tier"
      type: field_filter
      explore: vw_inclusivity_scorecard
      field: vw_inclusivity_scorecard.brand_tier
      ui_config:
        type: button_toggles
        display: inline

    - name: classification
      title: "Classification"
      type: field_filter
      explore: vw_inclusivity_scorecard
      field: vw_inclusivity_scorecard.inclusivity_classification
      ui_config:
        type: checkboxes
        display: inline

  elements:
    - title: "Brands analysed"
      name: brand_count
      model: ecommerce_demo
      explore: vw_inclusivity_scorecard
      type: single_value
      fields: [vw_inclusivity_scorecard.brand_count]
      listen:
        brand_tier: vw_inclusivity_scorecard.brand_tier
        classification: vw_inclusivity_scorecard.inclusivity_classification
      row: 0
      col: 0
      width: 6
      height: 4

    - title: "Avg rating gap across tones"
      name: avg_gap
      model: ecommerce_demo
      explore: vw_inclusivity_scorecard
      type: single_value
      fields: [vw_inclusivity_scorecard.avg_rating_gap]
      listen:
        brand_tier: vw_inclusivity_scorecard.brand_tier
        classification: vw_inclusivity_scorecard.inclusivity_classification
      row: 0
      col: 6
      width: 6
      height: 4

    - title: "Avg shade range"
      name: avg_shade
      model: ecommerce_demo
      explore: vw_inclusivity_scorecard
      type: single_value
      fields: [vw_inclusivity_scorecard.avg_rating]
      listen:
        brand_tier: vw_inclusivity_scorecard.brand_tier
        classification: vw_inclusivity_scorecard.inclusivity_classification
      row: 0
      col: 12
      width: 6
      height: 4

    - title: "Classifications breakdown"
      name: class_breakdown
      model: ecommerce_demo
      explore: vw_inclusivity_scorecard
      type: looker_pie
      fields: [vw_inclusivity_scorecard.inclusivity_classification,
               vw_inclusivity_scorecard.brand_count]
      sorts: [vw_inclusivity_scorecard.brand_count desc]
      limit: 10
      listen:
        brand_tier: vw_inclusivity_scorecard.brand_tier
      row: 0
      col: 18
      width: 6
      height: 4

    - title: "Brand inclusivity scorecard"
      name: full_scorecard
      model: ecommerce_demo
      explore: vw_inclusivity_scorecard
      type: table
      fields: [vw_inclusivity_scorecard.brand_name, vw_inclusivity_scorecard.brand_tier,
               vw_inclusivity_scorecard.reviewer_skin_tone, vw_inclusivity_scorecard.avg_shade_range,
               vw_inclusivity_scorecard.avg_rating, vw_inclusivity_scorecard.avg_recommendation_rate,
               vw_inclusivity_scorecard.rating_gap_across_tones,
               vw_inclusivity_scorecard.inclusivity_classification_html,
               vw_inclusivity_scorecard.review_count]
      sorts: [vw_inclusivity_scorecard.rating_gap_across_tones desc,
              vw_inclusivity_scorecard.brand_name]
      limit: 100
      listen:
        brand_tier: vw_inclusivity_scorecard.brand_tier
        classification: vw_inclusivity_scorecard.inclusivity_classification
      row: 4
      col: 0
      width: 24
      height: 14

    - title: "Rating by skin tone per brand"
      name: tone_by_brand
      model: ecommerce_demo
      explore: vw_inclusivity_scorecard
      type: looker_column
      fields: [vw_inclusivity_scorecard.brand_name, vw_inclusivity_scorecard.reviewer_skin_tone,
               vw_inclusivity_scorecard.avg_rating]
      pivots: [vw_inclusivity_scorecard.reviewer_skin_tone]
      sorts: [vw_inclusivity_scorecard.rating_gap_across_tones desc]
      limit: 20
      listen:
        brand_tier: vw_inclusivity_scorecard.brand_tier
        classification: vw_inclusivity_scorecard.inclusivity_classification
      note_state: expanded
      note_display: below
      note_text: "A gap > 0.4 stars between the highest and lowest tone is flagged as a Performance or Compound gap."
      row: 18
      col: 0
      width: 24
      height: 10

    - title: "Shade range vs rating gap (bubble = review count)"
      name: shade_vs_gap
      model: ecommerce_demo
      explore: vw_inclusivity_scorecard
      type: looker_scatter
      fields: [vw_inclusivity_scorecard.brand_name, vw_inclusivity_scorecard.avg_shade_range,
               vw_inclusivity_scorecard.avg_rating_gap, vw_inclusivity_scorecard.review_count]
      sorts: [vw_inclusivity_scorecard.avg_rating_gap desc]
      limit: 30
      listen:
        brand_tier: vw_inclusivity_scorecard.brand_tier
        classification: vw_inclusivity_scorecard.inclusivity_classification
      note_state: expanded
      note_display: below
      note_text: "Top-left (high shade range, high gap) = Performance gap. Bottom-left (low range, low gap) = Coverage gap."
      row: 28
      col: 0
      width: 24
      height: 10
