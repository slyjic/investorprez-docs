# Troubleshooting: [Issue Name]

**Issue Type**: [Bug | Performance | Configuration | Setup]  
**Severity**: [Critical | High | Medium | Low]  
**Last Updated**: [Date]  
**Status**: [Open | In Progress | Resolved]

## Problem Description

Clear description of the issue, including:

- What the user was trying to do
- What actually happened
- What should have happened

## Symptoms

Observable signs of the issue:

- [ ] Error messages displayed
- [ ] UI behavior problems
- [ ] Performance degradation
- [ ] Data inconsistencies
- [ ] Other symptoms

## Error Messages

```
Include exact error messages here, with:
- Full stack traces
- Console errors
- Network errors
- Database errors
```

## Environment Information

### When does this occur?

- [ ] Development environment
- [ ] Staging environment
- [ ] Production environment
- [ ] All environments

### Affected Components

- [ ] Frontend (React)
- [ ] Backend (Express)
- [ ] Database (PostgreSQL)
- [ ] Third-party services
- [ ] Infrastructure

### Browser/Platform Details

- **Browsers**: Chrome, Firefox, Safari, etc.
- **Operating Systems**: Windows, macOS, Linux
- **Mobile**: iOS, Android
- **Screen sizes**: Desktop, tablet, mobile

## Reproduction Steps

1. Go to [URL or page]
2. Click on [element]
3. Enter [data] in [field]
4. Click [button]
5. Observe [issue]

### Minimal Reproduction Case

```javascript
// Simplified code that reproduces the issue
```

## Root Cause Analysis

### Investigation Process

1. **Logs Reviewed**: What logs were checked
2. **Database Queries**: Relevant queries executed
3. **Network Analysis**: API calls, response times
4. **Code Analysis**: Files and functions examined

### Root Cause

Technical explanation of what's causing the issue:

- Code logic problems
- Configuration issues
- Data inconsistencies
- External service problems
- Infrastructure limitations

## Solutions

### Immediate Workaround

Quick temporary solution users can apply:

```javascript
// Temporary workaround code
```

### Permanent Fix

Long-term solution with implementation details:

#### Code Changes

```javascript
// Before (problematic code)
const problematic = () => {
  // issue-causing code
};

// After (fixed code)
const fixed = () => {
  // corrected code
};
```

#### Configuration Changes

```bash
# Environment variables to update
SETTING_NAME=new_value

# Database migrations needed
npm run migrate
```

#### Deployment Steps

1. Deploy code changes
2. Update environment variables
3. Run database migrations
4. Restart services
5. Verify fix

## Prevention

### Code Changes

- Input validation improvements
- Error handling additions
- Type safety enhancements
- Testing additions

### Process Improvements

- Code review checklist updates
- Monitoring enhancements
- Documentation updates
- Training needs

## Testing

### Verification Steps

1. Reproduce the original issue
2. Apply the fix
3. Verify issue is resolved
4. Test edge cases
5. Regression testing

### Test Cases Added

- [ ] Unit tests: [file path]
- [ ] Integration tests: [file path]
- [ ] E2E tests: [file path]

## Monitoring

### Detection Methods

How to detect if this issue occurs again:

- Error logging patterns
- Performance metrics
- User feedback
- Automated monitoring

### Alerts Setup

```javascript
// Example monitoring alert configuration
```

## Related Issues

### Similar Problems

- Issue #123: Similar error in different component
- Issue #456: Related performance problem
- Documentation: Link to related docs

### Dependencies

- Third-party services affected
- Related system components
- Version dependencies

## Files Modified

### Frontend Changes

- `/src/components/[Component].tsx` - Description of changes
- `/src/services/[service].ts` - Description of changes

### Backend Changes

- `/backend/src/routes/[route].js` - Description of changes
- `/backend/src/middleware/[middleware].js` - Description of changes

### Configuration Changes

- `.env.example` - New environment variables
- `package.json` - Dependency updates

## Communication

### User Impact

- How many users affected
- Business impact assessment
- Communication sent to users

### Team Notification

- Who was notified
- When notification was sent
- Follow-up actions taken

## Lessons Learned

### What Went Well

- Quick identification of issue
- Effective collaboration
- Good communication

### What Could Be Improved

- Earlier detection possible
- Better error handling needed
- Documentation gaps identified

### Action Items

- [ ] Update error handling in [component]
- [ ] Add monitoring for [metric]
- [ ] Document [process]
- [ ] Train team on [topic]

## Timeline

| Time             | Action                | Person      |
| ---------------- | --------------------- | ----------- |
| 2025-01-01 10:00 | Issue reported        | User/System |
| 2025-01-01 10:15 | Investigation started | Developer   |
| 2025-01-01 11:30 | Root cause identified | Developer   |
| 2025-01-01 12:00 | Fix implemented       | Developer   |
| 2025-01-01 12:30 | Fix deployed          | DevOps      |
| 2025-01-01 13:00 | Issue resolved        | Developer   |

## Additional Resources

- [Link to related documentation]
- [Link to external resources]
- [Link to vendor documentation]
- [Link to community discussions]
