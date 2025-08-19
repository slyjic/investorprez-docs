# Authentication System Feature

_Last Updated: August 12, 2025_
_Status: Current - Documentation Standards Update_

## Overview

Complete JWT-based authentication system with user registration, email verification, password reset, and profile management. Implements secure session management with token-based authentication.

## Key Components

- JWT token authentication
- 6-digit email verification codes
- Password reset flow
- Profile management
- Role-based access control

## Implementation Files

### Frontend Components

- `/src/pages/LoginPage.tsx` - Login interface with form validation
- `/src/pages/SignupPage.tsx` - Registration with Zod validation
- `/src/pages/EmailVerificationCodePage.tsx` - 6-digit code verification
- `/src/pages/ForgotPasswordPage.tsx` - Password reset request
- `/src/pages/ResetPasswordPage.tsx` - New password setting
- `/src/components/layout/ProtectedLayout.tsx` - Route protection wrapper
- `/src/components/PrivateRoute.tsx` - Authentication guard

### Services

- `/src/services/authService.ts` - Frontend auth API calls and token management
- `/src/lib/authUtils.ts` - Auth helper functions

### Backend Implementation

- `/backend/src/routes/auth.js` - All authentication endpoints
- `/backend/src/middleware/auth.js` - JWT validation middleware
- `/backend/src/utils/tokenUtils.js` - Token generation and validation
- `/backend/src/services/emailService.js` - Email sending with Resend

### Database Schema

```sql
-- users table
id, email, password, first_name, last_name,
company_name, title, avatar_url, email_verified,
verification_code, code_expires_at, code_attempts,
reset_token, reset_token_expires, is_active,
role, created_at, updated_at
```

## API Endpoints

### Public Endpoints

- `POST /api/auth/register` - User registration
- `POST /api/auth/login` - User login
- `POST /api/auth/verify-code` - Email verification
- `POST /api/auth/forgot-password` - Request password reset
- `POST /api/auth/reset-password` - Set new password

### Protected Endpoints

- `GET /api/auth/profile` - Get user profile
- `PUT /api/auth/profile` - Update profile
- `POST /api/auth/profile/avatar` - Upload avatar
- `PUT /api/auth/profile/password` - Change password
- `POST /api/auth/logout` - Logout user

## Technical Details

### JWT Implementation

```javascript
// Token generation
const token = jwt.sign(
  { userId: user.id, email: user.email },
  process.env.JWT_SECRET,
  { expiresIn: "7d" },
);
```

### Email Verification Flow

1. User registers → 6-digit code generated
2. Code sent via email (Resend service)
3. User enters code on verification page
4. Maximum 5 attempts, 15-minute expiry
5. Account activated on success

### Security Features

- Bcrypt password hashing (10 rounds)
- JWT tokens with 7-day expiry
- Rate limiting (1000 requests/15min)
- Account lockout after failed attempts
- Secure password requirements
- CORS configuration

### Frontend Token Management

```typescript
// authService.ts key methods
login(email, password); // Returns user + token
signup(userData); // Creates account
verifyEmail(email, code); // Verifies 6-digit code
getProfile(); // Uses stored token
updateProfile(data); // Updates user info
logout(); // Clears token
```

### Protected Route Implementation

```typescript
<PrivateRoute>
  <Route element={<ProtectedLayout />}>
    <Route path="/dashboard" element={<DashboardPage />} />
    <Route path="/editor/:id" element={<EditorPage />} />
  </Route>
</PrivateRoute>
```

## Email Templates

- Welcome email on registration
- 6-digit verification code
- Password reset link
- Professional HTML templates

## Error Handling

- Validation errors with field-specific messages
- Network error recovery
- Token expiry handling
- User-friendly error messages

## Session Management

- Token stored in localStorage
- Automatic token inclusion in API requests
- Token refresh on API calls
- Logout clears all session data

## Role System

- User (default)
- Admin
- Super Admin
- Role-based route protection
