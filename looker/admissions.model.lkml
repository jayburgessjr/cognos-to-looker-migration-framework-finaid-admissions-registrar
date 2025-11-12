connection: "warehouse"

include: "/views/adm_*.view.lkml"
include: "/dashboards/adm_*.dashboard.lkml"

explore: fact_admissions_funnel {
  label: "Admissions Funnel"
  description: "End-to-end funnel from inquiry to enrolled."
}
