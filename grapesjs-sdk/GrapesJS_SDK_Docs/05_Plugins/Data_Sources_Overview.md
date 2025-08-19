# Data Sources Overview

*Last Updated: August 12, 2025*
*Status: Current - GrapesJS SDK Reference Documentation*

Data sources enable dynamic content rendering in GrapesJS Studio SDK by connecting templates with external data. This powerful feature allows you to create templates that populate with real data, making it perfect for generating personalized content, reports, invoices, and marketing materials.

## Overview

Data sources provide a way to:
- **Bind dynamic data** to template components
- **Render templates** with different data sets
- **Create reusable templates** that work with various data structures
- **Generate personalized content** at scale
- **Integrate with external APIs** and databases

## Supported Template Engines

The Studio SDK supports multiple template engines for data rendering:

### 1. Handlebars
- **Plugin**: `dataSourceHandlebars`
- **Features**: Variable rendering, conditionals, loops, helpers
- **Best for**: Complex logic, nested data structures
- **Documentation**: [Handlebars Data Sources](Data_Sources_Handlebars.md)

### 2. Mustache (Future)
- **Status**: Planned
- **Features**: Logic-less templates, simple variable replacement
- **Best for**: Simple variable substitution

### 3. Custom Template Engines
- **Extensible**: Create your own template engine integration
- **Flexible**: Adapt to specific business needs

## Basic Usage

### 1. Installation

```bash
npm i @grapesjs/studio-sdk-plugins
```

### 2. Basic Setup

```javascript
import createStudioEditor from '@grapesjs/studio-sdk';
import { dataSourceHandlebars } from '@grapesjs/studio-sdk-plugins';

const editor = createStudioEditor({
  plugins: [dataSourceHandlebars],
  dataSources: {
    globalData: {
      // Your data structure
      user: {
        name: 'John Doe',
        email: 'john@example.com'
      },
      products: [
        { name: 'Product 1', price: 99.99 },
        { name: 'Product 2', price: 149.99 }
      ]
    }
  }
});
```

### 3. Template Creation

```html
<!-- Simple variable -->
<h1>Welcome, {{ globalData.user.name }}!</h1>

<!-- Conditional rendering -->
{{#if globalData.user.isPremium}}
  <div class="premium-badge">Premium User</div>
{{/if}}

<!-- Loop through data -->
<ul>
{{#each globalData.products}}
  <li>{{ name }} - ${{ price }}</li>
{{/each}}
</ul>
```

## Data Structure Guidelines

### 1. Organization

Structure your data logically for easy template access:

```javascript
const dataSources = {
  // Global data accessible everywhere
  globalData: {
    // User information
    user: {
      id: 123,
      name: 'John Doe',
      email: 'john@example.com',
      preferences: { theme: 'dark' }
    },
    
    // Business data
    company: {
      name: 'Acme Corp',
      logo: '/assets/logo.png',
      address: '123 Main St'
    },
    
    // Dynamic collections
    products: [...],
    orders: [...],
    analytics: {...}
  },
  
  // Page-specific data
  pageData: {
    // Data for current page
  }
};
```

### 2. Naming Conventions

- Use **camelCase** for property names
- Use **descriptive names** that indicate content type
- **Group related data** in objects
- Use **arrays** for collections of similar items

### 3. Data Types

```javascript
const supportedDataTypes = {
  // Primitives
  strings: 'Hello World',
  numbers: 42,
  booleans: true,
  
  // Objects
  objects: {
    nested: {
      property: 'value'
    }
  },
  
  // Arrays
  arrays: [
    { id: 1, name: 'Item 1' },
    { id: 2, name: 'Item 2' }
  ],
  
  // Dates (convert to strings)
  dates: '2024-01-15T10:30:00Z',
  
  // URLs
  urls: 'https://example.com/image.jpg'
};
```

## Common Use Cases

### 1. Personalized Marketing
```javascript
dataSources: {
  globalData: {
    recipient: {
      firstName: 'Sarah',
      lastName: 'Johnson',
      interests: ['technology', 'design']
    },
    offer: {
      product: 'Design Course',
      discount: '20%',
      validUntil: '2024-02-01'
    }
  }
}
```

### 2. Reports and Invoices
```javascript
dataSources: {
  globalData: {
    invoice: {
      number: 'INV-2024-001',
      date: '2024-01-15',
      dueDate: '2024-02-15'
    },
    client: {
      name: 'Client Corp',
      address: '456 Business Ave',
      email: 'billing@client.com'
    },
    items: [
      { description: 'Consulting', quantity: 10, rate: 150 },
      { description: 'Development', quantity: 20, rate: 100 }
    ]
  }
}
```

### 3. Product Catalogs
```javascript
dataSources: {
  globalData: {
    catalog: {
      title: 'Summer Collection 2024',
      description: 'Latest trends and styles'
    },
    products: [
      {
        id: 'prod-001',
        name: 'Summer Dress',
        price: 89.99,
        image: '/images/dress.jpg',
        colors: ['red', 'blue', 'green'],
        inStock: true
      }
    ]
  }
}
```

