# GrapesJS Rendering Architecture Documentation

**Last Updated**: August 5, 2025  
**Version**: v1.10.40  
**Status**: Production Ready

## 📋 Table of Contents

1. [Overview](#overview)
2. [Architecture Decision](#architecture-decision)
3. [Component Rendering Pipeline](#component-rendering-pipeline)
4. [SDK Component Support](#sdk-component-support)
5. [Testing Checklist](#testing-checklist)
6. [Troubleshooting Guide](#troubleshooting-guide)

## 🎯 Overview

InvestorPrez uses a **hybrid rendering approach** that combines:

- **GrapesJS Editor**: For creating and editing presentations
- **Custom Rendering Pipeline**: For publishing static HTML presentations
- **Data Isolation**: Each presentation's data is completely isolated

### Why Custom Rendering?

We use custom rendering instead of GrapesJS native export for several critical reasons:

1. **Data Isolation**: Prevents cross-presentation data contamination
2. **Security**: Server-side rendering prevents client-side tampering
3. **Performance**: Optimized HTML generation without editor overhead
4. **Flexibility**: Custom handling for special components and embeds

## 🏗️ Architecture Decision

### Storage Configuration

```javascript
// CRITICAL: Data isolation configuration
storageManager: {
  type: "none";
}
```

This configuration ensures:

- No local storage persistence
- No cross-presentation data leakage
- Complete control over save/load operations

### Rendering Flow

```
Editor → JSON Data → Backend Publishing Service → Static HTML
```

1. **Editor**: User creates presentation with GrapesJS
2. **Save**: Component tree saved as JSON to database
3. **Publish**: Backend converts JSON to optimized HTML
4. **Serve**: Static HTML served with no JavaScript dependencies

## 🔧 Component Rendering Pipeline

### Core `renderComponent()` Function

Located in `/backend/src/services/publishingService.js`, this function:

1. **Handles Component Types**
   - Text nodes
   - SVG elements
   - SDK plugin components
   - Standard HTML elements

2. **Attribute Processing**
   - Preserves component IDs
   - Maintains CSS classes
   - Handles data attributes
   - Processes inline styles

3. **Special Handling**
   - Smart tag detection for text elements
   - Link processing (external vs internal)
   - Embed code injection
   - Interactive element preservation

### Component Detection Strategy

```javascript
// Multiple detection methods for robustness
const isIconifyComponent =
  component.type === "iconify" ||
  component.attributes?.["data-type-iconify"] !== undefined;
```

## 🎨 SDK Component Support

### Fully Supported SDK Components (v1.10.40)

#### 1. **Iconify Components**

- **Detection**: `data-type-iconify` attribute
- **Structure**: `<div><svg>...</svg></div>`
- **Fallback**: Info icon when SVG missing
- **CSS**: Proper sizing (1em x 1em)

#### 2. **Accordion Components**

- **Detection**: `data-type-role="accordion"`
- **Structure**: `<details>/<summary>` elements
- **Marker**: Arrow SVG with rotation animation
- **Fallback**: Default chevron arrow

#### 3. **List Pages Navigation**

- **Detection**: `data-type-role="list-pages"`
- **Structure**: `<ul>/<li>/<a>` hierarchy
- **Functionality**: Page navigation links
- **Issue**: Doesn't update dynamically (pending fix)

#### 4. **LightGallery**

- **Detection**: `data-lightgallery` attribute
- **Init**: Dynamic script loading
- **Config**: Full plugin suite with license
- **Status**: Fully functional

#### 5. **FSLightbox**

- **Detection**: `data-fslightbox` attribute
- **Structure**: `<a>` with lightbox attributes
- **Init**: Automatic via data attributes
- **Status**: Fully functional

#### 6. **Animation Components**

- **Detection**: `data-type-role="animation"`
- **Config**: CSS variables for control
- **Features**: Scroll-triggered animations
- **Status**: Fully functional

#### 7. **Flex Layout Components**

- **Detection**: `data-type-role="flex-row/column"`
- **Structure**: Flexbox containers
- **CSS**: Direction and alignment
- **Status**: Fully functional

## 🧪 Testing Checklist

### SDK Components (✅ Tested & Working)

- [x] Iconify icons display correctly
- [x] Accordion expand/collapse works
- [x] Accordion arrows show to the right
- [x] LightGallery opens in lightbox
- [x] FSLightbox functionality
- [x] Animation triggers on scroll
- [x] Flex layouts render properly
- [ ] List Pages updates dynamically

### Standard Components (Need Testing)

- [ ] Text components (h1-h6, p)
- [ ] Images (standard & responsive)
- [ ] Links (internal & external)
- [ ] Buttons (all variations)
- [ ] Forms and inputs
- [ ] Tables
- [ ] Videos
- [ ] Maps
- [ ] Custom embeds
- [ ] Charts (bar, pie, line)

### Layout Components (Need Testing)

- [ ] Sections
- [ ] Containers
- [ ] Rows & Columns
- [ ] Grid layouts
- [ ] Spacing & padding

### Styling (Need Testing)

- [ ] Typography presets
- [ ] Color variables
- [ ] Custom CSS
- [ ] Responsive behavior
- [ ] Hover states
- [ ] Animations

## 🔍 Troubleshooting Guide

### Component Not Rendering

1. **Check Detection**

   ```javascript
   console.log("Component type:", component.type);
   console.log("Attributes:", component.attributes);
   ```

2. **Verify Structure**
   - Is tagName set correctly?
   - Are attributes preserved?
   - Is content/children handled?

3. **CSS Issues**
   - Check generateGrapesJSPluginCSS()
   - Verify selectors match attributes
   - Use !important if needed

### Missing Content

1. **SVG Components**
   - Check if SVG stored as child or content
   - Verify xmlns attribute
   - Use fallback SVG if missing

2. **Text Content**
   - Check textnode handling
   - Verify content vs components
   - Handle HTML content properly

### JavaScript Not Working

1. **Initialization**
   - Check generateComponentInitScripts()
   - Verify script loading order
   - Check for console errors

2. **Dependencies**
   - Ensure CDN scripts load
   - Check version compatibility
   - Verify license keys

## 📊 Version History

- **v1.10.38**: Initial SDK component fixes
- **v1.10.39**: LightGallery and CSS enhancements
- **v1.10.40**: SVG fallbacks for missing content

## 🚀 Future Enhancements

1. **Dynamic Page Navigation**: Real-time updates when pages change
2. **Component Library**: Comprehensive testing of all blocks
3. **Performance**: Optimize rendering for large presentations
4. **Caching**: Implement smart caching for published content

## 🔗 Related Documentation

- [GrapesJS SDK Docs](/docs/03-reference/GrapesJS_SDK_Docs/)
- [Publishing Service Guide](/docs/02-development/PUBLISHING_SERVICE.md)
- [Testing Procedures](/docs/03-reference/TESTING_PROCEDURES.md)
