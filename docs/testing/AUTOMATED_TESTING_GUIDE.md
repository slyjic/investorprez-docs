# Automated Testing Guide

*Last Updated: July 24, 2025*  
*Status: Current - v1.4.0*  
*Test Coverage: 101/101 tests passing*

This document provides comprehensive guidance for running, maintaining, and extending the automated test suite for InvestorPrez.

## 🚀 Quick Start

### Running Tests
```bash
# Run all tests
npm test

# Run tests in watch mode (development)
npm test -- --watch

# Run specific test file
npm test -- src/pages/__tests__/LoginPage.test.tsx

# Run tests with UI (if available)
npm run test:ui

# Run tests once and exit
npm run test:run
```

### Test Status Overview
- **Total Tests**: 101 tests across 10 test files
- **Current Status**: ✅ All passing
- **Test Framework**: Vitest + React Testing Library
- **Last Major Update**: January 2025 (comprehensive test coverage update)

## 📁 Test Structure

### Test File Organization
```
src/
├── components/__tests__/
│   ├── PresentationEditorEnhanced.test.tsx
│   └── PublishButton.test.tsx
├── pages/__tests__/
│   ├── EmailVerificationPage.test.tsx
│   ├── LoginPage.test.tsx
│   └── SignupPage.test.tsx
├── services/__tests__/
│   ├── authService.test.ts
│   └── presentationService.test.ts
├── components/ui/
│   └── Button.test.tsx
├── lib/
│   └── auth.test.ts
└── utils/
    └── logger.test.ts
```

### Test Categories

1. **Page Component Tests** (30 tests)
   - User authentication flows
   - Form validation and submission
   - Navigation and routing
   - Error handling and user feedback

2. **Service Layer Tests** (37 tests)
   - API integration
   - Data transformation
   - Error handling
   - Authentication workflows

3. **Component Tests** (17 tests)
   - UI component behavior
   - User interactions
   - State management
   - Modal and dialog workflows

4. **Utility Tests** (17 tests)
   - Helper functions
   - Authentication utilities
   - Logging functionality
   - UI components

## 🧪 Test Patterns and Best Practices

### Established Patterns

#### 1. Service Mocking
```typescript
// Mock external services
vi.mock('@/services/authService', () => ({
  authService: {
    login: vi.fn(),
    register: vi.fn(),
    verifyEmailAddress: vi.fn(), // Note: updated from verifyEmail
  },
}));
```

#### 2. Component Testing with Providers
```typescript
import { render } from '@/test/utils'; // Includes BrowserRouter and providers

render(<Component {...props} />);
```

#### 3. Async Testing
```typescript
await waitFor(() => {
  expect(screen.getByText('Expected text')).toBeInTheDocument();
});
```

#### 4. Error Handling Tests
```typescript
// Test both API errors and component error states
vi.spyOn(service, 'method').mockRejectedValue(new Error('Test error'));
```

#### 5. Toast Notification Testing
```typescript
// Check toast calls instead of rendered text (toasts don't render in test environment)
expect(toast.error).toHaveBeenCalledWith('Error message');
```

### Common Mock Patterns

#### Analytics Mocking
```typescript
vi.mock('@/utils/analytics', () => ({
  analytics: {
    track: vi.fn(),
    authEvent: vi.fn(),
    conversion: vi.fn(),
    presentationEvent: vi.fn(),
  },
}));
```

#### Router Mocking
```typescript
vi.mock('react-router-dom', async () => {
  const actual = await vi.importActual('react-router-dom');
  return {
    ...actual,
    useNavigate: vi.fn(),
  };
});
```

#### Toast Mocking
```typescript
vi.mock('sonner', () => ({
  toast: {
    success: vi.fn(),
    error: vi.fn(),
    loading: vi.fn(),
  },
}));
```

## 🔧 Component-Specific Testing Guides

### Authentication Components
- **Focus**: Form validation, API integration, navigation
- **Key Tests**: Valid/invalid inputs, error states, success flows
- **Common Issues**: Toast vs inline error messages, navigation timing

### Presentation Editor Components
- **Focus**: Editor initialization, state management, auto-save
- **Key Tests**: Loading states, prop validation, error boundaries
- **Common Issues**: GrapesJS SDK mocking, component lifecycle

