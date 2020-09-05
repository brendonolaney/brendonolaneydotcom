---
layout: work
title: Invoice Payments Report
subtitle: A rewrite of a report for performance
---

The invoice payments report rewrite was one of the first team projects that I
led as a developer at Clio.

The report is one of the most important for business operations. I had
previously led a project to instrument the reporting system with monitoring,
logging, and telemetry, which led us to identify this report as an
under-performer. We profiled and bench-marked the existing report then built a
prototype report that removed layers of abstraction to give us direct access to
the data that we needed to build the report. We profiled and bench-marked the
prototype to establish that building the full report would be a wise investment
of resources. To establish correctness we created a complete set of inputs and
outputs and built automated tests to enforce them. Once build was complete we
did a final round of performance measurements and the result was a 1000% decrease
in run time for the report.
