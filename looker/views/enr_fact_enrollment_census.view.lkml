view: fact_enrollment_census {
  sql_table_name: dw_enrollment_census ;;

  dimension: term { type: string sql: ${TABLE}.term ;; }
  dimension: college { type: string sql: ${TABLE}.college ;; }

  measure: headcount { type: sum sql: ${TABLE}.headcount ;; }
  measure: fte { type: sum sql: ${TABLE}.fte ;; }
}
