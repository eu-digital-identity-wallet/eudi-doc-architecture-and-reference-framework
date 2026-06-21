#!/usr/bin/env python3
"""Structural checker for hltr/high-level-requirements.csv.

The Annex 2 high-level-requirements pages are generated from this CSV, so a
malformed row (an unescaped delimiter, a stray newline, a missing column) would
silently corrupt the generated markdown. This validates the structure before
that can happen; it does not judge the requirement text.

Structural problems FAIL the build (they break generation):
  * the file parses as semicolon-delimited CSV (UTF-8, BOM tolerated);
  * the header is exactly the expected columns;
  * every data row has exactly that many fields.

Data-quality problems are reported as warnings (they don't corrupt the
structure, and a pre-existing one shouldn't block an unrelated change):
  * the key columns (Harmonized_ID, Index) are non-empty;
  * Harmonized_ID values are unique;
  * Topic_Number is an integer where present.
"""
from __future__ import annotations

import csv
import sys

CSV_PATH = "hltr/high-level-requirements.csv"
DELIM = ";"
EXPECTED = [
    "Harmonized_ID", "Part", "Category", "Topic", "Topic_Number",
    "Topic_Title", "Subsection", "Index", "Requirement_specification", "Notes",
]


def main() -> int:
    errors: list[str] = []
    # utf-8-sig strips the BOM; newline="" lets csv handle quoted newlines.
    with open(CSV_PATH, newline="", encoding="utf-8-sig") as fh:
        rows = list(csv.reader(fh, delimiter=DELIM))

    if not rows:
        print(f"{CSV_PATH}: file is empty"); return 1

    header = rows[0]
    if header != EXPECTED:
        print(f"{CSV_PATH}:1: header mismatch")
        print(f"  expected: {EXPECTED}")
        print(f"  found:    {header}")
        return 1

    ncol = len(EXPECTED)
    idx = {name: i for i, name in enumerate(EXPECTED)}
    seen_ids: dict[str, int] = {}
    warnings: list[str] = []

    for n, row in enumerate(rows[1:], start=2):  # 1-based, header is line 1
        if len(row) != ncol:
            errors.append(f"line {n}: {len(row)} fields, expected {ncol} "
                          f"(likely an unescaped '{DELIM}' or a stray newline)")
            continue
        hid = row[idx["Harmonized_ID"]].strip()
        if not hid:
            warnings.append(f"line {n}: empty Harmonized_ID")
        elif hid in seen_ids:
            warnings.append(f"line {n}: duplicate Harmonized_ID '{hid}' "
                            f"(first seen line {seen_ids[hid]})")
        else:
            seen_ids[hid] = n
        if not row[idx["Index"]].strip():
            warnings.append(f"line {n}: empty Index")
        tn = row[idx["Topic_Number"]].strip()
        if tn and not tn.isdigit():
            warnings.append(f"line {n}: Topic_Number '{tn}' is not an integer")

    if warnings:
        print(f"{CSV_PATH}: {len(warnings)} data-quality warning(s):")
        for w in warnings:
            print(f"  - {w}")
        print()

    if errors:
        print(f"{CSV_PATH}: {len(errors)} structural problem(s):")
        for e in errors:
            print(f"  - {e}")
        print("\nFAIL")
        return 1

    print(f"OK: {len(rows) - 1} rows, {ncol} columns, structurally well-formed.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