### Service Layer Testing
- **Focus**: API calls, data transformation, error handling
- **Key Tests**: Success responses, error scenarios, fallback behavior
- **Common Issues**: Mock signatures, response format changes

## 🐛 Common Test Issues and Solutions

### 1. Mock Function Not Found
**Problem**: `TypeError: Cannot read properties of undefined`
**Solution**: Check mock method names match actual service methods
```typescript
// Wrong
verifyEmail: vi.fn()

// Correct
verifyEmailAddress: vi.fn()
```

### 2. UI Text Not Found
**Problem**: `Unable to find element with text`
**Solution**: Check exact case and spacing in components
```typescript
// Wrong
expect(screen.getByText(/loading enhanced editor/i))

// Correct
expect(screen.getByText(/initializing editor/i))
```

### 3. Navigation Expectations
**Problem**: Component navigates differently than expected
**Solution**: Check actual navigation behavior in component
```typescript
// Check what actually happens vs what test expects
expect(mockNavigate).toHaveBeenCalledWith('/login', {
  state: { message: '...', email: '...' }
});
```

### 4. Async Timing Issues
**Problem**: Tests fail intermittently with timing issues
**Solution**: Use proper waitFor patterns
```typescript
await waitFor(() => {
  expect(condition).toBeTruthy();
}, { timeout: 2000 });
```

## 📊 Test Maintenance

### When Tests Need Updates

1. **API Changes**: Service methods, response formats, endpoint URLs
2. **UI Changes**: Text content, component structure, user flows
3. **Component Props**: Interface changes, new required props
4. **Error Handling**: New error types, different error messaging

### Debugging Failed Tests

1. **Check Recent Changes**: What components/services were modified?
2. **Run Single Test**: Isolate the failing test
3. **Add Debug Output**: Use `screen.debug()` to see rendered HTML
4. **Check Mocks**: Ensure all required methods are mocked
5. **Verify Expectations**: Are you testing the right behavior?

### Test Performance

- **Current Runtime**: ~2.3 seconds for full suite
- **Optimization**: Use specific test files during development
- **Watch Mode**: Automatically re-run tests on file changes

## 🎯 Future Improvements

### Recommended Enhancements

1. **Test Coverage Reporting**
   ```bash
   npm install -D @vitest/coverage-v8
   npm run test:coverage
   ```

2. **Visual Regression Testing**
   - Screenshot comparisons for UI components
   - Automated visual testing in CI/CD

3. **Integration Tests**
   - End-to-end user workflows
   - Full authentication flows
   - Presentation creation and publishing

4. **Performance Testing**
   - Component render performance
   - API response time testing
   - Memory leak detection

### Testing Gaps to Address

1. **PublishModal Component**: No dedicated tests (mocked in PublishButton tests)
2. **CreatePresentationModal**: Not yet implemented
3. **Security Testing**: Input validation, XSS prevention
4. **Accessibility Testing**: Screen reader compatibility, keyboard navigation

## 🚨 Critical Test Guidelines

### Must-Follow Rules

1. **Always Mock External Services**: Never make real API calls in tests
2. **Test Error States**: Every happy path needs a corresponding error test
3. **Use Proper Async Patterns**: Always await user interactions and API calls
4. **Clean Up Mocks**: Use `beforeEach(() => vi.clearAllMocks())`
5. **Test User Experience**: Focus on what users actually see and do

### Breaking Changes to Avoid

1. **Don't change test file structure** without updating documentation
2. **Don't remove existing tests** without understanding their purpose
3. **Don't skip tests** - fix them instead
4. **Don't commit failing tests** to main branch

## 📞 Getting Help

### When Tests Fail

1. **Check this documentation** for common patterns
2. **Review recent git changes** that might have affected the component
3. **Run tests locally** to reproduce the issue
4. **Check component implementation** to understand current behavior
5. **Update test expectations** to match current functionality

### Resources

- **Test Utils**: `/src/test/utils.tsx` - Test setup and providers
- **Mock Patterns**: See individual test files for service mocking examples
- **Vitest Docs**: https://vitest.dev/
- **React Testing Library**: https://testing-library.com/docs/react-testing-library/intro/

---

*This guide reflects the current state of the test suite as of January 2025. Update this document when making significant changes to test patterns or structure.*