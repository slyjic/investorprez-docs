# Development Workflow Guide

*Last Updated: July 31, 2025*  
*Status: Current - v1.10.18*  
*Previous Version Archived: /docs/04-archive/document-updates-2025-07-31/*

## 🎯 Overview

This guide explains how to safely develop, test, and deploy changes to InvestorPrez without interfering with the live production system.

## 🏗️ Architecture Summary

### Local Development Environment
- **Frontend**: `http://localhost:5174` (Vite dev server)
- **Backend**: `http://localhost:3001` (Express server)
- **Database**: Local PostgreSQL (`investorprez` database)
- **File Storage**: Local file system (`backend/uploads/`)
- **Email**: Console logging only (no real emails sent)
- **Typography**: System fonts only (Google Fonts system removed in v1.2.0)

### Production Environment
- **Frontend**: Vercel hosting (auto-deploys from main branch)
- **Backend**: Railway hosting (auto-deploys from main branch)
- **Database**: Railway PostgreSQL (separate from local)
- **File Storage**: Vercel Blob Storage (cloud CDN)
- **Email**: Resend service (real emails sent)  
- **Typography**: Typography presets system (6 professional presets)
- **Monitoring**: Sentry error tracking + GA4 analytics + Monday.com integration

## 🔄 Safe Development Workflow

### Step 1: Starting Local Development

```bash
# Terminal 1: Start Backend
cd backend
npm run dev

# Wait for these messages:
# ✅ Database connected successfully
# 🚀 InvestorPrez API Server started successfully!
# 💡 Ready to accept requests!

# Terminal 2: Start Frontend (new terminal)
cd /Users/simonic/MyApps/investorprez
npm run dev

# Should see:
# Local:   http://localhost:5174/
```

### Step 2: Verify Local Environment is Working

**Check these indicators:**
- ✅ Backend console shows: `Environment: development`
- ✅ Email console shows: `📧 Using MOCK email service (console logging)`
- ✅ Storage console shows: `📦 Using MOCK blob storage (local file system)`
- ✅ Frontend loads at `http://localhost:5174`

### Step 3: Making Changes

**Safe Areas to Modify:**
- Frontend components (`src/components/`)
- Frontend pages (`src/pages/`)
- Backend routes (`backend/src/routes/`)
- Backend services (`backend/src/services/`)
- Styling and UI improvements
- Feature additions

**Test Your Changes:**
1. **Frontend**: Changes appear immediately (hot reload)
2. **Backend**: Restart server to see changes
3. **Database**: Changes only affect local DB
4. **Files**: Upload test files (stored locally)
5. **Email**: Check console for email logs

### Step 4: Testing Before Production

**Essential Checklist:**
- [ ] Frontend loads without errors
- [ ] Backend responds at `/health` endpoint
- [ ] User registration works (emails in console)
- [ ] File uploads work (files in `backend/uploads/`)
- [ ] Presentation editor loads
- [ ] Publishing works (if testing publish features)

### Step 5: Deploying to Production

```bash
# Add your changes
git add .

# Commit with descriptive message
git commit -m "Description of what you changed

🤖 Generated with [Claude Code](https://claude.ai/code)

Co-Authored-By: Claude <noreply@anthropic.com>"

# Push to production (auto-deploys)
git push origin main
```

**What Happens Next:**
1. **Vercel** automatically rebuilds the frontend (2-3 minutes)
2. **Railway** automatically rebuilds the backend (3-5 minutes)
3. **Production** uses real services (email, cloud storage)

## ⚠️ Important Differences Between Local and Production

| Feature | Local Development | Production |
|---------|------------------|------------|
| **User Emails** | Console logs only | Real emails sent via Resend |
| **File Storage** | `backend/uploads/` folder | Vercel Blob (global CDN) |
| **Database** | Local PostgreSQL | Railway PostgreSQL |
| **Asset URLs** | `localhost:3001/api/...` | `https://...vercel-storage.com/...` |
| **Google Fonts** | Mock/demo fonts | Real Google Fonts API |
| **Security** | Relaxed (development) | Strict (production) |
| **Performance** | Local speed | CDN + optimizations |

## 🛡️ Safety Measures

### 1. Environment Isolation
- **Local changes NEVER affect production database**
- **Local emails NEVER sent to real users**
- **Local files NEVER uploaded to production storage**

### 2. Automatic Service Detection
```javascript
// Backend automatically detects environment
Environment: development
📧 Using MOCK email service (console logging)
📦 Using MOCK blob storage (local file system)
```

### 3. Database Safety
- Local database: `investorprez` on your machine
- Production database: Completely separate on Railway
- Zero risk of data contamination

## 🔧 Common Development Tasks

### Adding a New Feature
1. Start local environment
2. Create/modify components
3. Test locally (all services are mocked)
4. Commit and push when ready
5. Verify production deployment

### Fixing a Bug
1. Reproduce bug locally
2. Make the fix
3. Test the fix locally
4. Push to production
5. Verify fix works in production

### Updating Styles/UI
1. Make changes in local environment
2. See changes immediately (hot reload)
3. Test on different screen sizes
4. Push when satisfied

### Database Changes
1. Test locally first (safe local DB)
2. Create migration scripts if needed
3. Test migration locally
4. Deploy (migrations run automatically)

## 🚨 Emergency Procedures

### If Something Goes Wrong in Production

**Option 1: Quick Fix**
```bash
# Make the fix locally
git add .
git commit -m "Hotfix: description of fix"
git push origin main
# Wait 2-3 minutes for auto-deployment
```

**Option 2: Rollback (Revert)**
```bash
# Find the last good commit
git log --oneline -5

# Revert to last good commit
git revert HEAD
git push origin main
```

**Option 3: Contact Support**
- Vercel dashboard for frontend issues
- Railway dashboard for backend issues

## 📊 Monitoring Production

### Health Checks
- **Frontend**: Visit your live site
- **Backend**: Check Railway logs
- **Database**: Monitor Railway PostgreSQL metrics

### Logs and Debugging
- **Frontend errors**: Browser console
- **Backend errors**: Railway application logs
- **Database errors**: Railway database logs

## 💡 Pro Tips

### 1. Always Test Locally First
Never push directly to production without local testing.

### 2. Use Descriptive Commit Messages
Good: "Fix image upload CORS issue and add preflight support"
Bad: "fix stuff"

### 3. Small, Frequent Changes
Better to make small changes often than large changes rarely.

### 4. Check Both Environments
Sometimes things work locally but not in production due to environment differences.

### 5. Keep Backups
Your local database can be backed up separately if needed.

## 🤝 Getting Help

### When Things Don't Work
1. Check the console for error messages
2. Verify environment is running correctly
3. Compare local vs production behavior
4. Check recent changes in git history

### Common Issues and Solutions

**"Images not loading"**
- Check CORS headers are correct
- Verify backend is running
- Check file exists in uploads folder

**"Emails not working"**
- Local: Should only show in console
- Production: Check Resend dashboard

**"Database connection failed"**
- Check PostgreSQL is running locally
- Verify credentials in `.env` file

**"Frontend won't start"**
- Check if another process is using port 5174
- Run `npm install` to update dependencies

This workflow ensures you can develop safely without affecting live users or production data.