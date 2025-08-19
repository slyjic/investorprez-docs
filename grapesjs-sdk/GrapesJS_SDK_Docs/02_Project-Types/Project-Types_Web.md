# Project Types Setup: Web

_Last Updated: August 12, 2025_
_Status: Current - GrapesJS SDK Reference Documentation_

## Web Projects

Studio SDK allows you to create a wide range of web projects, including but not limited to websites, landing pages, and other web-based applications.

### Example Configuration

```jsx
import StudioEditor from "@grapesjs/studio-sdk/react";
import "@grapesjs/studio-sdk/style";

// ...
<StudioEditor
  options={{
    // ...
    project: {
      type: "web",
      // The default project to use for new projects
      default: {
        pages: [
          { name: "Home", component: "<h1>Home page</h1>" },
          { name: "About", component: "<h1>About page</h1>" },
          { name: "Contact", component: "<h1>Contact page</h1>" },
        ],
      },
    },
  }}
/>;
```

## Web Project Features

- **Multi-page Support** - Create websites with multiple interconnected pages
- **Responsive Design** - Built-in device management for responsive layouts
- **SEO Optimization** - Support for meta tags, structured data, and SEO best practices
- **Custom Components** - Add your own reusable web components
- **CSS Framework Integration** - Compatible with Bootstrap, Tailwind, and other frameworks

## Common Use Cases

- **Corporate Websites** - Business websites with multiple pages and content sections
- **Landing Pages** - Single-page marketing sites with conversion focus
- **Portfolios** - Creative showcases and professional portfolios
- **E-commerce Sites** - Product catalogs and online stores
- **Blogs** - Content-driven websites with article management

## Related Documentation

- [Project Configuration](../03_Configuration/Configuration_Projects.md) - Detailed project setup
- [Pages Management](../03_Configuration/Configuration_Pages.md) - Multi-page configuration
- [Layout Components](../03_Configuration/Layout/Configuration_Layout_Components.md) - Editor layout customization
- [Global Styles](../03_Configuration/Configuration_Global-Styles.md) - Consistent styling across pages
