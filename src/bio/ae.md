---
layout: bio
title: Automation Engine
subtitle: An event-based publisher/subscriber solution in C# for dotnet core
---

The Automation Engine consists of three components:

1. An event tracking framework with optional de-personalization for mirroring
   to external analytics services.
2. A modular message publisher that monitors system events for key triggers.
3. A modular subscriber that verifies the validity of the published message,
   and performs an action

Using the Automation Engine we have been able to automate common tasks such as
running expensive database queries to generate mailing lists. It allows us to
be more responsive (minutes instead of days) to changing conditions, and
eliminates hundreds of man hours of tedious data processing.

![Automation Engine data flowchart](../static/img/ae.png)

