# CONTRIBUTING.md

Thank you for contributing to the **Architecture & Reference Framework (ARF)**.
This guide explains how to file issues, propose changes, and help maintain a
clear, legally-sound, and implementable specification suite.

## 1) Purpose & scope

- This repository contains **informative** guidance that **supports** the
legally binding **Implementing Regulations**.  
- **High-Level Requirements (HLRs)** live in Annex 2 (CSV is the source of
truth) and include back-references to the relevant legal bases.
- Contributions should **improve clarity, traceability, implementability, and
interoperability** without altering the scope of the Implementing Acts.

> Use RFC 2119/8174 keywords (**MUST/SHALL/SHOULD/MAY**) only when you are
quoting or precisely tracking normative text from the Regulations or
Implementing Regulations. Otherwise, use plain language.

## 2) Code of conduct

We expect respectful, constructive discussion. Disagreement is normal; personal
remarks are not. Be concise, stay on topic, and provide concrete proposals
(diffs, examples, references).

## 3) How to contribute

### 3.1 Open an issue

- Use the issue templates where possible (bug, enhancement, question, editorial).
- Provide context: affected section(s), concrete problem statements, and-if
applicable-security or privacy impacts.
- Link to prior discussions or related specs (ETSI, CEN, OIDF, ISO, IETF, W3C,
eIDAS guidance, etc.).
- Describe the issue in detail, including relevant context, background, expected
outcome, and (if applicable) a proposed fix.
- Label your issue with one or more of the labels below to aid triage and prioritization.
- Avoid duplicates: search existing issues before opening a new one.

| Label                         | Description                                                                                                      |
|------------------------------|------------------------------------------------------------------------------------------------------------------|
| Content Clarifications       | Questions about specific passages; requests to explain or disambiguate content.                                 |
| Suggestions for Improvements | Proposals to enhance clarity, completeness, accuracy, or structure.                                             |
| Errors and Corrections       | Typos, grammar, broken links, factual inaccuracies—include the source if you have one.                          |
| Compatibility & Integration  | Interoperability with other systems/standards; implementation considerations; cross-doc alignment.              |
| Enhancement Requests         | Requests for new sections, figures, examples, or supporting materials.                                          |
| Formatting & Styling         | Layout, headings hierarchy, tables, diagrams, and consistency issues.                                            |
| Documentation Standards      | Conventions, glossary alignment, normative language (RFC 2119), or citation style.                              |
| Licence & Legal Concerns     | Questions about licensing, attribution, reuse rights, or legal clarity.                                          |
| Technical Clarification      | Deep technical questions; requests for more precise requirements or references to standards/specifications.      |

### 3.2 Submit a pull request (PR)

- Keep PRs **small and focused**; large PRs should be split by topic.
- Include a **clear problem statement**, rationale, and a **before/after diff**
in the description.
- If the change affects HLRs/Annex 2, update the **CSV** and provide
traceability notes.
- Add/update diagrams and tables as needed; include sources for figures.
- Update the **Change Log** when the change is externally visible.

## 4) Versioning & change log

- The main document keeps a **concise changelog**. Larger editorial details
remain in PR history.
- Use **semver-like tags** for document sets when helpful (e.g., `vX.Y`), noting
that legal texts remain the sole normative reference.

## 5) Style guide (editorial)

- **Headings:** Sentence case for prose; Title Case for defined terms (e.g.,
*Wallet Unit*, *User*).
- **Acronyms:** Expand on first use (*Person Identification Data (PID)*,
*Qualified Electronic Attestation of Attributes (QEAA)*, *Public EAA (PuB-EAA)*,
*WSCA/WSCD*), then use consistently.
- **Terminology:** Lowercase generic nouns unless they are **defined terms**.
- **Numbered lists:** Prefer short lists; use tables for checklists and matrices.
- **Figures:** Provide a short caption and a source. Optimize diagrams for
legibility and accessibility.
- **Tables:** Add header rows; keep lines under ~100 characters where feasible.
- **Links & citations:** Use stable identifiers (OJ, RFCs, ETSI TS/EN numbers).

## 6) Document conventions (traceability)

- Each requirement/statement that **depends** on an Implementing Regulation
should include a **reference** (article, paragraph) where applicable.
- HLRs in **Annex 2 (CSV)** are the **single source of truth** for requirement
indexing and cross-references.
- Where security assurance is discussed (e.g., WSCD), reference the **common
risk register** rather than duplicating threat lists across chapters.

## 7) Accessibility

When proposing UI/flow text or diagrams, ensure they can be tested against
**WCAG** and **WAI-ARIA** guidance (informative). Provide text alternatives for
images and meaningful labels in examples.

## 8) Licensing & IPR

- All contributions are subject to the repository **LICENSE**. By contributing,
you confirm you have the right to do so under that license.
- Avoid embedding third-party content unless its license is compatible and
clearly attributed.

## 9) Checklists

### PR checklist (quick)

- [ ] Problem statement and scope
- [ ] Legal references and traceability updated
- [ ] Annex 2 CSV updated (if applicable)
- [ ] Figures/tables updated (if applicable)
- [ ] Changelog entry added (if externally visible)
- [ ] Self-review for clarity, testability, and interoperability

## 10) Contact

If you have questions about scope or process, open an issue with label
`question` or contact the editors listed in the repository.

Thanks again for helping make the ARF clearer and more useful.
