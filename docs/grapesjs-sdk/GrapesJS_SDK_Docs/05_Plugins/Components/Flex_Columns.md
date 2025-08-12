# Flex Columns Component Plugin

*Last Updated: August 12, 2025*
*Status: Current - GrapesJS SDK Reference Documentation*

## Overview

The Flex Columns component plugin provides advanced flexbox-based column layouts for GrapesJS Studio SDK. This plugin enables creation of responsive, flexible column systems with intuitive controls for gap spacing, alignment, wrapping, and responsive breakpoints.

## Compatibility

- **Project Types**: `web`, `email`
- **Plan**: Startup plan
- **License**: Optional license key for use outside Studio SDK

## Features

- **Flexible Layouts**: Create 1-12 column layouts with flexbox
- **Responsive Design**: Built-in breakpoint system for mobile, tablet, desktop
- **Gap Control**: Adjustable spacing between columns
- **Alignment Options**: Full control over horizontal and vertical alignment  
- **Wrap Behavior**: Configure how columns wrap on smaller screens
- **Nested Columns**: Support for columns within columns
- **Equal Height**: Automatic equal height columns
- **Order Control**: Reorder columns without changing HTML

## Installation

```bash
# npm
npm i @grapesjs/studio-sdk-plugins

# pnpm
pnpm add @grapesjs/studio-sdk-plugins

# yarn
yarn add @grapesjs/studio-sdk-plugins
```

## Usage

### Basic Setup

```javascript
import { componentFlexColumns } from '@grapesjs/studio-sdk-plugins';
import createStudioEditor from '@grapesjs/studio-sdk';

createStudioEditor({
  plugins: [
    componentFlexColumns
  ],
  project: {
    type: 'web',
    default: {
      pages: [
        { name: 'Home', component: '<div>Flex columns here</div>' }
      ]
    }
  }
});
```

### React Integration

```javascript
import StudioEditor from '@grapesjs/studio-sdk/react';
import { componentFlexColumns } from '@grapesjs/studio-sdk-plugins';

<StudioEditor
  options={{
    plugins: [componentFlexColumns],
    project: {
      type: 'web',
      default: {
        pages: [{
          name: 'Layout Page',
          component: `
            <div data-gjs-type="flex-container" class="flex-container">
              <div data-gjs-type="flex-column" class="flex-column" style="flex: 1;">
                <h2>Column 1</h2>
                <p>Content for the first column.</p>
              </div>
              <div data-gjs-type="flex-column" class="flex-column" style="flex: 1;">
                <h2>Column 2</h2>
                <p>Content for the second column.</p>
              </div>
              <div data-gjs-type="flex-column" class="flex-column" style="flex: 1;">
                <h2>Column 3</h2>
                <p>Content for the third column.</p>
              </div>
            </div>
          `
        }]
      }
    }
  }}
/>
```

## Plugin Options

| Option | Type | Description |
|--------|------|-------------|
| `licenseKey` | `string` | Optional license key for use outside Studio SDK |
| `block` | `object` | Block configuration or `false` to skip |
| `maxColumns` | `number` | Maximum number of columns (default: `12`) |
| `defaultColumns` | `number` | Default number of columns (default: `3`) |
| `breakpoints` | `object` | Responsive breakpoint definitions |
| `defaultGap` | `string` | Default gap between columns (default: `1rem`) |

### Example with Options

```javascript
plugins: [
  componentFlexColumns.init({
    licenseKey: 'your-license-key',
    block: {
      category: 'Layout',
      label: 'Flex Columns',
      media: '<svg>...</svg>'
    },
    maxColumns: 12,
    defaultColumns: 3,
    breakpoints: {
      mobile: 576,
      tablet: 768,
      desktop: 992,
      wide: 1200
    },
    defaultGap: '1.5rem'
  })
]
```

## Component Structure

### 1. Flex Container

The main wrapper for columns:

```html
<div data-gjs-type="flex-container" 
     class="flex-container"
     style="display: flex; gap: 1rem; flex-wrap: wrap;">
  <!-- Columns here -->
</div>
```

### 2. Flex Column

Individual column within container:

```html
<div data-gjs-type="flex-column" 
     class="flex-column"
     style="flex: 1 1 300px;">
  <!-- Column content -->
</div>
```

## Layout Patterns

### 1. Equal Width Columns

```javascript
const equalColumns = {
  type: 'flex-container',
  style: {
    display: 'flex',
    gap: '1rem',
    'flex-wrap': 'wrap'
  },
  components: [
    {
      type: 'flex-column',
      style: { flex: '1 1 0' },
      components: [{ tagName: 'p', content: 'Equal width column 1' }]
    },
    {
      type: 'flex-column',
      style: { flex: '1 1 0' },
      components: [{ tagName: 'p', content: 'Equal width column 2' }]
    },
    {
      type: 'flex-column',
      style: { flex: '1 1 0' },
      components: [{ tagName: 'p', content: 'Equal width column 3' }]
    }
  ]
};
```

