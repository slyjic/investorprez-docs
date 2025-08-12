---
layout: default
title: "InvestorPrez Documentation"
---

# 📚 InvestorPrez Documentation

Welcome to the comprehensive documentation for **InvestorPrez** - a professional presentation platform built with modern web technologies and powered by GrapesJS Studio SDK.

## 🏗️ Architecture

<div class="grid">
  <div class="card">
    <h3><a href="{% link _architecture/ARCHITECTURE_DECISIONS.md %}">🏛️ Architecture Decisions</a></h3>
    <p>Key architectural decisions and their rationale</p>
  </div>
  <div class="card">
    <h3><a href="{% link _architecture/DOMAIN_ARCHITECTURE.md %}">🌐 Domain Architecture</a></h3>
    <p>System boundaries and domain modeling</p>
  </div>
  <div class="card">
    <h3><a href="{% link _architecture/GRAPESJS_RENDERING_ARCHITECTURE.md %}">🎨 Rendering Architecture</a></h3>
    <p>GrapesJS integration and rendering pipeline</p>
  </div>
</div>

## ⚙️ Development

<div class="grid">
  <div class="card">
    <h3><a href="{% link _development/DEVELOPMENT_WORKFLOW.md %}">🔧 Development Workflow</a></h3>
    <p>Complete development setup and workflow guide</p>
  </div>
  <div class="card">
    <h3><a href="{% link _development/DOCUMENTATION_UPDATE_PROTOCOL.md %}">📝 Documentation Protocol</a></h3>
    <p>Guidelines for maintaining documentation</p>
  </div>
</div>

## ✨ Features

<div class="grid">
  <div class="card">
    <h3><a href="{% link _features/AUTHENTICATION_SYSTEM.md %}">🔐 Authentication System</a></h3>
    <p>JWT-based authentication with email verification</p>
  </div>
  <div class="card">
    <h3><a href="{% link _features/COMMENT_SYSTEM.md %}">💬 Comment System</a></h3>
    <p>Slide-specific commenting with visual pins</p>
  </div>
  <div class="card">
    <h3><a href="{% link _features/COLLABORATION_SYSTEM_RESEARCH.md %}">🤝 Collaboration System</a></h3>
    <p>Multi-user collaboration and sharing features</p>
  </div>
</div>

## 🧪 Testing & Deployment

<div class="grid">
  <div class="card">
    <h3><a href="{% link _testing/AUTOMATED_TESTING_GUIDE.md %}">🔬 Testing Guide</a></h3>
    <p>Comprehensive testing procedures and automation</p>
  </div>
  <div class="card">
    <h3><a href="{% link _testing/TESTING_PROCEDURES.md %}">✅ Testing Procedures</a></h3>
    <p>Manual testing procedures and checklists</p>
  </div>
  <div class="card">
    <h3><a href="{% link _deployment/DEPLOYMENT_GUIDE.md %}">🚀 Deployment Guide</a></h3>
    <p>Production deployment and infrastructure setup</p>
  </div>
</div>

## 🎨 GrapesJS SDK Reference

The comprehensive GrapesJS Studio SDK documentation:

<div class="grid">
  <div class="card">
    <h3><a href="/investorprez-docs/grapesjs/GrapesJS_SDK_Docs/">📖 Complete SDK Guide</a></h3>
    <p>Full reference for GrapesJS Studio SDK integration</p>
  </div>
</div>

**Key GrapesJS Sections:**
- **Getting Started**: Setup, configuration, and basic usage
- **Project Types**: Web, Email, and Document presentations  
- **Configuration**: Blocks, themes, layouts, and components
- **Plugins**: Rich text editor, data sources, and UI enhancements
- **Components**: Animation, tables, and custom elements
- **Integration**: InvestorPrez-specific implementations

## 📋 Templates

<div class="grid">
  <div class="card">
    <h3><a href="{% link _templates/templates/FEATURE_DOCUMENTATION.md %}">📄 Documentation Templates</a></h3>
    <p>Standardized templates for consistent documentation</p>
  </div>
</div>

## 📊 Project Status

**Current Version**: v1.10.57 (User-Generated Symbols Fix)  
**Documentation Version**: v1.0.0  
**Last Updated**: 2025-08-12

### Tech Stack
- **Frontend**: React 18.3.1 + TypeScript + Vite + Tailwind CSS
- **Backend**: Express.js + PostgreSQL + JWT Auth
- **Editor**: GrapesJS Studio SDK v1.0.51
- **Infrastructure**: Vercel + Railway + Sentry + GA4

### Key Metrics
- **📄 152 Automated Tests** (all passing)
- **🎨 55+ GrapesJS SDK Files** documented
- **📈 69 Documentation Files** organized
- **⚡ Fast Loading** with minimal JavaScript

## 🤖 AI/LLM Usage

This documentation is optimized for AI assistants:
- ✅ **No authentication required**
- ✅ **Clean Markdown structure**  
- ✅ **Stable permalinks**
- ✅ **Fast loading**
- ✅ **Comprehensive cross-references**

**Base URL**: `https://investorprez.github.io/investorprez-docs/`

---

<div class="info-box">
  <h4>📝 Contributing</h4>
  <p>This documentation is maintained alongside the InvestorPrez platform. For technical support or contributions, please visit our <a href="https://app.investorprez.com">main application</a>.</p>
</div>

<style>
.grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 1rem;
  margin: 1rem 0;
}

.card {
  border: 1px solid #e1e4e8;
  border-radius: 8px;
  padding: 1rem;
  background: #f9f9f9;
}

.card h3 {
  margin: 0 0 0.5rem 0;
  color: #0366d6;
}

.card h3 a {
  text-decoration: none;
  color: inherit;
}

.card h3 a:hover {
  text-decoration: underline;
}

.card p {
  margin: 0;
  color: #586069;
  font-size: 0.9rem;
}

.info-box {
  background: #f1f8ff;
  border: 1px solid #c8e1ff;
  border-radius: 8px;
  padding: 1rem;
  margin: 2rem 0;
}

.info-box h4 {
  margin: 0 0 0.5rem 0;
  color: #0366d6;
}
</style>