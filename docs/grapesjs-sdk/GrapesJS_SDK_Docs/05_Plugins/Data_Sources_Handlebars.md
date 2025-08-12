# Handlebars Data Sources Plugin

*Last Updated: August 12, 2025*
*Status: Current - GrapesJS SDK Reference Documentation*

## Overview

The Handlebars data sources plugin enables importing and exporting data sources using the Handlebars template engine. This plugin allows you to create dynamic content with variable rendering, conditional statements, and collection iteration.

## Compatibility

- **Project Types**: `web`, `email`
- **Plan**: Startup plan
- **License**: Optional license key for use outside Studio SDK

## Features

- **Variable Rendering**: Display dynamic data using Handlebars expressions
- **Conditional Logic**: Show/hide content based on conditions
- **Collection Iteration**: Loop through arrays and objects
- **Template Preservation**: Maintains Handlebars syntax when exporting
- **Data Binding**: Connect UI elements to data sources

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
import { dataSourceHandlebars } from '@grapesjs/studio-sdk-plugins';
import createStudioEditor from '@grapesjs/studio-sdk';

createStudioEditor({
  plugins: [
    dataSourceHandlebars
  ],
  dataSources: {
    globalData: {
      user: { 
        firstName: 'Alice', 
        lastName: 'Johnson',
        isCustomer: true,
        email: 'alice@example.com'
      },
      products: [
        { name: 'Laptop Pro X15', price: 1200.0, category: 'Electronics' },
        { name: 'Wireless Mouse M2', price: 25.99, category: 'Accessories' },
        { name: 'USB-C Hub', price: 89.99, category: 'Accessories' }
      ],
      company: {
        name: 'TechCorp',
        website: 'https://techcorp.com',
        founded: 2020
      }
    }
  }
});
```

### React Integration

```javascript
import StudioEditor from '@grapesjs/studio-sdk/react';
import { dataSourceHandlebars } from '@grapesjs/studio-sdk-plugins';

<StudioEditor 
  options={{
    plugins: [dataSourceHandlebars],
    dataSources: {
      globalData: {
        // Your data structure
      }
    }
  }}
/>
```

## Plugin Options

| Option | Type | Description |
|--------|------|-------------|
| `licenseKey` | `string` | Optional license key for use outside Studio SDK |

### Example with Options

```javascript
plugins: [
  dataSourceHandlebars.init({
    licenseKey: 'your-license-key' // Only needed outside Studio SDK
  })
]
```

## Handlebars Syntax Support

### 1. Simple Variables

Display data from your data sources:

```handlebars
<!-- Basic variable -->
<h1>Welcome, {{ globalData.user.firstName }}!</h1>

