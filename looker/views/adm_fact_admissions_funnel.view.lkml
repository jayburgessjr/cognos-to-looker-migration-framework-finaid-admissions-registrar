view: fact_admissions_funnel {
  sql_table_name: dw_adm_funnel ;;

  dimension: term { type: string sql: ${TABLE}.term ;; }
  dimension: college { type: string sql: ${TABLE}.college ;; }

  measure: inquiry_count { type: sum sql: ${TABLE}.inquiry_count ;; }
  measure: application_count { type: sum sql: ${TABLE}.app_count ;; }
  measure: admit_count { type: sum sql: ${TABLE}.admit_count ;; }
  measure: enrolled_count { type: sum sql: ${TABLE}.enroll_count ;; }

  measure: yield_rate {
    type: number
    sql: 1.0 * ${enrolled_count} / NULLIF(${admit_count},0) ;;
    value_format_name: "percent_1"
  }
}
