# EJS Data Sources Plugin

*Last Updated: August 12, 2025*
*Status: Current - GrapesJS SDK Reference Documentation*

## Overview

The EJS (Embedded JavaScript) data sources plugin enables integration of the EJS template engine with GrapesJS Studio SDK. EJS provides a simple, clean syntax for generating HTML markup with plain JavaScript, making it perfect for developers who prefer JavaScript-based templating over other template languages.

## Compatibility

- **Project Types**: `web`, `email`
- **Plan**: Startup plan
- **License**: Optional license key for use outside Studio SDK

## Features

- **JavaScript-Based**: Use familiar JavaScript syntax in templates
- **Simple Syntax**: Clean, minimal template syntax
- **Control Structures**: Support for if/else, loops, and functions
- **Includes**: Partial template support for reusable components
- **Custom Delimiters**: Configurable template delimiters
- **Client-Side Rendering**: Templates can be rendered on the client
- **Server-Side Compatible**: Works with Node.js server rendering
- **No Dependencies**: Lightweight with minimal footprint

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
import { dataSourceEJS } from '@grapesjs/studio-sdk-plugins';
import createStudioEditor from '@grapesjs/studio-sdk';

createStudioEditor({
  plugins: [
    dataSourceEJS
  ],
  dataSources: {
    globalData: {
      user: {
        name: 'John Doe',
        email: 'john@example.com',
        isVIP: true
      },
      products: [
        { name: 'Laptop', price: 999, category: 'Electronics' },
        { name: 'Mouse', price: 25, category: 'Accessories' }
      ],
      company: {
        name: 'Tech Corp',
        founded: 2020
      }
    }
  }
});
```

### React Integration

```javascript
import StudioEditor from '@grapesjs/studio-sdk/react';
import { dataSourceEJS } from '@grapesjs/studio-sdk-plugins';