<!-- Nested object access -->
<p>Email: {{ globalData.user.email }}</p>
<p>Company: {{ globalData.company.name }}</p>
```

### 2. Conditional Rendering

Show/hide content based on conditions:

```handlebars
<!-- Simple condition -->
{{#if globalData.user.isCustomer}}
  <div class="customer-badge">Premium Customer</div>
{{/if}}

<!-- If/else condition -->
{{#if globalData.user.isCustomer}}
  <p>Thank you for being a valued customer!</p>
{{else}}
  <p>Join our customer program today!</p>
{{/if}}

<!-- Multiple conditions -->
{{#if globalData.company.founded}}
  <p>Founded in {{ globalData.company.founded }}</p>
{{else}}
  <p>Established company</p>
{{/if}}
```

### 3. Collection Iteration

Loop through arrays and objects:

```handlebars
<!-- Basic loop -->
<h2>Our Products</h2>
<ul>
{{#each globalData.products}}
  <li>{{ name }} - ${{ price }}</li>
{{/each}}
</ul>

<!-- Loop with index -->
<div class="product-grid">
{{#each globalData.products}}
  <div class="product-item" data-index="{{ @index }}">
    <h3>{{ name }}</h3>
    <p class="price">${{ price }}</p>
    <span class="category">{{ category }}</span>
  </div>
{{/each}}
</div>

<!-- Conditional within loop -->
{{#each globalData.products}}
  {{#if (eq category 'Electronics')}}
    <div class="featured-product">
      <strong>{{ name }}</strong> - ${{ price }}
    </div>
  {{/if}}
{{/each}}
```

### 4. Advanced Patterns

```handlebars
<!-- Nested loops -->
{{#each globalData.categories}}
  <h2>{{ name }}</h2>
  {{#each products}}
    <p>{{ name }} - ${{ price }}</p>
  {{/each}}
{{/each}}

<!-- Helper functions -->
{{#with globalData.user}}
  <h1>{{ firstName }} {{ lastName }}</h1>
  <p>{{ email }}</p>
{{/with}}

<!-- Custom helpers (if supported) -->
<p>Total Products: {{ length globalData.products }}</p>
```

## Complete Example

### HTML Template with Handlebars

```html
<!DOCTYPE html>
<html>
<head>
  <title>{{ globalData.company.name }} - Products</title>
</head>
<body>
  <header>
    <h1>{{ globalData.company.name }}</h1>
    <p>Since {{ globalData.company.founded }}</p>
  </header>
  
  <main>
    {{#if globalData.user.isCustomer}}
      <div class="welcome-banner">
        <h2>Welcome back, {{ globalData.user.firstName }}!</h2>
        <p>Your email: {{ globalData.user.email }}</p>
      </div>
    {{/if}}
    
    <section class="products">
      <h2>Our Products</h2>
      <div class="product-grid">
        {{#each globalData.products}}
          <div class="product-card">
            <h3>{{ name }}</h3>
            <p class="price">${{ price }}</p>
            <p class="category">Category: {{ category }}</p>
            {{#if (gt price 100)}}
              <span class="premium-badge">Premium Item</span>
            {{/if}}
          </div>
        {{/each}}
      </div>
    </section>
  </main>
  
  <footer>
    <p>&copy; {{ globalData.company.name }} - Visit us at {{ globalData.company.website }}</p>
  </footer>
</body>
</html>
```

### Data Structure

```javascript
const dataSources = {
  globalData: {
    user: {
      firstName: 'Alice',
      lastName: 'Johnson', 
      email: 'alice@example.com',
      isCustomer: true
    },
    company: {
      name: 'TechCorp',
      website: 'https://techcorp.com',
      founded: 2020
    },
    products: [
      { name: 'Laptop Pro X15', price: 1200.0, category: 'Electronics' },
      { name: 'Wireless Mouse M2', price: 25.99, category: 'Accessories' },
      { name: 'USB-C Hub', price: 89.99, category: 'Accessories' },
      { name: 'Monitor 4K', price: 299.99, category: 'Electronics' }
    ]
  }
};
```

## Best Practices

### 1. Data Structure Organization

```javascript
// Organize data logically
const dataSources = {
  globalData: {
    // User information
    user: { /* user data */ },
    
    // Content data
    content: { /* page content */ },
    
    // Business data
    business: { /* company info */ },
    
    // Collections
    products: [ /* product list */ ],
    testimonials: [ /* testimonials */ ]
  }
};
```

### 2. Error Handling

```handlebars
<!-- Safe property access -->
{{#if globalData.user}}
  <p>Welcome, {{ globalData.user.firstName }}!</p>
{{else}}
  <p>Welcome, Guest!</p>
{{/if}}

<!-- Default values -->
<h1>{{ globalData.company.name "Default Company" }}</h1>
```

### 3. Performance Considerations

- Keep data structures flat when possible
- Avoid deeply nested loops
- Use conditions to limit rendering

### 4. Maintainability

```handlebars
<!-- Use meaningful variable names -->
{{#each globalData.featuredProducts as |product|}}
  <div class="featured-item">{{ product.name }}</div>
{{/each}}

<!-- Group related content -->
{{#with globalData.user as |currentUser|}}
  <div class="user-profile">
    <h2>{{ currentUser.firstName }} {{ currentUser.lastName }}</h2>
    <p>{{ currentUser.email }}</p>
  </div>
{{/with}}
```

## Integration with InvestorPrez

The Handlebars plugin could be useful for InvestorPrez in several ways:

### Dynamic Presentation Content

```javascript
// Example: Dynamic company information
const presentationData = {
  globalData: {
    company: {
      name: '{{ companyName }}',
      valuation: '{{ currentValuation }}',
      growth: '{{ growthRate }}'
    },
    metrics: [
      { label: 'Revenue', value: '{{ revenue }}' },
      { label: 'Users', value: '{{ userCount }}' },
      { label: 'Market Share', value: '{{ marketShare }}' }
    ]
  }
};
```

### Template-Based Presentations

```handlebars
<!-- Investor presentation template -->
<section class="company-overview">
  <h1>{{ globalData.company.name }}</h1>
  <h2>Seeking ${{ globalData.funding.amount }} Series {{ globalData.funding.series }}</h2>
</section>

<section class="metrics">
  {{#each globalData.metrics}}
    <div class="metric-card">
      <h3>{{ label }}</h3>
      <p class="value">{{ value }}</p>
    </div>
  {{/each}}
</section>
```

## Troubleshooting

### Common Issues

1. **Variables Not Rendering**
   - Check data structure matches template paths
   - Verify plugin is loaded correctly
   - Ensure data is available when template renders

2. **Loops Not Working**
   - Verify array structure in data sources
   - Check for typos in property names
   - Ensure arrays are not empty

3. **Conditions Failing**
   - Check boolean values in data
   - Verify condition syntax
   - Use browser console to debug data

### Debug Mode

Enable debugging to see data flow:

```javascript
plugins: [
  dataSourceHandlebars.init({
    debug: true
  })
]
```

## Resources

- [Handlebars.js Documentation](https://handlebarsjs.com/)
- [GrapesJS Data Sources Guide](https://grapesjs.com/docs/modules/DataSources.html)
- [Template Engine Best Practices](https://handlebarsjs.com/guide/)