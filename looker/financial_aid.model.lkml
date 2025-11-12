connection: "warehouse"

include: "/views/fa_*.view.lkml"
include: "/dashboards/fa_*.dashboard.lkml"

explore: fact_fa_awards {
  label: "Financial Aid Awards"
  description: "Pell, grant, and institutional aid based on standardized award logic."
  join: dim_student {
    type: left_outer
    sql_on: ${fact_fa_awards.student_id} = ${dim_student.student_id} ;;
  }
}
