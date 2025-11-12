dashboard: adm_funnel_performance {
  title: "Admissions Funnel Performance"
  layout: newspaper

  element: yield_by_college {
    title: "Yield by College"
    type: looker_bar
    query: {
      explore: fact_admissions_funnel
      measures: [yield_rate]
      dimensions: [college]
    }
  }
}
