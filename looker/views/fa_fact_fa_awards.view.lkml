view: fact_fa_awards {
  sql_table_name: dw_fa_award ;;

  dimension: student_id { type: string sql: ${TABLE}.student_id ;; }
  dimension: aid_year { type: string sql: ${TABLE}.aid_year ;; }

  measure: pell_paid_amount {
    type: sum
    sql: ${TABLE}.pell_paid_amount ;;
    value_format_name: "usd"
  }

  measure: total_aid_amount {
    type: sum
    sql: ${TABLE}.total_aid_amount ;;
    value_format_name: "usd"
  }
}
