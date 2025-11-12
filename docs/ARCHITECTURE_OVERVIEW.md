# Architecture Overview

Sources:
- Banner-style SIS & financial aid (students, programs, awards, disbursements)
- Admissions CRM or Banner Admissions (inquiries, applications, decisions, enrollments)
- Registrar (enrollment, census, academic standing)

Warehouse:
- `dim_student`, `dim_term`, `dim_college`
- `fact_fa_awards`, `fact_fa_loans`
- `fact_admissions_funnel`
- `fact_enrollment_census`

Looker:
- Domain models for FA, Admissions, Registrar
- Certified KPIs implemented once, reused across dashboards & Explores

Pattern based on the DC university case:
- One trusted set of numbers per domain
- Leaner report portfolio
- Better audit posture
