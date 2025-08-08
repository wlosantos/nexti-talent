# GitHub Actions CI/CD Pipeline

## Overview
This CI/CD pipeline is optimized for Rails 8 applications with multiple database configurations.

## Key Features

### 🚀 Rails 8 Optimizations
- **Multiple Database Support**: Configures primary, cache, queue, and cable databases
- **Solid Stack**: Compatible with Solid Cache, Solid Queue, and Solid Cable
- **Propshaft Assets**: Optimized asset pipeline for Rails 8
- **Ruby 3.4.5**: Latest stable Ruby version

### 🏗️ Pipeline Structure
The pipeline consists of three main jobs:

#### 1. Test Job
- Runs unit and integration tests
- Uses PostgreSQL 16 (latest stable)
- Configures all Rails 8 databases
- Uploads test results as artifacts
- Matrix strategy for Ruby version testing

#### 2. Lint Job
- Security auditing with bundler-audit and brakeman
- Code style checking with RuboCop
- Optimized caching for faster runs

#### 3. System Tests Job
- End-to-end testing with Capybara
- Screenshot capture on failures
- Full database setup for realistic testing

### 🎯 Performance Improvements
- **Advanced Caching**: Multiple cache layers for gems and Node modules
- **Health Checks**: PostgreSQL health checks prevent premature test execution
- **Parallel Execution**: Jobs run in parallel when possible
- **Artifact Management**: Test results and screenshots preserved

### 🔧 Configuration Details

#### Database URLs
```yaml
DATABASE_URL: "postgres://postgres:postgres@localhost:5432/nexti_talent_test"
RAILS_CACHE_DATABASE_URL: "postgres://postgres:postgres@localhost:5432/nexti_talent_test_cache"
RAILS_QUEUE_DATABASE_URL: "postgres://postgres:postgres@localhost:5432/nexti_talent_test_queue"
RAILS_CABLE_DATABASE_URL: "postgres://postgres:postgres@localhost:5432/nexti_talent_test_cable"
```

#### Branch Strategy
- Triggers on pushes to `develop` and `main` branches
- Runs on pull requests to these branches

## Migration from Rails 7
If migrating from a Rails 7 setup, the key changes include:
1. Updated PostgreSQL from v11 to v16
2. Added multiple database configurations
3. Updated GitHub Actions versions (v3 → v4)
4. Enhanced caching strategies
5. Separated system tests for better organization

## Usage
This pipeline automatically runs when:
- Code is pushed to `develop` or `main` branches
- Pull requests are opened against these branches

## Artifacts
- **Test Results**: JUnit XML format for test reporting
- **Screenshots**: Captured on system test failures for debugging
