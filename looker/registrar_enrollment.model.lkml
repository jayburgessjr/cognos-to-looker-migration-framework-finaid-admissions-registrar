connection: "warehouse"

include: "/views/enr_*.view.lkml"
include: "/dashboards/enr_*.dashboard.lkml"

explore: fact_enrollment_census {
  label: "Enrollment Census"
  description: "Official frozen census counts and FTE."
}
