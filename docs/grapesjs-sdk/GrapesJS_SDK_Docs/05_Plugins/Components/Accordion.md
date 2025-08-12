# Accordion Component Plugin

*Last Updated: August 12, 2025*
*Status: Current - GrapesJS SDK Reference Documentation*

## Overview

The Accordion component plugin provides collapsible content sections for GrapesJS Studio SDK. This plugin enables you to create expandable/collapsible panels that are perfect for FAQs, content organization, and space-saving layouts.

## Compatibility

- **Project Types**: `web`, `email`
- **Plan**: Startup plan
- **License**: Optional license key for use outside Studio SDK

## Features

- **Collapsible Sections**: Create expandable content panels
- **Multiple Modes**: Single or multiple panels open simultaneously
- **Smooth Animations**: Configurable expand/collapse animations
- **Keyboard Navigation**: Full keyboard accessibility
- **Icons Support**: Customizable expand/collapse indicators
- **Nested Accordions**: Support for accordion within accordion
- **Responsive Design**: Mobile-optimized collapse behavior

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
import { componentAccordion } from '@grapesjs/studio-sdk-plugins';
import createStudioEditor from '@grapesjs/studio-sdk';

createStudioEditor({
  plugins: [
    componentAccordion
  ],
  project: {
    type: 'web',
    default: {
      pages: [
        { name: 'Home', component: '<div>Accordion content here</div>' }
      ]
    }
  }
});
```

### React Integration

```javascript
import StudioEditor from '@grapesjs/studio-sdk/react';
import { componentAccordion } from '@grapesjs/studio-sdk-plugins';

