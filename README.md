# IntuneRBAC Auditor

> Automated Intune RBAC posture auditor that finds over-privileged accounts, unscoped custom roles, and orphaned scope tags before they cause a costly device wipe incident.

## Overview

A PowerShell module that connects to Microsoft Graph API and audits your entire Intune RBAC configuration, producing a scored risk report identifying accounts with excess permissions, custom roles missing proper scope tag assignments, and dynamic group conflicts that could expose devices to the wrong helpdesk teams. The report exports to HTML and CSV, giving IT admins and auditors a clear remediation checklist they can act on immediately.

## Problem This Solves

Organizations running Intune at scale have no automated way to detect RBAC drift — over-privileged accounts accumulate silently, scope tags become decorative, and the first sign of a problem is a catastrophic event like a VP's laptop being remotely wiped by the wrong helpdesk tech

## Target Audience

IT admins and consultants managing Intune environments with 500+ devices across multiple business units, helpdesk teams, or organizational boundaries

## Tech Stack

PowerShell, Microsoft Graph API, HTML/CSS

## Installation

```powershell
# Clone the repository
git clone https://github.com/intune-rbac-auditor.git
cd intune-rbac-auditor

# Review the script before running
Get-Content scripts/intune-rbac-auditor.ps1

# Run with appropriate permissions
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
.\scripts\{intune-rbac-auditor}.ps1
```

## Usage

Connect to Microsoft Graph API and audit all Intune RBAC role assignments, scope tag bindings, and custom role definitions to produce a prioritized HTML risk report identifying over-privileged accounts, unscoped roles, and dynamic group conflicts that violate least-privilege principles.

## Monetization Strategy

Tiered Gumroad product: free lite version (basic account permission report, up to 50 users) to drive leads; Pro version at $79 one-time for full audit including scope tag enforcement validation, dynamic group conflict detection, and HTML risk dashboard; optional $149/yr license for quarterly update access and new check additions as Intune evolves

| Metric | Value |
|--------|-------|
| Revenue Potential | HIGH |
| Estimated Effort  | 1-3months |

## Contributing

1. Fork this repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'feat: add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

MIT License — see [LICENSE](LICENSE) for details.

---

*Generated from the article: [Intune RBAC Deep Dive: Real-World Role Design at Scale](https://msendpoint.com/articles/intune-rbac-deep-dive-real-world-role-design-at-scale) on 2026-03-28*
*Blog: [MSEndpoint.com](https://msendpoint.com)*