### 2. Asymmetric Layout

```javascript
const asymmetricLayout = {
  type: 'flex-container',
  style: {
    display: 'flex',
    gap: '2rem',
    'align-items': 'stretch'
  },
  components: [
    {
      type: 'flex-column',
      style: { flex: '2 1 400px' }, // Takes 2x space
      components: [
        { tagName: 'h2', content: 'Main Content' },
        { tagName: 'p', content: 'This column takes up more space.' }
      ]
    },
    {
      type: 'flex-column',
      style: { flex: '1 1 200px' }, // Takes 1x space
      components: [
        { tagName: 'h3', content: 'Sidebar' },
        { tagName: 'p', content: 'Smaller sidebar column.' }
      ]
    }
  ]
};
```

### 3. Responsive Grid

```javascript
const responsiveGrid = {
  type: 'flex-container',
  attributes: {
    class: 'responsive-grid'
  },
  style: {
    display: 'flex',
    gap: '1.5rem',
    'flex-wrap': 'wrap'
  },
  components: Array(6).fill(null).map((_, i) => ({
    type: 'flex-column',
    attributes: {
      class: 'grid-item'
    },
    style: {
      flex: '1 1 300px', // Min width 300px
      'min-width': '250px'
    },
    components: [
      { tagName: 'h3', content: `Item ${i + 1}` },
      { tagName: 'p', content: 'Responsive grid item content.' }
    ]
  }))
};
```

## Styling

### Base Styles

```css
/* Container styles */
.flex-container {
  display: flex;
  flex-wrap: wrap;
  margin: -0.5rem; /* Negative margin for gap simulation */
}

.flex-column {
  padding: 0.5rem; /* Padding for gap simulation */
  box-sizing: border-box;
}

/* Alignment utilities */
.flex-container.align-start { align-items: flex-start; }
.flex-container.align-center { align-items: center; }
.flex-container.align-end { align-items: flex-end; }
.flex-container.align-stretch { align-items: stretch; }

.flex-container.justify-start { justify-content: flex-start; }
.flex-container.justify-center { justify-content: center; }
.flex-container.justify-end { justify-content: flex-end; }
.flex-container.justify-between { justify-content: space-between; }
.flex-container.justify-around { justify-content: space-around; }

/* Gap utilities */
.gap-0 { gap: 0; }
.gap-1 { gap: 0.5rem; }
.gap-2 { gap: 1rem; }
.gap-3 { gap: 1.5rem; }
.gap-4 { gap: 2rem; }
.gap-5 { gap: 3rem; }
```

### Responsive Styles

```css
/* Mobile first approach */
.flex-column {
  flex: 1 1 100%;
}

/* Tablet */
@media (min-width: 768px) {
  .flex-column {
    flex: 1 1 50%;
  }
  
  .flex-column.tablet-full {
    flex: 1 1 100%;
  }
  
  .flex-column.tablet-third {
    flex: 1 1 33.333%;
  }
}

/* Desktop */
@media (min-width: 992px) {
  .flex-column {
    flex: 1 1 33.333%;
  }
  
  .flex-column.desktop-quarter {
    flex: 1 1 25%;
  }
  
  .flex-column.desktop-half {
    flex: 1 1 50%;
  }
}

/* Wide screens */
@media (min-width: 1200px) {
  .flex-column.wide-sixth {
    flex: 1 1 16.666%;
  }
}
```

## Advanced Features

### 1. Nested Columns

```html
<div data-gjs-type="flex-container">
  <div data-gjs-type="flex-column" style="flex: 2;">
    <h2>Main Section</h2>
    <!-- Nested columns -->
    <div data-gjs-type="flex-container" style="gap: 0.5rem;">
      <div data-gjs-type="flex-column">
        <p>Nested 1</p>
      </div>
      <div data-gjs-type="flex-column">
        <p>Nested 2</p>
      </div>
    </div>
  </div>
  <div data-gjs-type="flex-column" style="flex: 1;">
    <h3>Sidebar</h3>
  </div>
</div>
```

### 2. Column Ordering

```javascript
// Responsive column ordering
const orderedColumns = {
  type: 'flex-container',
  components: [
    {
      type: 'flex-column',
      attributes: { class: 'order-2 order-md-1' },
      components: [{ tagName: 'h2', content: 'Sidebar (appears second on mobile)' }]
    },
    {
      type: 'flex-column',
      attributes: { class: 'order-1 order-md-2' },
      components: [{ tagName: 'h2', content: 'Main Content (appears first on mobile)' }]
    }
  ]
};
```