## Dynamic Data Loading

### 1. API Integration

```javascript
// Load data from API
const loadDataFromAPI = async () => {
  const response = await fetch('/api/template-data');
  const data = await response.json();
  
  editor.DataSources.setGlobalData(data);
};

// Update data dynamically
editor.on('load', () => {
  loadDataFromAPI();
});
```

### 2. Real-time Updates

```javascript
// Update specific data
const updateUserData = (newUserData) => {
  const currentData = editor.DataSources.getGlobalData();
  editor.DataSources.setGlobalData({
    ...currentData,
    user: { ...currentData.user, ...newUserData }
  });
};

// Listen for data changes
editor.on('data:update', (data) => {
  console.log('Data updated:', data);
  // Refresh template rendering if needed
});
```

## Best Practices

### 1. Data Validation
```javascript
const validateData = (data) => {
  // Ensure required fields exist
  if (!data.globalData?.user?.name) {
    throw new Error('User name is required');
  }
  
  // Validate data types
  if (typeof data.globalData.user.age !== 'number') {
    data.globalData.user.age = parseInt(data.globalData.user.age) || 0;
  }
  
  return data;
};
```

### 2. Error Handling
```javascript
// Template with fallbacks
const templateWithFallbacks = `
  <h1>Welcome, {{ globalData.user.name "Guest" }}!</h1>
  {{#if globalData.products}}
    <p>We have {{ globalData.products.length }} products available.</p>
  {{else}}
    <p>No products available at the moment.</p>
  {{/if}}
`;
```

### 3. Performance Optimization
```javascript
// Lazy load large datasets
const optimizedDataSources = {
  globalData: {
    // Essential data loaded immediately
    user: userData,
    settings: userSettings
  },
  
  // Load on demand
  loadProductCatalog: async () => {
    const products = await fetchProducts();
    editor.DataSources.setGlobalData({
      ...editor.DataSources.getGlobalData(),
      products
    });
  }
};
```

## Security Considerations

### 1. Data Sanitization
```javascript
const sanitizeData = (data) => {
  // Remove potentially harmful content
  const sanitized = JSON.parse(JSON.stringify(data));
  
  // Escape HTML in strings
  const escapeHtml = (str) => {
    return str.replace(/[&<>"']/g, (match) => {
      const escapeMap = {
        '&': '&amp;',
        '<': '&lt;',
        '>': '&gt;',
        '"': '&quot;',
        "'": '&#39;'
      };
      return escapeMap[match];
    });
  };
  
  // Apply to all string values
  return sanitized;
};
```

### 2. Access Control
```javascript
// Limit data access based on user permissions
const getFilteredData = (userData, userPermissions) => {
  const data = { ...baseData };
  
  if (!userPermissions.includes('view_sensitive_data')) {
    delete data.globalData.financials;
    delete data.globalData.personalInfo;
  }
  
  return data;
};
```

## Troubleshooting

### Common Issues

1. **Variables not rendering**
   - Check data structure matches template paths
   - Verify plugin is loaded correctly
   - Ensure data is available when template renders

2. **Performance issues with large datasets**
   - Implement pagination for large arrays
   - Use lazy loading for non-essential data
   - Consider data virtualization

3. **Template compilation errors**
   - Validate template syntax
   - Check for missing closing tags
   - Verify helper function availability

### Debug Mode

```javascript
// Enable debugging
plugins: [
  dataSourceHandlebars.init({
    debug: true,
    logLevel: 'verbose'
  })
]
```

## Integration with InvestorPrez

Data sources could enhance InvestorPrez presentations by:

### 1. Dynamic Company Information
```javascript
dataSources: {
  globalData: {
    company: {
      name: '{{ companyName }}',
      valuation: '{{ currentValuation }}',
      growth: '{{ growthRate }}%',
      team: [
        { name: '{{ founderName }}', role: 'CEO' }
      ]
    }
  }
}
```

### 2. Financial Data Templates
```javascript
dataSources: {
  globalData: {
    financials: {
      revenue: '{{ annualRevenue }}',
      projectedGrowth: '{{ projectedGrowth }}%',
      marketSize: '{{ totalAddressableMarket }}'
    }
  }
}
```

### 3. Investor-Specific Content
```javascript
dataSources: {
  globalData: {
    investor: {
      name: '{{ investorName }}',
      focus: '{{ investmentFocus }}',
      previousInvestments: [...]
    }
  }
}
```

## Related Documentation

- [Handlebars Data Sources](Data_Sources_Handlebars.md) - Detailed Handlebars integration
- [Configuration Overview](../Configuration_Overview.md) - General configuration
- [Components Overview](../Components/Configuration_Components_Overview.md) - Component system
- [Templates](../Configuration_Templates.md) - Template management

## Resources

- [GrapesJS Data Sources Module](https://grapesjs.com/docs/modules/DataSources.html)
- [Handlebars.js Documentation](https://handlebarsjs.com/)
- [Template Engine Best Practices](https://handlebarsjs.com/guide/)