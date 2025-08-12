# GitHub Pages Setup Guide

## 🚀 Complete Setup Instructions

### Step 1: Create GitHub Repository

1. **Create new repository on GitHub**:
   - Repository name: `investorprez-docs`
   - Visibility: **Public** (required for free GitHub Pages)
   - Initialize with README: **No** (we have our own)

2. **Set up repository URL**:
   ```bash
   # The repository URL will be:
   # https://github.com/investorprez/investorprez-docs
   ```

### Step 2: Configure GitHub Pages

1. **Go to Repository Settings**:
   - Navigate to `Settings` → `Pages`

2. **Configure Source**:
   - Source: `GitHub Actions`
   - This enables custom deployment workflows

### Step 3: Add GitHub Actions Workflow

Create `.github/workflows/deploy.yml`:

```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches:
      - main
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

concurrency:
  group: "pages"
  cancel-in-progress: false

jobs:
  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      
      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '18'
          cache: npm
      
      - name: Install dependencies
        run: npm ci
      
      - name: Build website
        run: npm run build
      
      - name: Setup Pages
        uses: actions/configure-pages@v4
      
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: ./build
      
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
```

### Step 4: Push to GitHub

```bash
# In the investorprez-docs directory
cd investorprez-docs

# Initialize git repository
git init

# Add GitHub repository as origin
git remote add origin https://github.com/investorprez/investorprez-docs.git

# Create .github/workflows directory
mkdir -p .github/workflows

# Copy the workflow file (create deploy.yml with the content above)

# Add all files
git add .

# Commit
git commit -m "🚀 Initial commit: InvestorPrez Documentation Site

- Complete Docusaurus setup with TypeScript
- 69 sanitized documentation files
- GrapesJS SDK comprehensive reference (55 files)
- Architecture, development, and feature docs
- LLM-optimized structure with stable permalinks
- GitHub Pages deployment ready

Features:
✅ No authentication required
✅ Minimal JavaScript, Markdown-focused  
✅ Comprehensive TOC with emojis
✅ Cross-referenced documentation
✅ Mobile-responsive design"

# Push to GitHub
git branch -M main
git push -u origin main
```

### Step 5: Verify Deployment

1. **Check Actions Tab**:
   - Go to repository → `Actions`
   - Verify the deployment workflow runs successfully

2. **Access Your Site**:
   - URL: `https://investorprez.github.io/investorprez-docs/`
   - Should be available within 5-10 minutes after first push

### Step 6: Configure Custom Domain (Optional)

If you want a custom domain like `docs.investorprez.com`:

1. **Add CNAME file**:
   ```bash
   echo "docs.investorprez.com" > static/CNAME
   ```

2. **Update DNS**:
   - Add CNAME record: `docs.investorprez.com` → `investorprez.github.io`

3. **Update docusaurus.config.ts**:
   ```typescript
   url: 'https://docs.investorprez.com',
   baseUrl: '/',
   ```

## 🔧 Maintenance

### Auto-Update from Private Docs

Create a sync script in the main project:

```bash
#!/bin/bash
# docs/10-automation/sync-to-public.sh

echo "🔄 Syncing documentation to public repository..."

# Re-export sanitized docs
./docs/10-automation/create-public-docs-export.sh

# Copy to Docusaurus
rm -rf investorprez-docs/docs/*
cp -r docs-public/* investorprez-docs/docs/

# Update intro.md with latest version info
# ... update version numbers, stats, etc.

# Commit and push
cd investorprez-docs
git add .
git commit -m "📚 Update documentation - $(date '+%Y-%m-%d')"
git push

echo "✅ Public documentation updated!"
```

### SEO Optimization

The site is already optimized for:
- ✅ **LLM Crawling**: Clean Markdown, stable URLs
- ✅ **Search Engines**: Meta tags, semantic HTML
- ✅ **Performance**: Minimal JavaScript, fast loading
- ✅ **Accessibility**: Proper headings, alt text

## 🎯 Success Metrics

Once deployed, you'll have:

- **📖 69 Documentation Files** organized and searchable
- **🎨 55 GrapesJS SDK Files** with complete reference
- **🔗 Stable URLs** that won't break for AI/LLM references
- **📱 Mobile Responsive** design for all devices
- **🚀 Fast Loading** with minimal JavaScript overhead
- **🔍 Full-Text Search** across all documentation

## 🤖 AI/LLM Usage

Perfect for AI assistants:
- **Base URL**: `https://investorprez.github.io/investorprez-docs/`
- **GrapesJS SDK**: `/grapesjs-sdk/GrapesJS_SDK_Docs/Overview/Overview_Getting-Started`
- **Architecture**: `/architecture/ARCHITECTURE_DECISIONS`
- **Features**: `/features/COMMENT_SYSTEM`

The site requires no authentication and loads fast for AI browsing.