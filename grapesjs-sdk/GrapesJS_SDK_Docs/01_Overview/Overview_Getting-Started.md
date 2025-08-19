# Get Started with Studio SDK

*Last Updated: August 12, 2025*  
*Status: Current - GrapesJS SDK Reference Documentation*

The Studio SDK is a fully embeddable, drag-and-drop, white-label version of our standalone Studio editor. It enables seamless integration of our ready-to-use visual builder into any external web application, giving your users a powerful editing experience. The SDK is highly customizable and extendable through the GrapesJS core API, making it adaptable to your specific needs.

To get a feel of the Studio SDK's capabilities, you can explore and experiment with our live Studio at [https://app.grapesjs.com/studio](https://app.grapesjs.com/studio).

## Installation

### Prerequisites

Before getting started, ensure you have:
- Node.js 16+ installed
- A package manager (npm, yarn, or pnpm)
- Basic knowledge of React (if using React integration)

### Package Installation

Install the Studio SDK using your preferred package manager:

```bash
# npm
npm i @grapesjs/studio-sdk

# pnpm
pnpm add @grapesjs/studio-sdk

# yarn
yarn add @grapesjs/studio-sdk
```

### Plugins Package (Optional)

For additional functionality, install the plugins package:

```bash
# npm
npm i @grapesjs/studio-sdk-plugins

# pnpm
pnpm add @grapesjs/studio-sdk-plugins  

# yarn
yarn add @grapesjs/studio-sdk-plugins
```

### CDN Usage

For direct browser usage without a build process:

```html
<!-- Studio SDK Core -->
<script src="https://unpkg.com/@grapesjs/studio-sdk@latest/dist/index.umd.js"></script>
<link rel="stylesheet" href="https://unpkg.com/@grapesjs/studio-sdk@latest/dist/style.css">

<!-- Plugins (if needed) -->
<script src="https://unpkg.com/@grapesjs/studio-sdk-plugins@latest/dist/[plugin-name]/index.umd.js"></script>
```

**Note**: Replace `latest` with a specific version number for production use to avoid breaking changes.

## Basic Usage

### React Integration

For React applications, use the React component wrapper:

```jsx
import StudioEditor from '@grapesjs/studio-sdk/react';
import '@grapesjs/studio-sdk/style';

function App() {
  return (
    <div style={{ height: '100vh' }}>
      <StudioEditor
        options={{
          // Basic configuration
          project: {
            type: 'web',
            default: {
              pages: [
                { name: 'Home', component: '<h1>Welcome to my website</h1>' },
                { name: 'About', component: '<h1>About us</h1>' },
                { name: 'Contact', component: '<h1>Contact us</h1>' },
              ]
            },
          },
          // Storage configuration
          storageManager: {
            type: 'remote',
            autosave: true,
            autoload: true,
            options: {
              remote: {
                // Your storage endpoints
                urlLoad: '/api/projects/load',
                urlStore: '/api/projects/save',
              }
            }
          },
          // Asset management
          assetManager: {
            upload: '/api/assets/upload',
            uploadName: 'files',
          },
        }}
        onReady={(editor) => {
          console.log('Editor is ready!', editor);
        }}
      />
    </div>
  );
}
```

### Vanilla JavaScript

For non-React applications:

```javascript
import createStudioEditor from '@grapesjs/studio-sdk';
import '@grapesjs/studio-sdk/style';

const editor = createStudioEditor({
  container: '#editor',
  project: {
    type: 'web',
    default: {
      pages: [
        { name: 'Home', component: '<h1>Home page</h1>' }
      ]
    }
  },
  storageManager: {
    type: 'local' // Use localStorage for simple setups
  }
});

// Editor is ready to use
console.log('Editor instance:', editor);
```

### CDN Example

```html
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://unpkg.com/@grapesjs/studio-sdk@latest/dist/style.css">
</head>
<body>
  <div id="editor" style="height: 100vh;"></div>
  
  <script src="https://unpkg.com/@grapesjs/studio-sdk@latest/dist/index.umd.js"></script>
  <script>
    const editor = window.StudioSDK.createStudioEditor({
      container: '#editor',
      project: {
        type: 'web',
        default: {
          pages: [
            { name: 'Home', component: '<h1>Welcome!</h1>' }
          ]
        }
      }
    });
  </script>
</body>
</html>
```

## Key Features

The Studio SDK provides several advantages over the open-source GrapesJS framework:

