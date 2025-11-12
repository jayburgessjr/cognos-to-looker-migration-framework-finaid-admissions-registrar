# Cognos to Looker Migration Playbook (Financial Aid, Admissions, Registrar)

This repository provides a practical migration framework for moving
Financial Aid, Admissions, and Registrar reporting from Cognos to Looker
for a mid-sized public university in Washington, D.C. (case study anonymized
for FERPA, legal, and contractual reasons).

It is modeled on real implementation patterns:
- Banner-style SIS & financial aid tables
- Admissions CRM / application data
- Registrar term, course, and enrollment data

The focus is on:
- Systematic Cognos report inventory and rationalization
- Field-level lineage: Cognos → warehouse → Looker (views, Explores, dashboards)
- Standardized KPI and compliance definitions
- Rebuilding critical operational and compliance reporting in Looker
- Side-by-side metric validation to maintain trust
- FERPA-aware, role-based access for sensitive student and aid data
