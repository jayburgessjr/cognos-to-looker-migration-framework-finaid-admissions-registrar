# Cognos → Looker Migration Method
## Scope: Financial Aid, Admissions, Registrar

This playbook mirrors the approach used for a Washington, D.C. public university
transitioning key operational and compliance reporting from Cognos to Looker across:

- Financial Aid (Title IV, packaging, disbursements, SAP indicators)
- Admissions (inquiry → app → admit → enroll funnel)
- Registrar (enrollment, census, program-of-study, academic standing)

### 1. Inventory & Rationalize Cognos Reports

1. Export Cognos report catalog to `inputs/cognos_report_catalog.csv`.
2. Tag each report by domain and criticality:
   - **Critical**: audit/compliance (Pell, Direct Loans, R2T4),
     census, official enrollment, NSLDS alignment, admit/enroll funnel.
   - **Important**: operational dashboards for FA counselors, admissions teams, registrar.
   - **Legacy/Noise**: unused, duplicated, owner departed.
3. Focus migration on:
   - Official numbers
   - High-usage operational reports
   - Reports that unblock daily decisions.

### 2. Extract Cognos Fields

Use `utils/parse_cognos_xml.py` and `mapping/02_extract_cognos_fields.ipynb` to parse XML:

Capture for each report:
- `report_id`
- `field_name`
- `expression`
- `source_table` (where identifiable)

This exposes how legacy logic built KPIs like:
- Pell-eligible population
- COA/EFA, unmet need
- Admit/enroll funnel counts
- Official census snapshots

### 3. Map Lineage: Cognos → Warehouse → Looker

Using `inputs/field_mapping_template.csv` and `mapping/03_field_lineage_mapping.ipynb`:

For each field:
- Map to curated warehouse tables, e.g.:
  - `dw_fa_award`, `dw_fa_isir`, `dw_fa_disbursement`
  - `dw_adm_applicant`, `dw_adm_application`, `dw_adm_decision`
  - `dw_enrollment_term`, `dw_program_of_study`
- Map to Looker views/fields:
  - `fact_fa_awards.pell_paid_amount`
  - `fact_admissions_funnel.enrolled_count`
  - `fact_enrollment_census.headcount`

Unmapped or ambiguous fields are explicitly flagged for SME review;
no silent reinterpretation of regulatory logic.

### 4. Standardize KPIs & Compliance Metrics

Define once in `inputs/kpi_definitions_template.csv`, then encode in LookML:

Examples:

**Financial Aid**
- Pell recipients & paid amounts
- Subsidized/Unsubsidized/PLUS loan volumes
- COA, EFC/SAI, EFA, unmet need
- Packaging completion rates
- Disbursement timing vs term start
- SAP status distributions

**Admissions**
- Inquiry → Application → Admit → Enroll funnel
- Admit rate, yield rate
- App completion rate by segment
- Decision SLAs

**Registrar**
- Official census headcount & FTE
- Enrollment by level, program, modality
- Academic standing distributions
- Program-of-study compliance (for aid linkage)
- Freeze vs current views

Each KPI is:
- Tied to specific tables/columns
- Documented for IR/FA/Registrar sign-off

### 5. Rebuild in Looker

Using `/looker`:

- Create *subject-area* models:
  - `financial_aid.model.lkml`
  - `admissions.model.lkml`
  - `registrar_enrollment.model.lkml`
- Build Explores:
  - `fa_packaging_explore`
  - `fa_compliance_explore`
  - `admissions_funnel_explore`
  - `enrollment_census_explore`
- Rebuild critical Cognos outputs as:
  - Certified dashboards (e.g., Official Census, Title IV volumes, Funnel performance)
  - Self-service Explores with governed filters.

### 6. Validate Metrics (Cognos vs Looker)

Using `/validation/01_metric_side_by_side_validation.ipynb`:

- Export Cognos results for:
  - Pell totals, loan totals, census headcount/FTE, funnel counts.
- Export equivalent Looker queries.
- Compare at:
  - Aggregate (institution)
  - Key slices (college, program, aid year)
- Log differences; adjust mappings or KPI logic until within tolerance.

No shutdown of Cognos reports until:
- Numbers reconcile
- Owners sign off
- Replacement assets are communicated.

### 7. Governance & FERPA Alignment

- Implement RLS/CLS in both warehouse and Looker.
- Restrict SSNs, ISIR details, and personally identifiable FA data.
- Admissions and Registrar views restricted by role.
- Usage aligns with existing policies; migration does not widen exposure.

The DC implementation this playbook is based on:
- Reduced redundant reports
- Centralized regulated logic
- Gave FA/Admissions/Registrar clean, governed Looker surfaces
without losing any compliance or audit confidence.
