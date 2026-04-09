- dashboard: schema_impact
  title: "Schema Impact & Lineage"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Column lineage from raw tables through dbt models to dashboards. Use this to assess the downstream impact of any schema change before it happens."

  filters:
    - name: source_table
      title: "Source Table / Model"
      type: field_filter
      explore: schema_impact
      field: vw_schema_impact.source_table
      ui_config:
        type: advanced
        display: inline

    - name: source_column
      title: "Source Column"
      type: field_filter
      explore: schema_impact
      field: vw_schema_impact.source_column
      ui_config:
        type: advanced
        display: inline

    - name: severity
      title: "Impact Severity"
      type: field_filter
      explore: schema_impact
      field: vw_schema_impact.impact_severity
      ui_config:
        type: checkboxes
        display: inline

  elements:
    - title: "Affected objects"
      name: affected_objects
      model: sephora_demo
      explore: schema_impact
      type: single_value
      fields: [vw_schema_impact.affected_objects]
      listen:
        source_table: vw_schema_impact.source_table
        source_column: vw_schema_impact.source_column
        severity: vw_schema_impact.impact_severity
      row: 0
      col: 0
      width: 6
      height: 4

    - title: "Critical objects"
      name: critical_objects
      model: sephora_demo
      explore: schema_impact
      type: single_value
      fields: [vw_schema_impact.critical_objects]
      listen:
        source_table: vw_schema_impact.source_table
        source_column: vw_schema_impact.source_column
      row: 0
      col: 6
      width: 6
      height: 4

    - title: "Lineage edges"
      name: edge_count
      model: sephora_demo
      explore: schema_impact
      type: single_value
      fields: [vw_schema_impact.lineage_edge_count]
      listen:
        source_table: vw_schema_impact.source_table
        source_column: vw_schema_impact.source_column
        severity: vw_schema_impact.impact_severity
      row: 0
      col: 12
      width: 6
      height: 4

    - title: "Analyst queries on source"
      name: analyst_queries
      model: sephora_demo
      explore: schema_impact
      type: single_value
      fields: [vw_schema_impact.analyst_queries_on_source]
      listen:
        source_table: vw_schema_impact.source_table
        source_column: vw_schema_impact.source_column
      row: 0
      col: 18
      width: 6
      height: 4

    - title: "Full impact trace"
      name: impact_table
      model: sephora_demo
      explore: schema_impact
      type: table
      fields: [vw_schema_impact.source_table, vw_schema_impact.source_column,
               vw_schema_impact.target_table, vw_schema_impact.target_column,
               vw_schema_impact.transformation, vw_schema_impact.target_schema,
               vw_schema_impact.target_owner, vw_schema_impact.target_dashboard_name,
               vw_schema_impact.impact_severity_html, vw_schema_impact.analyst_queries_on_source]
      sorts: [vw_schema_impact.impact_severity_rank]
      limit: 200
      listen:
        source_table: vw_schema_impact.source_table
        source_column: vw_schema_impact.source_column
        severity: vw_schema_impact.impact_severity
      row: 4
      col: 0
      width: 24
      height: 14

    - title: "Affected objects by severity"
      name: severity_breakdown
      model: sephora_demo
      explore: schema_impact
      type: looker_pie
      fields: [vw_schema_impact.impact_severity, vw_schema_impact.affected_objects]
      sorts: [vw_schema_impact.affected_objects desc]
      limit: 5
      listen:
        source_table: vw_schema_impact.source_table
        source_column: vw_schema_impact.source_column
      row: 18
      col: 0
      width: 8
      height: 8

    - title: "Most queried source tables"
      name: most_queried
      model: sephora_demo
      explore: schema_impact
      type: looker_bar
      fields: [vw_schema_impact.source_table, vw_schema_impact.analyst_queries_on_source]
      sorts: [vw_schema_impact.analyst_queries_on_source desc]
      limit: 15
      row: 18
      col: 8
      width: 16
      height: 8

    - title: "Lineage depth — source → target layers"
      name: lineage_by_schema
      model: sephora_demo
      explore: schema_impact
      type: looker_column
      fields: [vw_schema_impact.source_schema, vw_schema_impact.target_schema,
               vw_schema_impact.lineage_edge_count]
      pivots: [vw_schema_impact.target_schema]
      sorts: [vw_schema_impact.lineage_edge_count desc]
      limit: 20
      listen:
        source_table: vw_schema_impact.source_table
      row: 26
      col: 0
      width: 24
      height: 8
