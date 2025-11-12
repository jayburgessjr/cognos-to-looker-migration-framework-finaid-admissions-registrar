dashboard: enr_census_overview {
  title: "Official Census Overview"
  layout: newspaper

  element: headcount_by_college {
    title: "Headcount by College"
    type: looker_bar
    query: {
      explore: fact_enrollment_census
      measures: [headcount]
      dimensions: [college]
    }
  }

  element: fte_trend {
    title: "FTE Trend"
    type: looker_line
    query: {
      explore: fact_enrollment_census
      measures: [fte]
      dimensions: [term]
    }
  }
}
