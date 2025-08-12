# Domain Architecture Guide

*Last Updated: July 23, 2025*  
*Status: Current - v1.4.0*

## 🌐 Domain Structure Overview

InvestorPrez uses a subdomain-based architecture to separate the marketing site from the application:

### Production Domains

| Domain | Purpose | Hosting | Status |
|--------|---------|---------|--------|
| `investorprez.com` | Marketing website | Vercel (separate project) | 🟡 To be deployed |
| `app.investorprez.com` | React application | Vercel (current project) | ✅ Active |
| `api.investorprez.com` | Backend API | Railway | ✅ Active |

### URL Structure

```
Marketing Site (investorprez.com):
├── / (homepage)
├── /about
├── /pricing  
├── /contact
├── /blog
└── /p/* (presentation proxy - redirects to app)

Application (app.investorprez.com):
├── /login
├── /dashboard
├── /editor/*
├── /p/* (published presentations)
└── /profile

API (api.investorprez.com):
├── /api/auth/*
├── /api/presentations/*
├── /p/* (public presentation data)
└── /api/admin/*
```

## 🔧 Configuration

### Environment Variables

**Frontend (Vercel - App):**
```bash
VITE_API_BASE_URL=https://api.investorprez.com/api
```

**Backend (Railway):**
```bash
FRONTEND_URL=https://app.investorprez.com
PUBLIC_DOMAIN=https://app.investorprez.com
```

### CORS Configuration

Backend allows requests from:
- `https://app.investorprez.com` (React app)
- `https://investorprez.com` (marketing site - for presentation proxying)

## 📋 Marketing Site Setup Instructions

### 1. Create Separate Vercel Project

1. Create new Vercel project for marketing site
2. Add custom domain: `investorprez.com`
3. Configure DNS records as instructed by Vercel

### 2. Presentation Proxying

The marketing site should handle `/p/*` routes by either:

**Option A: Redirect to App**
```javascript
// In marketing site routing
if (path.startsWith('/p/')) {
  redirect(`https://app.investorprez.com${path}`);
}
```

**Option B: Proxy Content (Advanced)**
```javascript
// Fetch from API and render in marketing site layout
const presentationData = await fetch(`https://api.investorprez.com/p/${slug}`);
```

### 3. DNS Configuration

**Required DNS Records:**
```
Type: A
Name: @
Value: 76.76.19.61 (Vercel IP - check current)

Type: CNAME  
Name: www
Value: cname.vercel-dns.com
```

## ⚠️ Important Notes

1. **Published Presentations**: Currently use `app.investorprez.com/p/*` URLs
2. **SEO**: Marketing site should have proper meta tags and sitemaps
3. **Analytics**: Both sites can share the same GA4 property with different data streams
4. **SSL**: Vercel handles SSL certificates automatically for both domains

## 🚨 Migration Checklist

- [x] Remove `investorprez.com` from React app Vercel project
- [x] Update `PUBLIC_DOMAIN` to `https://app.investorprez.com` in Railway
- [x] Update production environment documentation
- [ ] Create marketing site Vercel project
- [ ] Add `investorprez.com` domain to marketing site project
- [ ] Configure DNS records
- [ ] Set up presentation routing in marketing site
- [ ] Test cross-domain functionality

---

*This architecture ensures clear separation between marketing and application while maintaining seamless user experience.*