### **Control Over Data**
- Self-host your users' data and assets
- No vendor lock-in
- Complete privacy control

### **Ease of Integration**
- Built-in features and components
- Powerful and extendable visual builder
- Dramatically reduced development time

### **Scalable and Extendable**
- Highly customizable via GrapesJS core API
- Plugin system for additional functionality
- Flexible to meet diverse project requirements

### **Professional UI/UX**
- Polished and accessible components
- Better end-user experience
- White-label ready

## Configuration Quick Start

### Essential Configuration Options

```javascript
const config = {
  // Project type (web, email, document)
  project: {
    type: 'web',
    default: { /* default content */ }
  },
  
  // Storage management
  storageManager: {
    type: 'remote', // or 'local' or 'none'
    autosave: true,
    autoload: true
  },
  
  // Asset management
  assetManager: {
    upload: '/api/upload',
    uploadName: 'files'
  },
  
  // Theme customization
  theme: {
    // Your theme overrides
  },
  
  // Plugins
  plugins: [
    // Your plugins
  ]
};
```

## Best Practices

### 1. **Container Sizing**
Always ensure your editor container has a defined height:
```css
#editor {
  height: 100vh; /* or specific height */
  width: 100%;
}
```

### 2. **Import Order**
Always import styles after the main SDK:
```javascript
import StudioEditor from '@grapesjs/studio-sdk/react';
import '@grapesjs/studio-sdk/style'; // After the main import
```

### 3. **Storage Configuration**
For production, always use remote storage:
```javascript
storageManager: {
  type: 'remote',
  options: {
    remote: {
      urlLoad: '/api/projects/load',
      urlStore: '/api/projects/save'
    }
  }
}
```

### 4. **Asset Management**
Configure proper asset handling:
```javascript
assetManager: {
  upload: '/api/assets/upload',
  uploadName: 'files',
  multiUpload: true
}
```

## Troubleshooting

### Common Issues

**Editor not rendering:**
- Check container height is set
- Verify all imports are correct
- Check browser console for errors

**Styles not loading:**
- Ensure `@grapesjs/studio-sdk/style` is imported
- Check for CSS conflicts
- Verify CDN links if using CDN

**Assets not uploading:**
- Verify upload endpoint is configured
- Check CORS settings on your server
- Ensure proper file permissions

**Project not saving:**
- Check storage manager configuration
- Verify API endpoints are working
- Check network tab for failed requests

### Development Tips

1. **Enable Debug Mode:**
```javascript
const editor = createStudioEditor({
  // ... other options
  log: ['info', 'error', 'warning']
});
```

2. **Access Editor Instance:**
```javascript
// In React
onReady={(editor) => {
  window.editor = editor; // For debugging
}}

// In vanilla JS
const editor = createStudioEditor(config);
window.editor = editor; // For debugging
```

3. **Monitor Events:**
```javascript
editor.on('component:add', (component) => {
  console.log('Component added:', component);
});

editor.on('storage:store', (data) => {
  console.log('Project saved:', data);
});
```

## Next Steps

To ensure a seamless integration of the Studio SDK within your application, refer to the [Configuration Overview](../03_Configuration/Configuration_Overview.md). The page summarizes the available configurations, including how to properly store projects, manage user assets, and customize various aspects of the editor.

When you're ready to publish your Studio SDK integration on a public domain, make sure to set up a license by creating an SDK license.

### Recommended Reading Order

1. **[Configuration Overview](../03_Configuration/Configuration_Overview.md)** - Core configuration concepts
2. **[Project Types](../02_Project-Types/)** - Understanding different project types
3. **[Storage Management](../03_Configuration/Configuration_Projects.md)** - Project storage configuration
4. **[Asset Management](../03_Configuration/Assets/Configuration_Assets_Overview.md)** - Media and file handling
5. **[Plugins Guide](../05_Plugins/Complete_Plugins_Guide.md)** - Extending functionality

---

## Quick Links

- **[Project Types](../02_Project-Types/)** - Learn about different project types (web, email, document)
- **[Configuration Overview](../03_Configuration/Configuration_Overview.md)** - Complete configuration guide
- **[Layout Components](../03_Configuration/Layout/Configuration_Layout_Components.md)** - Customize the editor interface
- **[Assets Management](../03_Configuration/Assets/Configuration_Assets_Overview.md)** - Handle media and resources
- **[Themes](../03_Configuration/Configuration_Themes.md)** - Customize visual appearance