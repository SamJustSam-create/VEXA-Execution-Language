# Security Policy

## Supported Versions

All versions of VEXA Execution Language (VEL) are currently supported with security updates.

| Version | Supported          |
| ------- | ------------------ |
| All     | :white_check_mark: |

## Reporting a Vulnerability

We take the security of VEXA Execution Language seriously. If you discover a security vulnerability, please report it responsibly.

### How to Report

**Please use GitHub Security Advisories for private vulnerability reporting:**

[Report a vulnerability privately](https://github.com/SamJustSam-create/VEXA-Execution-Language/security/advisories/new)

### Required Information

When reporting a vulnerability, please include:

- **Detailed description** of the vulnerability
- **Reproduction steps** with clear instructions
- **Proof of concept** (if applicable) - code samples or scripts demonstrating the issue
- **Impact assessment** - what could an attacker do with this vulnerability?
- **Affected versions** - which versions of VEL are impacted?
- Any **suggested fixes** or mitigations you've identified

### What to Expect

- **Acknowledgment**: We will acknowledge receipt of your report within **48-72 hours**
- **Initial Assessment**: We will provide an initial assessment of the issue within **5 business days**
- **Updates**: We will keep you informed of our progress throughout the investigation
- **Resolution**: We will work to address confirmed vulnerabilities as quickly as possible

### Disclosure Policy

We follow a **coordinated disclosure** approach:

1. **Private Discussion**: We will work with you privately to understand and address the issue
2. **Fix Development**: We will develop and test a fix
3. **Release**: We will release a patched version
4. **Public Disclosure**: After a fix is available, we will publicly disclose the vulnerability (typically **90 days** after initial report or when a fix is released, whichever comes first)

We appreciate your efforts to responsibly disclose your findings and will make every effort to acknowledge your contributions.

## Security Best Practices for Users

When using VEXA Execution Language:

- Always use the latest version available
- Validate and sanitize all user-provided VEL scripts before execution
- Implement appropriate resource limits (execution time, memory, operation count)
- Run VEL scripts in a sandboxed environment when executing untrusted code
- Do not execute VEL scripts from untrusted sources without thorough review

## Out of Scope

The following are generally considered out of scope:

- Vulnerabilities in third-party dependencies (please report those to the respective projects)
- Social engineering attacks
- Physical attacks
- Denial of service through legitimate resource-intensive scripts (though we appreciate reports of algorithmic complexity issues)

Thank you for helping keep VEXA Execution Language and its users safe!
