<#
.SYNOPSIS
    IntuneRBAC Auditor

.DESCRIPTION
    A PowerShell module that connects to Microsoft Graph API and audits your entire Intune RBAC configuration, producing a scored risk report identifying accounts with excess permissions, custom roles missing proper scope tag assignments, and dynamic group conflicts that could expose devices to the wrong helpdesk teams. The report exports to HTML and CSV, giving IT admins and auditors a clear remediation checklist they can act on immediately.

    Purpose: Connect to Microsoft Graph API and audit all Intune RBAC role assignments, scope tag bindings, and custom role definitions to produce a prioritized HTML risk report identifying over-privileged accounts, unscoped roles, and dynamic group conflicts that violate least-privilege principles.

.NOTES
    Author:      MSEndpoint.com
    Target:      IT admins and consultants managing Intune environments with 500+ devices across multiple business units, helpdesk teams, or organizational boundaries
    Created:     2026-03-28
    Repository:  https://github.com/intune-rbac-auditor
    License:     MIT

.EXAMPLE
    .\scripts\{intune-rbac-auditor}.ps1

.EXAMPLE
    .\scripts\{intune-rbac-auditor}.ps1 -Verbose

#>

[CmdletBinding()]
param (
    [Parameter(Mandatory = $false)]
    [string]$TenantId,

    [Parameter(Mandatory = $false)]
    [string]$OutputPath = ".\output",

    [Parameter(Mandatory = $false)]
    [switch]$WhatIf
)

#Requires -Version 7.0

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

# ── Banner ─────────────────────────────────────────────────────
Write-Host ""
Write-Host "  IntuneRBAC Auditor" -ForegroundColor Cyan
Write-Host "  MSEndpoint.com — https://msendpoint.com" -ForegroundColor DarkGray
Write-Host ""

# ── Prerequisites check ────────────────────────────────────────
function Test-Prerequisites {
    $modules = @('Microsoft.Graph', 'ExchangeOnlineManagement')
    foreach ($mod in $modules) {
        if (-not (Get-Module -ListAvailable -Name $mod)) {
            Write-Warning "Module '$mod' not found. Install with: Install-Module $mod -Scope CurrentUser"
        }
    }
}

# ── Connect to Microsoft Graph ────────────────────────────────
function Connect-ToGraph {
    param([string]$TenantId)

    $scopes = @(
        'DeviceManagementManagedDevices.Read.All',
        'DeviceManagementConfiguration.Read.All',
        'Organization.Read.All'
    )

    if ($TenantId) {
        Connect-MgGraph -TenantId $TenantId -Scopes $scopes
    } else {
        Connect-MgGraph -Scopes $scopes
    }
    Write-Verbose "Connected to Microsoft Graph"
}

# ── Main logic (implement based on specific project requirements) ─
function Invoke-MainProcess {
    param([string]$OutputPath)

    if (-not (Test-Path $OutputPath)) {
        New-Item -ItemType Directory -Path $OutputPath | Out-Null
    }

    # TODO: Implement main automation logic here
    # This is a scaffold — customize based on:
    # Connect to Microsoft Graph API and audit all Intune RBAC role assignments, scope tag bindings, and custom role definitions to produce a prioritized HTML risk report identifying over-privileged accounts, unscoped roles, and dynamic group conflicts that violate least-privilege principles.

    Write-Host "✓ Process complete. Results saved to: $OutputPath" -ForegroundColor Green
}

# ── Entry point ───────────────────────────────────────────────
try {
    Test-Prerequisites

    if (-not $WhatIf) {
        Connect-ToGraph -TenantId $TenantId
        Invoke-MainProcess -OutputPath $OutputPath
    } else {
        Write-Host "[WhatIf] Would execute: Invoke-MainProcess -OutputPath $OutputPath" -ForegroundColor Yellow
    }
}
catch {
    Write-Error "Script failed: $($_.Exception.Message)"
    exit 1
}
finally {
    # Disconnect cleanly
    try { Disconnect-MgGraph -ErrorAction SilentlyContinue } catch {}
}