CSS for ordering:
```css
.order-1 { order: 1; }
.order-2 { order: 2; }

@media (min-width: 768px) {
  .order-md-1 { order: 1; }
  .order-md-2 { order: 2; }
}
```

### 3. Auto-sizing Columns

```javascript
const autoSizeColumns = {
  type: 'flex-container',
  style: {
    display: 'flex',
    gap: '1rem'
  },
  components: [
    {
      type: 'flex-column',
      style: { flex: '0 0 auto' }, // Fixed width based on content
      components: [{ tagName: 'button', content: 'Fixed Width' }]
    },
    {
      type: 'flex-column',
      style: { flex: '1 1 auto' }, // Flexible width
      components: [{ tagName: 'p', content: 'This column expands to fill space' }]
    },
    {
      type: 'flex-column',
      style: { flex: '0 0 200px' }, // Fixed 200px width
      components: [{ tagName: 'p', content: 'Fixed 200px' }]
    }
  ]
};
```

## Configuration API

### Column Properties

```javascript
// Set column properties
editor.on('component:selected', (component) => {
  if (component.get('type') === 'flex-column') {
    // Update flex properties
    component.setStyle({
      'flex-grow': '2',
      'flex-shrink': '1',
      'flex-basis': '300px'
    });
  }
});
```

### Container Properties

```javascript
// Configure container
editor.on('component:selected', (component) => {
  if (component.get('type') === 'flex-container') {
    component.setStyle({
      'flex-direction': 'row', // row, column, row-reverse, column-reverse
      'flex-wrap': 'wrap', // nowrap, wrap, wrap-reverse
      'align-items': 'stretch', // flex-start, center, flex-end, stretch
      'justify-content': 'space-between', // flex-start, center, flex-end, space-between, space-around
      'gap': '2rem'
    });
  }
});
```

## Trait System

### Custom Traits for Flex Components

```javascript
editor.DomComponents.addType('flex-container', {
  model: {
    defaults: {
      traits: [
        {
          type: 'select',
          label: 'Direction',
          name: 'flex-direction',
          options: [
            { value: 'row', name: 'Row' },
            { value: 'column', name: 'Column' },
            { value: 'row-reverse', name: 'Row Reverse' },
            { value: 'column-reverse', name: 'Column Reverse' }
          ]
        },
        {
          type: 'select',
          label: 'Wrap',
          name: 'flex-wrap',
          options: [
            { value: 'nowrap', name: 'No Wrap' },
            { value: 'wrap', name: 'Wrap' },
            { value: 'wrap-reverse', name: 'Wrap Reverse' }
          ]
        },
        {
          type: 'select',
          label: 'Gap',
          name: 'gap',
          options: [
            { value: '0', name: 'None' },
            { value: '0.5rem', name: 'Small' },
            { value: '1rem', name: 'Medium' },
            { value: '2rem', name: 'Large' },
            { value: '3rem', name: 'Extra Large' }
          ]
        }
      ]
    }
  }
});
```

## Presets

### 1. Hero Section

```javascript
const heroSection = {
  type: 'flex-container',
  attributes: { class: 'hero-section' },
  style: {
    'min-height': '500px',
    'align-items': 'center',
    'gap': '2rem'
  },
  components: [
    {
      type: 'flex-column',
      style: { flex: '1 1 400px' },
      components: [
        { tagName: 'h1', content: 'Welcome to Our Site' },
        { tagName: 'p', content: 'Discover amazing features and benefits.' },
        { tagName: 'button', content: 'Get Started' }
      ]
    },
    {
      type: 'flex-column',
      style: { flex: '1 1 400px' },
      components: [{
        tagName: 'img',
        attributes: { src: 'hero-image.jpg', alt: 'Hero' }
      }]
    }
  ]
};
```

### 2. Feature Cards

```javascript
const featureCards = {
  type: 'flex-container',
  attributes: { class: 'feature-cards' },
  style: {
    gap: '2rem',
    'flex-wrap': 'wrap'
  },
  components: features.map(feature => ({
    type: 'flex-column',
    attributes: { class: 'feature-card' },
    style: {
      flex: '1 1 300px',
      padding: '2rem',
      background: '#f5f5f5',
      'border-radius': '8px'
    },
    components: [
      { tagName: 'h3', content: feature.title },
      { tagName: 'p', content: feature.description },
      { tagName: 'a', content: 'Learn More →', attributes: { href: feature.link } }
    ]
  }))
};
```

### 3. Pricing Table

