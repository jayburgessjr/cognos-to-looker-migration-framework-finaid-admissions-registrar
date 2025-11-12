# FAQ for Stakeholders

**Is this modeled on real work?**
Yes. This structure is modeled on a real Cognos → Looker migration for a
mid-sized D.C. university, generalized and anonymized.

**Will compliance reporting still match?**
All critical FA, Admissions, and Registrar metrics are validated
side-by-side vs existing Cognos outputs before cutover.

**Who owns definitions?**
Financial Aid, Admissions, Registrar, and IR own definitions; this framework
enforces and documents them in one semantic layer.

**How is sensitive data handled?**
Sensitive identifiers and FA details stay tightly controlled via RLS/CLS.
Looker becomes more auditable than legacy sprawl.