<StudioEditor
  options={{
    plugins: [dataSourceEJS],
    dataSources: {
      globalData: {
        user: { name: 'Alice', role: 'Manager' },
        stats: [
          { label: 'Revenue', value: '$1.2M' },
          { label: 'Users', value: '10K+' },
          { label: 'Growth', value: '+25%' }
        ]
      }
    },
    project: {
      type: 'web',
      default: {
        pages: [{
          name: 'EJS Demo',
          component: `
            <div>
              <h1>Welcome, <%= globalData.user.name %>!</h1>
              
              <% if (globalData.user.role === 'Manager') { %>
                <div class="manager-dashboard">
                  <h2>Dashboard</h2>
                  <% globalData.stats.forEach(function(stat) { %>
                    <div class="stat-card">
                      <h3><%= stat.value %></h3>
                      <p><%= stat.label %></p>
                    </div>
                  <% }); %>
                </div>
              <% } %>
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
| `delimiter` | `string` | Template delimiter (default: `'%'`) |
| `openDelimiter` | `string` | Opening delimiter (default: `'<'`) |
| `closeDelimiter` | `string` | Closing delimiter (default: `'>'`) |
| `strict` | `boolean` | Enable strict mode (default: `false`) |
| `localsName` | `string` | Name for locals object (default: `'locals'`) |
| `rmWhitespace` | `boolean` | Remove whitespace (default: `false`) |

### Example with Options

```javascript
plugins: [
  dataSourceEJS.init({
    licenseKey: 'your-license-key',
    delimiter: '%',
    openDelimiter: '<',
    closeDelimiter: '>',
    strict: false,
    rmWhitespace: true,
    localsName: 'data'
  })
]
```

## EJS Syntax

### 1. Variable Output

```html
<!-- Basic variable -->
<h1>Hello, <%= globalData.user.name %>!</h1>

<!-- HTML-escaped output (safe) -->
<p>Bio: <%- globalData.user.bio %></p>

<!-- Raw HTML output (use with caution) -->
<div><%- globalData.user.htmlContent %></div>

<!-- With default values -->
<p>Location: <%= globalData.user.location || 'Not specified' %></p>
```

### 2. Control Structures

```html
<!-- If statement -->
<% if (globalData.user.isVIP) { %>
  <div class="vip-badge">VIP Member</div>
<% } %>

<!-- If-else -->
<% if (globalData.user.age >= 18) { %>
  <p>Adult content available</p>
<% } else { %>
  <p>Family-friendly content only</p>
<% } %>

<!-- Multiple conditions -->
<% if (globalData.user.role === 'admin') { %>
  <a href="/admin">Admin Panel</a>
<% } else if (globalData.user.role === 'moderator') { %>
  <a href="/moderate">Moderation Tools</a>
<% } else { %>
  <a href="/dashboard">Dashboard</a>
<% } %>
```

### 3. Loops

```html
<!-- forEach loop -->
<ul>
  <% globalData.products.forEach(function(product) { %>
    <li>
      <strong><%= product.name %></strong> - $<%= product.price %>
      <span class="category">(<%= product.category %>)</span>
    </li>
  <% }); %>
</ul>

<!-- For loop with index -->
<ol>
  <% for (let i = 0; i < globalData.products.length; i++) { %>
    <li>
      <%= i + 1 %>. <%= globalData.products[i].name %>
    </li>
  <% } %>
</ol>

<!-- Object iteration -->
<dl>
  <% Object.keys(globalData.company).forEach(function(key) { %>
    <dt><%= key %></dt>
    <dd><%= globalData.company[key] %></dd>
  <% }); %>
</dl>
```

### 4. Functions and Logic

```html
<!-- Define and use functions -->
<%
  function formatPrice(price) {
    return '$' + price.toFixed(2);
  }
  
  function formatDate(date) {
    return new Date(date).toLocaleDateString();
  }
%>

<% globalData.products.forEach(function(product) { %>
  <div class="product">
    <h3><%= product.name %></h3>
    <p class="price"><%= formatPrice(product.price) %></p>
    <p class="date">Added: <%= formatDate(product.createdAt) %></p>
  </div>
<% }); %>

<!-- Complex logic -->
<%
  const totalValue = globalData.products.reduce((sum, product) => {
    return sum + product.price;
  }, 0);
  
  const averagePrice = totalValue / globalData.products.length;
%>

<div class="summary">
  <p>Total Products: <%= globalData.products.length %></p>
  <p>Total Value: <%= formatPrice(totalValue) %></p>
  <p>Average Price: <%= formatPrice(averagePrice) %></p>
</div>
```

## Data Structure Examples

### 1. E-commerce Data

```javascript
const ecommerceData = {
  globalData: {
    store: {
      name: 'Tech Store',
      logo: '/logo.png',
      currency: 'USD'
    },
    user: {
      name: 'Sarah Johnson',
      email: 'sarah@example.com',
      isLoggedIn: true,
      cartItems: 3
    },
    products: [
      {
        id: 1,
        name: 'Wireless Headphones',
        price: 129.99,
        image: 'headphones.jpg',
        inStock: true,
        rating: 4.5,
        reviews: 42
      },
      {
        id: 2,
        name: 'Smartphone Case',
        price: 19.99,
        image: 'case.jpg',
        inStock: false,
        rating: 4.2,
        reviews: 18
      }
    ],
    categories: [
      { name: 'Electronics', count: 25 },
      { name: 'Accessories', count: 15 }
    ]
  }
};
```

### 2. Blog/CMS Data

```javascript
const blogData = {
  globalData: {
    site: {
      title: 'My Blog',
      description: 'A personal blog about technology',
      author: 'John Smith'
    },
    posts: [
      {
        title: 'Getting Started with EJS',
        excerpt: 'Learn the basics of EJS templating',
        content: '<p>EJS is a simple templating language...</p>',
        publishedAt: '2024-01-15',
        tags: ['javascript', 'templates', 'web development'],
        author: 'John Smith',
        readTime: 5
      }
    ],
    navigation: [
      { label: 'Home', url: '/' },
      { label: 'About', url: '/about' },
      { label: 'Blog', url: '/blog' },
      { label: 'Contact', url: '/contact' }
    ]
  }
};
```

## Template Examples

### 1. Product Catalog

```html
<!DOCTYPE html>
<html>
<head>
  <title><%= globalData.store.name %> - Products</title>
</head>
<body>
  <header>
    <h1><%= globalData.store.name %></h1>
    <% if (globalData.user.isLoggedIn) { %>
      <p>Welcome, <%= globalData.user.name %>!</p>
      <p>Cart: <%= globalData.user.cartItems %> items</p>
    <% } else { %>
      <a href="/login">Login</a>
    <% } %>
  </header>
  
  <main>
    <h2>Products</h2>
    <div class="product-grid">
      <% globalData.products.forEach(function(product) { %>
        <div class="product-card <%= !product.inStock ? 'out-of-stock' : '' %>">
          <img src="<%= product.image %>" alt="<%= product.name %>">
          <h3><%= product.name %></h3>
          <p class="price">
            <%= globalData.store.currency %><%= product.price.toFixed(2) %>
          </p>
          
          <div class="rating">
            <% for (let i = 1; i <= 5; i++) { %>
              <span class="<%= i <= product.rating ? 'star filled' : 'star' %>">★</span>
            <% } %>
            <span class="review-count">(<%= product.reviews %> reviews)</span>
          </div>
          
          <% if (product.inStock) { %>
            <button class="add-to-cart">Add to Cart</button>
          <% } else { %>
            <button class="out-of-stock" disabled>Out of Stock</button>
          <% } %>
        </div>
      <% }); %>
    </div>
  </main>
  
  <aside>
    <h3>Categories</h3>
    <ul>
      <% globalData.categories.forEach(function(category) { %>
        <li>
          <a href="/category/<%= category.name.toLowerCase() %>">
            <%= category.name %> (<%= category.count %>)
          </a>
        </li>
      <% }); %>
    </ul>
  </aside>
</body>
</html>
```

### 2. Email Newsletter

```html
<!DOCTYPE html>
<html>
<head>
  <title><%= globalData.newsletter.subject %></title>
  <style>
    body { font-family: Arial, sans-serif; margin: 0; padding: 20px; }
    .container { max-width: 600px; margin: 0 auto; }
    .header { text-align: center; margin-bottom: 30px; }
    .article { margin-bottom: 25px; padding-bottom: 20px; border-bottom: 1px solid #eee; }
    .cta { text-align: center; margin: 30px 0; }
    .button { background: #007bff; color: white; padding: 10px 20px; text-decoration: none; border-radius: 5px; }
  </style>
</head>
<body>
  <div class="container">
    <div class="header">
      <h1><%= globalData.newsletter.title %></h1>
      <p><%= globalData.newsletter.date %></p>
    </div>
    
    <% globalData.articles.forEach(function(article) { %>
      <div class="article">
        <h2><%= article.title %></h2>
        <p><%= article.excerpt %></p>
        <p><strong>By:</strong> <%= article.author %></p>
        <a href="<%= article.url %>">Read More →</a>
      </div>
    <% }); %>
    
    <div class="cta">
      <p>Enjoying our newsletter?</p>
      <a href="<%= globalData.newsletter.shareUrl %>" class="button">
        Share with Friends
      </a>
    </div>
    
    <footer style="text-align: center; color: #666; font-size: 12px;">
      <p>© <%= new Date().getFullYear() %> <%= globalData.company.name %></p>
      <p>
        <a href="<%= globalData.newsletter.unsubscribeUrl %>">Unsubscribe</a> | 
        <a href="<%= globalData.newsletter.preferencesUrl %>">Preferences</a>
      </p>
    </footer>
  </div>
</body>
</html>
```

### 3. Dashboard Template

```html
<div class="dashboard">
  <header class="dashboard-header">
    <h1>Dashboard</h1>
    <p>Welcome back, <%= globalData.user.name %>!</p>
  </header>
  
  <!-- Stats Overview -->
  <div class="stats-grid">
    <% globalData.stats.forEach(function(stat) { %>
      <div class="stat-card">
        <h3><%= stat.value %></h3>
        <p><%= stat.label %></p>
        <% if (stat.change) { %>
          <span class="change <%= stat.change > 0 ? 'positive' : 'negative' %>">
            <%= stat.change > 0 ? '+' : '' %><%= stat.change %>%
          </span>
        <% } %>
      </div>
    <% }); %>
  </div>
  
  <!-- Recent Activity -->
  <section class="recent-activity">
    <h2>Recent Activity</h2>
    <% if (globalData.activities && globalData.activities.length > 0) { %>
      <ul>
        <% globalData.activities.slice(0, 5).forEach(function(activity) { %>
          <li>
            <span class="activity-icon"><%= activity.icon %></span>
            <span class="activity-text"><%= activity.description %></span>
            <span class="activity-time"><%= activity.timeAgo %></span>
          </li>
        <% }); %>
      </ul>
    <% } else { %>
      <p>No recent activity</p>
    <% } %>
  </section>
  
  <!-- Quick Actions -->
  <section class="quick-actions">
    <h2>Quick Actions</h2>
    <div class="action-buttons">
      <% globalData.quickActions.forEach(function(action) { %>
        <a href="<%= action.url %>" class="action-btn">
          <span class="action-icon"><%= action.icon %></span>
          <span><%= action.label %></span>
        </a>
      <% }); %>
    </div>
  </section>
</div>
```

## Advanced Features

### 1. Includes (Partials)

```html
<!-- main.ejs -->
<!DOCTYPE html>
<html>
<head>
  <%- include('partials/head') %>
</head>
<body>
  <%- include('partials/header') %>
  
  <main>
    <% globalData.posts.forEach(function(post) { %>
      <%- include('partials/post-card', { post: post }) %>
    <% }); %>
  </main>
  
  <%- include('partials/footer') %>
</body>
</html>

<!-- partials/post-card.ejs -->
<article class="post-card">
  <h2><%= post.title %></h2>
  <p class="meta">By <%= post.author %> on <%= post.date %></p>
  <p><%= post.excerpt %></p>
  <a href="<%= post.url %>">Read More</a>
</article>
```

### 2. Custom Filters/Helpers

```javascript
// Add custom functions to data
const dataWithHelpers = {
  globalData: {
    // ... your data
  },
  helpers: {
    formatDate(date) {
      return new Date(date).toLocaleDateString();
    },
    truncate(text, length = 100) {
      return text.length > length ? text.substring(0, length) + '...' : text;
    },
    currency(amount, symbol = '$') {
      return symbol + amount.toFixed(2);
    }
  }
};
```

Use in templates:
```html
<p>Published: <%= helpers.formatDate(post.publishedAt) %></p>
<p><%= helpers.truncate(post.content, 150) %></p>
<p>Price: <%= helpers.currency(product.price) %></p>
```

## Integration with GrapesJS

### Custom Component with EJS

```javascript
editor.DomComponents.addType('ejs-component', {
  model: {
    defaults: {
      template: `
        <div class="user-profile">
          <h2>Welcome, <%= globalData.user.name %>!</h2>
          <% if (globalData.user.avatar) { %>
            <img src="<%= globalData.user.avatar %>" alt="Avatar">
          <% } %>
          <p>Member since: <%= globalData.user.joinDate %></p>
        </div>
      `,
      script: function() {
        // Component behavior
        console.log('EJS component mounted');
      }
    }
  }
});
```

### Dynamic Content Updates

```javascript
// Update data and re-render
editor.on('component:update', (component) => {
  if (component.get('type') === 'ejs-component') {
    const newData = {
      globalData: {
        user: {
          name: 'Updated Name',
          avatar: 'new-avatar.jpg'
        }
      }
    };
    
    // Re-render component with new data
    component.trigger('change:template');
  }
});
```

## Best Practices

### 1. **Data Organization**

```javascript
// Good: Organize data logically
const wellOrganizedData = {
  globalData: {
    user: { /* user data */ },
    content: { /* page content */ },
    ui: { /* UI state */ },
    business: { /* business data */ }
  }
};

// Avoid: Flat, unorganized structure
const poorlyOrganizedData = {
  globalData: {
    userName: 'John',
    userEmail: 'john@example.com',
    siteTitle: 'My Site',
    productCount: 10
    // ... mixed data types
  }
};
```

### 2. **Error Handling**

```html
<!-- Safe property access -->
<% if (globalData.user && globalData.user.name) { %>
  <p>Hello, <%= globalData.user.name %>!</p>
<% } %>

<!-- Default values -->
<p>Location: <%= (globalData.user && globalData.user.location) || 'Not specified' %></p>

<!-- Try-catch for complex operations -->
<%
  let formattedDate = 'Unknown';
  try {
    formattedDate = new Date(globalData.post.publishedAt).toLocaleDateString();
  } catch (error) {
    console.error('Date formatting error:', error);
  }
%>
<p>Published: <%= formattedDate %></p>
```

### 3. **Performance Optimization**

```html
<!-- Cache complex calculations -->
<%
  const productsByCategory = {};
  globalData.products.forEach(product => {
    if (!productsByCategory[product.category]) {
      productsByCategory[product.category] = [];
    }
    productsByCategory[product.category].push(product);
  });
%>

<!-- Use the cached data -->
<% Object.keys(productsByCategory).forEach(function(category) { %>
  <h3><%= category %></h3>
  <% productsByCategory[category].forEach(function(product) { %>
    <p><%= product.name %></p>
  <% }); %>
<% }); %>
```

## Troubleshooting

### Common Issues

1. **Syntax Errors**
   - Check for unmatched delimiters `<% %>`
   - Verify proper JavaScript syntax
   - Use linting tools for validation

2. **Variable Not Found**
   - Check data structure matches template
   - Use safe property access
   - Verify data is available when template renders

3. **HTML Escaping Issues**
   - Use `<%=` for escaped output
   - Use `<%-` for raw HTML (be careful!)
   - Sanitize user-generated content

### Debug Mode

```javascript
plugins: [
  dataSourceEJS.init({
    debug: true,
    compileDebug: true,
    filename: 'template' // For better error messages
  })
]
```

## Integration with InvestorPrez

EJS templates can enhance InvestorPrez presentations:

### Use Cases

1. **Dynamic Company Information**
```html
<div class="company-overview">
  <h1><%= globalData.company.name %></h1>
  <p>Founded in <%= globalData.company.founded %></p>
  
  <div class="metrics">
    <% globalData.company.metrics.forEach(function(metric) { %>
      <div class="metric">
        <h3><%= metric.value %></h3>
        <p><%= metric.label %></p>
      </div>
    <% }); %>
  </div>
</div>
```

2. **Team Member Profiles**
```html
<section class="team">
  <h2>Our Team</h2>
  <div class="team-grid">
    <% globalData.team.forEach(function(member) { %>
      <div class="team-member">
        <img src="<%= member.photo %>" alt="<%= member.name %>">
        <h3><%= member.name %></h3>
        <p class="role"><%= member.role %></p>
        <% if (member.bio) { %>
          <p class="bio"><%= member.bio %></p>
        <% } %>
      </div>
    <% }); %>
  </div>
</section>
```

3. **Financial Projections**
```html
<div class="projections">
  <h2>Financial Projections</h2>
  <table>
    <thead>
      <tr>
        <th>Year</th>
        <% globalData.projections.metrics.forEach(function(metric) { %>
          <th><%= metric %></th>
        <% }); %>
      </tr>
    </thead>
    <tbody>
      <% globalData.projections.years.forEach(function(year) { %>
        <tr>
          <td><%= year.year %></td>
          <% year.values.forEach(function(value) { %>
            <td><%= value %></td>
          <% }); %>
        </tr>
      <% }); %>
    </tbody>
  </table>
</div>
```

## Related Documentation

- [Data Sources Overview](./Data_Sources_Overview.md) - General data sources guide
- [Handlebars Data Sources](./Handlebars.md) - Alternative template engine
- [Configuration Overview](../../03_Configuration/Configuration_Overview.md)

## Resources

- [EJS Documentation](https://ejs.co/)
- [EJS GitHub Repository](https://github.com/mde/ejs)
- [Template Engine Comparison](https://colorlib.com/wp/top-templating-engines-for-javascript/)