```javascript
const pricingTable = {
  type: 'flex-container',
  attributes: { class: 'pricing-table' },
  style: {
    gap: '0',
    'align-items': 'stretch'
  },
  components: [
    {
      type: 'flex-column',
      attributes: { class: 'pricing-tier basic' },
      style: { flex: '1', padding: '2rem', background: '#f9f9f9' },
      components: [
        { tagName: 'h3', content: 'Basic' },
        { tagName: 'div', content: '$9/mo', attributes: { class: 'price' } },
        { tagName: 'ul', components: [
          { tagName: 'li', content: 'Feature 1' },
          { tagName: 'li', content: 'Feature 2' }
        ]},
        { tagName: 'button', content: 'Choose Basic' }
      ]
    },
    {
      type: 'flex-column',
      attributes: { class: 'pricing-tier pro featured' },
      style: { flex: '1', padding: '2rem', background: '#007bff', color: '#fff' },
      components: [
        { tagName: 'h3', content: 'Pro' },
        { tagName: 'div', content: '$29/mo', attributes: { class: 'price' } },
        { tagName: 'ul', components: [
          { tagName: 'li', content: 'All Basic features' },
          { tagName: 'li', content: 'Feature 3' },
          { tagName: 'li', content: 'Feature 4' }
        ]},
        { tagName: 'button', content: 'Choose Pro' }
      ]
    }
  ]
};
```

## Best Practices

### 1. **Mobile-First Design**

```css
/* Start with mobile layout */
.flex-column {
  flex: 1 1 100%;
}

/* Add tablet/desktop layouts */
@media (min-width: 768px) {
  .flex-column {
    flex: 1 1 calc(50% - 1rem);
  }
}

@media (min-width: 992px) {
  .flex-column {
    flex: 1 1 calc(33.333% - 1rem);
  }
}
```

### 2. **Accessibility**

```html
<!-- Semantic HTML -->
<main data-gjs-type="flex-container" role="main">
  <article data-gjs-type="flex-column">
    <h2>Article Title</h2>
    <p>Content...</p>
  </article>
  <aside data-gjs-type="flex-column" role="complementary">
    <h3>Related Info</h3>
    <p>Sidebar content...</p>
  </aside>
</main>
```

### 3. **Performance**

```css
/* Use CSS Grid for complex layouts */
@supports (display: grid) {
  .use-grid .flex-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 2rem;
  }
}
```

## Troubleshooting

### Common Issues

1. **Columns not wrapping**
   - Add `flex-wrap: wrap` to container
   - Set minimum width on columns
   - Check for `white-space: nowrap`

2. **Unequal heights**
   - Use `align-items: stretch` on container
   - Remove explicit heights from columns
   - Check for margin collapsing

3. **Gap not working in older browsers**
   - Use margin/padding fallback
   - Consider using CSS Grid for modern layouts
   - Provide polyfill for flexbox gap

### Debug Mode

```javascript
plugins: [
  componentFlexColumns.init({
    debug: true,
    showGuides: true,
    highlightGaps: true
  })
]
```

## Integration with InvestorPrez

Flex Columns enhance InvestorPrez layouts:

### Use Cases

1. **Team Sections**
   - Team member cards in flexible grid
   - Department organization
   - Advisory board layout

2. **Feature Comparisons**
   - Side-by-side feature lists
   - Pricing tiers
   - Product variations

3. **Content Organization**
   - Multi-column text layouts
   - Image and text combinations
   - Responsive infographics

### Example Implementation

```javascript
// Investor highlights section
const investorHighlights = {
  type: 'flex-container',
  attributes: { class: 'investor-highlights' },
  style: {
    gap: '2rem',
    'margin': '3rem 0'
  },
  components: [
    {
      type: 'flex-column',
      style: { flex: '1', 'text-align': 'center' },
      components: [
        { tagName: 'h3', content: '$5M' },
        { tagName: 'p', content: 'Annual Revenue' }
      ]
    },
    {
      type: 'flex-column',
      style: { flex: '1', 'text-align': 'center' },
      components: [
        { tagName: 'h3', content: '50K+' },
        { tagName: 'p', content: 'Active Users' }
      ]
    },
    {
      type: 'flex-column',
      style: { flex: '1', 'text-align': 'center' },
      components: [
        { tagName: 'h3', content: '300%' },
        { tagName: 'p', content: 'YoY Growth' }
      ]
    }
  ]
};
```

## Related Documentation

- [Layout Components](../../03_Configuration/Layout/Configuration_Layout_Components.md)
- [Components Overview](../../03_Configuration/Components/Configuration_Components_Overview.md)
- [Grid Mode](../Grid-mode.md) - CSS Grid alternative

## Resources

- [Flexbox Guide](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)
- [Flexbox Patterns](https://flexboxpatterns.com/)
- [MDN Flexbox](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Flexible_Box_Layout)