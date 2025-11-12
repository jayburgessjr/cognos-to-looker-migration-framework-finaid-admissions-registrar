view: dim_student {
  sql_table_name: dw_student ;;

  dimension: student_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.student_id ;;
  }

  dimension: student_level {
    type: string
    sql: ${TABLE}.student_level ;;
  }

  dimension: college {
    type: string
    sql: ${TABLE}.college ;;
  }
}