<StudioEditor
  options={{
    plugins: [componentAccordion],
    project: {
      type: 'web',
      default: {
        pages: [{
          name: 'FAQ Page',
          component: `
            <div data-gjs-type="accordion" data-accordion-mode="single">
              <div data-gjs-type="accordion-item" data-expanded="true">
                <div data-gjs-type="accordion-header">
                  <h3>What is GrapesJS?</h3>
                  <span data-gjs-type="accordion-icon">▼</span>
                </div>
                <div data-gjs-type="accordion-content">
                  <p>GrapesJS is a free and open source Web Builder Framework.</p>
                </div>
              </div>
              <div data-gjs-type="accordion-item">
                <div data-gjs-type="accordion-header">
                  <h3>How does it work?</h3>
                  <span data-gjs-type="accordion-icon">▼</span>
                </div>
                <div data-gjs-type="accordion-content">
                  <p>It uses a drag-and-drop interface to build web pages visually.</p>
                </div>
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
| `defaultMode` | `string` | Default accordion mode (`'single'` or `'multiple'`) |
| `animationDuration` | `number` | Animation duration in ms (default: `300`) |
| `defaultExpanded` | `boolean` | Whether first item is expanded by default |
| `iconPosition` | `string` | Icon position (`'left'` or `'right'`) |
| `customIcons` | `object` | Custom expand/collapse icons |

### Example with Options

```javascript
plugins: [
  componentAccordion.init({
    licenseKey: 'your-license-key',
    block: {
      category: 'Layout',
      label: 'Accordion',
      media: '<svg>...</svg>'
    },
    defaultMode: 'single',
    animationDuration: 400,
    defaultExpanded: true,
    iconPosition: 'right',
    customIcons: {
      expand: '+',
      collapse: '-'
    }
  })
]
```

## Component Structure

### 1. Accordion Container

The main wrapper for all accordion items:

```html
<div data-gjs-type="accordion" 
     data-accordion-mode="single"
     data-accordion-animated="true">
  <!-- Accordion items here -->
</div>
```

### 2. Accordion Item

Individual collapsible section:

```html
<div data-gjs-type="accordion-item" 
     data-expanded="false">
  <!-- Header and content here -->
</div>
```

### 3. Accordion Header

Clickable header that toggles content:

```html
<div data-gjs-type="accordion-header">
  <h3>Section Title</h3>
  <span data-gjs-type="accordion-icon">▼</span>
</div>
```

### 4. Accordion Content

The collapsible content area:

```html
<div data-gjs-type="accordion-content">
  <p>Your content goes here...</p>
</div>
```

## Styling

### Default Styles

```css
/* Accordion container */
.gs-accordion {
  border: 1px solid #e0e0e0;
  border-radius: 4px;
  overflow: hidden;
}

/* Accordion item */
.gs-accordion-item {
  border-bottom: 1px solid #e0e0e0;
}

.gs-accordion-item:last-child {
  border-bottom: none;
}

/* Accordion header */
.gs-accordion-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 1rem;
  background: #f5f5f5;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.gs-accordion-header:hover {
  background: #eeeeee;
}

.gs-accordion-item[data-expanded="true"] .gs-accordion-header {
  background: #e8e8e8;
}

/* Accordion content */
.gs-accordion-content {
  padding: 0 1rem;
  max-height: 0;
  overflow: hidden;
  transition: max-height 0.3s ease, padding 0.3s ease;
}

.gs-accordion-item[data-expanded="true"] .gs-accordion-content {
  padding: 1rem;
  max-height: 1000px; /* Adjust based on content */
}

/* Accordion icon */
.gs-accordion-icon {
  transition: transform 0.3s ease;
}

.gs-accordion-item[data-expanded="true"] .gs-accordion-icon {
  transform: rotate(180deg);
}
```

### Custom Themes

```javascript
// Dark theme
editor.CssComposer.add(`
  .accordion-dark {
    background: #1a1a1a;
    border-color: #333;
  }
  
  .accordion-dark .gs-accordion-header {
    background: #2a2a2a;
    color: #fff;
  }
  
  .accordion-dark .gs-accordion-header:hover {
    background: #333;
  }
  
  .accordion-dark .gs-accordion-content {
    background: #1a1a1a;
    color: #fff;
  }
`);
```

## Advanced Examples

### 1. FAQ Accordion

```html
<div data-gjs-type="accordion" class="faq-accordion">
  <div data-gjs-type="accordion-item">
    <div data-gjs-type="accordion-header">
      <h4>❓ How do I get started?</h4>
      <span data-gjs-type="accordion-icon">+</span>
    </div>
    <div data-gjs-type="accordion-content">
      <p>Getting started is easy! Simply install the SDK and follow our quick start guide.</p>
      <a href="/docs/getting-started">View Documentation →</a>
    </div>
  </div>
  <div data-gjs-type="accordion-item">
    <div data-gjs-type="accordion-header">
      <h4>💰 What are the pricing options?</h4>
      <span data-gjs-type="accordion-icon">+</span>
    </div>
    <div data-gjs-type="accordion-content">
      <p>We offer flexible pricing plans:</p>
      <ul>
        <li>Free tier for personal projects</li>
        <li>Pro plan for small teams</li>
        <li>Enterprise for large organizations</li>
      </ul>
    </div>
  </div>
</div>
```

### 2. Product Features Accordion

```html
<div data-gjs-type="accordion" data-accordion-mode="multiple" class="features-accordion">
  <div data-gjs-type="accordion-item" data-expanded="true">
    <div data-gjs-type="accordion-header">
      <div class="feature-header">
        <img src="/icons/performance.svg" alt="Performance">
        <h3>High Performance</h3>
      </div>
      <span data-gjs-type="accordion-icon">▼</span>
    </div>
    <div data-gjs-type="accordion-content">
      <p>Lightning-fast load times with optimized code delivery.</p>
      <ul>
        <li>Lazy loading</li>
        <li>Code splitting</li>
        <li>CDN integration</li>
      </ul>
    </div>
  </div>
  <div data-gjs-type="accordion-item">
    <div data-gjs-type="accordion-header">
      <div class="feature-header">
        <img src="/icons/security.svg" alt="Security">
        <h3>Enterprise Security</h3>
      </div>
      <span data-gjs-type="accordion-icon">▼</span>
    </div>
    <div data-gjs-type="accordion-content">
      <p>Bank-level security to protect your data.</p>
      <ul>
        <li>End-to-end encryption</li>
        <li>Regular security audits</li>
        <li>SOC 2 compliance</li>
      </ul>
    </div>
  </div>
</div>
```

### 3. Nested Accordions

```html
<div data-gjs-type="accordion" class="main-accordion">
  <div data-gjs-type="accordion-item">
    <div data-gjs-type="accordion-header">
      <h3>Main Category 1</h3>
    </div>
    <div data-gjs-type="accordion-content">
      <!-- Nested accordion -->
      <div data-gjs-type="accordion" class="nested-accordion">
        <div data-gjs-type="accordion-item">
          <div data-gjs-type="accordion-header">
            <h4>Subcategory 1.1</h4>
          </div>
          <div data-gjs-type="accordion-content">
            <p>Nested content here...</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
```

## JavaScript API

### Programmatic Control

```javascript
// Expand specific item
editor.runCommand('accordion:expand', { 
  accordionId: 'my-accordion',
  itemIndex: 0 
});

// Collapse specific item
editor.runCommand('accordion:collapse', { 
  accordionId: 'my-accordion',
  itemIndex: 0 
});

// Toggle item
editor.runCommand('accordion:toggle', { 
  accordionId: 'my-accordion',
  itemIndex: 0 
});

// Expand all items
editor.runCommand('accordion:expandAll', { 
  accordionId: 'my-accordion' 
});

// Collapse all items
editor.runCommand('accordion:collapseAll', { 
  accordionId: 'my-accordion' 
});
```

### Events

```javascript
// Item expanded
editor.on('accordion:expand', (accordion, item, index) => {
  console.log(`Item ${index} expanded in accordion:`, accordion.getId());
});

// Item collapsed
editor.on('accordion:collapse', (accordion, item, index) => {
  console.log(`Item ${index} collapsed`);
});

// Before expand (cancelable)
editor.on('accordion:before-expand', (accordion, item, event) => {
  // Conditionally prevent expansion
  if (someCondition) {
    event.preventDefault();
  }
});
```

### Custom Behaviors

```javascript
// Auto-collapse siblings in custom mode
editor.on('accordion:expand', (accordion, expandedItem) => {
  if (accordion.get('custom-mode') === 'exclusive') {
    accordion.components().forEach((item) => {
      if (item !== expandedItem && item.get('expanded')) {
        editor.runCommand('accordion:collapse', { 
          component: item 
        });
      }
    });
  }
});
```

## Configuration Examples

### 1. Simple FAQ Configuration

```javascript
const faqAccordion = {
  type: 'accordion',
  attributes: { 
    class: 'faq-section',
    'data-accordion-mode': 'single'
  },
  components: [
    {
      type: 'accordion-item',
      components: [
        {
          type: 'accordion-header',
          components: [
            { tagName: 'h4', content: 'Question 1?' },
            { type: 'accordion-icon', content: '+' }
          ]
        },
        {
          type: 'accordion-content',
          components: [
            { tagName: 'p', content: 'Answer to question 1...' }
          ]
        }
      ]
    }
  ]
};
```

### 2. Feature List Configuration

```javascript
const featureAccordion = {
  type: 'accordion',
  attributes: {
    'data-accordion-mode': 'multiple',
    'data-accordion-animated': true
  },
  components: features.map(feature => ({
    type: 'accordion-item',
    attributes: { 'data-expanded': feature.defaultOpen },
    components: [
      {
        type: 'accordion-header',
        components: [
          {
            tagName: 'div',
            attributes: { class: 'feature-info' },
            components: [
              { tagName: 'img', attributes: { src: feature.icon } },
              { tagName: 'h3', content: feature.title }
            ]
          },
          { type: 'accordion-icon' }
        ]
      },
      {
        type: 'accordion-content',
        components: feature.content
      }
    ]
  }))
};
```

## Best Practices

### 1. **Accessibility**

```html
<!-- ARIA attributes for screen readers -->
<div data-gjs-type="accordion" role="region" aria-label="Frequently Asked Questions">
  <div data-gjs-type="accordion-item">
    <div data-gjs-type="accordion-header" 
         role="button"
         aria-expanded="false"
         aria-controls="panel-1">
      <h3 id="accordion-header-1">Question?</h3>
    </div>
    <div data-gjs-type="accordion-content"
         id="panel-1"
         role="region"
         aria-labelledby="accordion-header-1">
      <p>Answer...</p>
    </div>
  </div>
</div>
```

### 2. **Performance**

```javascript
// Lazy load accordion content
editor.on('accordion:before-expand', async (accordion, item) => {
  if (!item.get('content-loaded')) {
    const content = await fetchAccordionContent(item.getId());
    item.find('[data-gjs-type="accordion-content"]')[0].components(content);
    item.set('content-loaded', true);
  }
});
```

### 3. **Mobile Optimization**

```css
@media (max-width: 768px) {
  .gs-accordion-header {
    padding: 0.75rem;
    font-size: 0.9rem;
  }
  
  .gs-accordion-content {
    padding: 0.75rem;
  }
  
  /* Larger touch targets */
  .gs-accordion-header {
    min-height: 48px;
  }
}
```

## Animations

### Custom Animation Effects

```css
/* Slide animation */
.accordion-slide .gs-accordion-content {
  transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
}

/* Fade animation */
.accordion-fade .gs-accordion-content {
  opacity: 0;
  transition: opacity 0.3s ease, max-height 0.3s ease;
}

.accordion-fade .gs-accordion-item[data-expanded="true"] .gs-accordion-content {
  opacity: 1;
}

/* Bounce animation */
@keyframes bounceIn {
  0% { transform: scaleY(0.9); opacity: 0; }
  50% { transform: scaleY(1.05); }
  100% { transform: scaleY(1); opacity: 1; }
}

.accordion-bounce .gs-accordion-item[data-expanded="true"] .gs-accordion-content {
  animation: bounceIn 0.4s ease;
}
```

## Troubleshooting

### Common Issues

1. **Animation not smooth**
   - Use `max-height` instead of `height` for transitions
   - Ensure content has defined height
   - Check for CSS conflicts

2. **Click not working**
   - Verify event listeners are attached
   - Check z-index issues
   - Ensure no overlapping elements

3. **Content cut off**
   - Adjust max-height values
   - Use overflow: visible when expanded
   - Check padding calculations

### Debug Mode

```javascript
plugins: [
  componentAccordion.init({
    debug: true,
    logEvents: true
  })
]
```

## Integration with InvestorPrez

Accordion components enhance InvestorPrez presentations:

### Use Cases

1. **Company Information**
   - Team member bios
   - Department overviews
   - Timeline/milestones

2. **Financial Data**
   - Quarterly reports
   - Revenue breakdowns
   - Investment terms

3. **Product Features**
   - Feature explanations
   - Technical specifications
   - Pricing tiers

### Example Implementation

```javascript
// Investment terms accordion
const investmentAccordion = {
  type: 'accordion',
  attributes: { class: 'investment-terms' },
  components: [
    {
      type: 'accordion-item',
      components: [
        {
          type: 'accordion-header',
          components: [
            { tagName: 'h3', content: 'Minimum Investment' },
            { type: 'accordion-icon' }
          ]
        },
        {
          type: 'accordion-content',
          components: [
            { tagName: 'p', content: '$50,000 minimum investment' },
            { tagName: 'p', content: 'Accredited investors only' }
          ]
        }
      ]
    },
    {
      type: 'accordion-item',
      components: [
        {
          type: 'accordion-header',
          components: [
            { tagName: 'h3', content: 'Expected Returns' },
            { type: 'accordion-icon' }
          ]
        },
        {
          type: 'accordion-content',
          components: [
            { tagName: 'p', content: '25-35% annual ROI projected' },
            { tagName: 'p', content: 'Based on current market analysis' }
          ]
        }
      ]
    }
  ]
};
```

## Related Documentation

- [Components Overview](../../03_Configuration/Components/Configuration_Components_Overview.md)
- [Animation](../Animation.md) - Animation effects
- [Layout Components](../../03_Configuration/Layout/Configuration_Layout_Components.md)

## Resources

- [ARIA Accordion Pattern](https://www.w3.org/WAI/ARIA/apg/patterns/accordion/)
- [Accordion Best Practices](https://inclusive-components.design/collapsible-sections/)
- [CSS Transitions](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Transitions)