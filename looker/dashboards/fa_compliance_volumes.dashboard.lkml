dashboard: fa_compliance_volumes {
  title: "Financial Aid - Title IV & Pell Volumes"
  layout: newspaper

  element: pell_by_aid_year {
    title: "Pell Paid by Aid Year"
    type: looker_area
    query: {
      explore: fact_fa_awards
      measures: [pell_paid_amount]
      dimensions: [aid_year]
    }
  }
}
