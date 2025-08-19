# Testing Procedures

*Last Updated: July 24, 2025*  
*Status: Current - Enhanced with Automated Testing*  
*Version: v1.4.0*  
*Previous Version Archived: /docs/04-archive/document-updates-2025-07-24/TESTING_PROCEDURES_original_2025-07-24.md*

*This document contains testing procedures and validation guides for InvestorPrez.*

## Block Styling Validation Guide

### 🧪 Testing the Block Styling Fixes

**Quick Validation Process**:

1. **Create Test Presentation**:
   - Add different block types: Bar Chart, Hero Section, Quote Box, Timeline
   - Customize Global Styles (colors and typography)
   - Save the presentation

2. **Publish & Compare**:
   - Publish the presentation
   - Open published URL in new tab
   - Compare side-by-side with editor view

3. **What to Check**:
   - ✅ Chart components show gradients and proper colors
   - ✅ Hero sections have background gradients
   - ✅ Quote boxes maintain styling and colors
   - ✅ Timeline components render correctly
   - ✅ Typography follows Global Styles settings
   - ✅ CSS variables resolve (not showing fallback values)

**Debug Information**:
- Check browser console in published presentation for CSS extraction logs
- Look for "🎨 Enhanced CSS Summary" in backend logs during publishing
- Verify CSS includes "Block Components CSS" section

**Environment Testing**:
- Test in local development (localhost:5174)
- Test in production environment
- Ensure identical appearance in both

## General Testing Checklist

### Development Testing
- [ ] Frontend loads at localhost:5174
- [ ] Backend responds at localhost:3001/health
- [ ] Authentication works (login/logout)
- [ ] Presentation editor loads without errors
- [ ] File uploads work (check backend uploads/ directory)
- [ ] Publishing feature works

### Pre-Deployment Testing
- [ ] **Run automated tests**: `npm test` (All 101 tests must pass)
- [ ] Run validation: `npm run validate`
- [ ] Run linting: `npm run lint`
- [ ] Test build: `npm run build:prod`
- [ ] Check for uncommitted changes: `git status`

### Production Testing
- [ ] Check frontend at https://app.investorprez.com
- [ ] Verify backend API at https://api.investorprez.com/health
- [ ] Test user registration and login
- [ ] Create and publish a test presentation
- [ ] Monitor Sentry for any errors
- [ ] Check Google Analytics for tracking

## Automated Testing

### Test Suite Overview
- **Framework**: Vitest + React Testing Library
- **Total Tests**: 101 tests across 10 test files
- **Coverage**: Pages, Components, Services, and Utilities
- **Status**: ✅ All tests currently passing

### Quick Commands
```bash
# Run all tests
npm test

# Run specific test file
npm test -- src/pages/__tests__/LoginPage.test.tsx

# Run tests in watch mode
npm test -- --watch
```

### For Detailed Testing Information
See [Automated Testing Guide](./AUTOMATED_TESTING_GUIDE.md) for:
- Test patterns and best practices
- Common issues and solutions
- Component-specific testing guides
- Debugging failed tests
- Future improvement recommendations