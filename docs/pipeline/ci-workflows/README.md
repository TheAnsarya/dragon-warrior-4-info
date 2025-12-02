# CI/CD Workflow Documentation

This document describes the GitHub Actions workflows planned for this project. These are currently **disabled** until the project reaches a stable state.

## Workflow Status

| Workflow | Status | File |
|----------|--------|------|
| CI Pipeline | ❌ Disabled | `ci.yml.disabled` |

## Planned Workflows

### 1. CI Pipeline (`ci.yml`)

The main continuous integration pipeline that runs on every push and pull request.

#### Jobs

##### `test` Job
- **Runner**: `windows-latest`
- **Purpose**: Run Python test suite
- **Steps**:
  1. Checkout repository
  2. Set up Python 3.11
  3. Install dependencies from `requirements.txt`
  4. Run pytest on `tests/` directory
  5. Check code formatting (non-blocking)

##### `lint` Job
- **Runner**: `ubuntu-latest`
- **Purpose**: Lint Python code for syntax errors and style
- **Steps**:
  1. Checkout repository
  2. Set up Python 3.11
  3. Install flake8
  4. Run flake8 with error checks (E9, F63, F7, F82)
  5. Run flake8 complexity analysis (non-blocking)

##### `build` Job
- **Runner**: `windows-latest`
- **Depends on**: `test` job
- **Purpose**: Verify build system and source files
- **Steps**:
  1. Checkout repository
  2. Verify Ophis assembler exists
  3. Check that all required source files exist

#### Triggers
- Push to `main` branch
- Pull requests targeting `main` branch

### 2. Future Workflows (Planned)

#### Release Pipeline (`release.yml`)
- Automatically create releases when tags are pushed
- Build ROM from source
- Generate IPS/BPS patches
- Upload artifacts to release

#### Asset Extraction (`extract.yml`)
- Manual trigger workflow
- Extract all assets from reference ROM
- Validate extracted data against schemas
- Generate asset reports

#### Documentation (`docs.yml`)
- Build documentation site
- Deploy to GitHub Pages
- Generate API documentation for Python tools

## Enabling Workflows

To enable a disabled workflow:

```powershell
# Rename the file to remove .disabled extension
Move-Item ".github/workflows/ci.yml.disabled" ".github/workflows/ci.yml"
```

## Prerequisites

Before enabling workflows, ensure:

1. All Python dependencies are listed in `requirements.txt`
2. Test suite is complete and passing locally
3. Source files compile without errors
4. Ophis assembler is properly configured

## Environment Variables

No secrets or environment variables are currently required. Future workflows may need:

- `GITHUB_TOKEN` (automatic) - For release creation
- Custom secrets for deployment targets

---

*Last updated: 2025-12-01*
