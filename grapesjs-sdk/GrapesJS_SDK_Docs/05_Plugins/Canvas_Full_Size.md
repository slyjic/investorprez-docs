# Canvas Full Size Plugin

*Last Updated: August 12, 2025*
*Status: Current - GrapesJS SDK Reference Documentation*

## Overview

The Canvas Full Size plugin provides enhanced canvas sizing capabilities for GrapesJS Studio SDK. This plugin is particularly useful for document-based projects, print layouts, and scenarios where you need precise control over canvas dimensions and scaling.

## Compatibility

- **Project Types**: `web`, `document`
- **Plan**: Startup plan
- **License**: Optional license key for use outside Studio SDK

## Features

- **Full Canvas Control**: Precise canvas sizing and scaling
- **Print Optimization**: Optimized for document and print layouts
- **Responsive Scaling**: Automatic scaling based on container size
- **Zoom Controls**: Built-in zoom functionality
- **Fit-to-Screen**: Automatic fitting to available space

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
import { canvasFullSize } from '@grapesjs/studio-sdk-plugins';
import createStudioEditor from '@grapesjs/studio-sdk';

createStudioEditor({
  plugins: [
    canvasFullSize
  ],
  project: {
    type: 'document', // Often used with document projects
    default: {
      pages: [
        { name: 'Document', component: '<div>Full size document</div>' }
      ]
    }
  }
});
```

### React Integration

```javascript
import StudioEditor from '@grapesjs/studio-sdk/react';
import { canvasFullSize } from '@grapesjs/studio-sdk-plugins';

<StudioEditor
  options={{
    plugins: [canvasFullSize],
    project: {
      type: 'document',
      default: {
        pages: [
          { name: 'Report', component: '<div>Full size report</div>' }
        ]
      }
    }
  }}
/>
```

### With Document Project Type

Often used in combination with document projects and printable preset:

```javascript
import { canvasFullSize, presetPrintable } from '@grapesjs/studio-sdk-plugins';

const editor = createStudioEditor({
  plugins: [
    presetPrintable,
    canvasFullSize // Enhances the printable experience
  ],
  project: {
    type: 'document',
    default: {
      pages: [
        {
          name: 'Invoice',
          component: `
            <!DOCTYPE html>
            <html>
              <body style="padding: 40px; font-family: Arial, sans-serif">
                <h1>Invoice #001</h1>
                <p>Full size canvas for precise layout control.</p>
              </body>
            </html>
          `
        }
      ]
    }
  }
});
```

## Plugin Options

| Option | Type | Description |
|--------|------|-------------|
| `licenseKey` | `string` | Optional license key for use outside Studio SDK |
| `autoFit` | `boolean` | Automatically fit canvas to container (default: `true`) |
| `zoomControls` | `boolean` | Enable zoom controls (default: `true`) |
| `minZoom` | `number` | Minimum zoom level (default: `0.1`) |
| `maxZoom` | `number` | Maximum zoom level (default: `5`) |
| `scalingStep` | `number` | Zoom step increment (default: `0.1`) |

### Example with Options

```javascript
plugins: [
  canvasFullSize.init({
    licenseKey: 'your-license-key', // Only needed outside Studio SDK
    autoFit: true,
    zoomControls: true,
    minZoom: 0.25,
    maxZoom: 3,
    scalingStep: 0.25
  })
]
```

## API Methods

### Canvas Size Control

```javascript
// Access the plugin's methods
const canvasPlugin = editor.Plugins.get('canvasFullSize');

// Set specific canvas size
editor.runCommand('canvas:setSize', {
  width: 1200,
  height: 800
});

// Fit canvas to container
editor.runCommand('canvas:fitToContainer');

// Reset canvas size
editor.runCommand('canvas:resetSize');
```

### Zoom Control

```javascript
// Set zoom level
editor.runCommand('canvas:zoom', { level: 1.5 });

// Zoom in
editor.runCommand('canvas:zoomIn');

// Zoom out
editor.runCommand('canvas:zoomOut');

// Fit to screen
editor.runCommand('canvas:fitToScreen');

// Zoom to actual size
editor.runCommand('canvas:actualSize');
```

## Events

Listen to canvas sizing events:

```javascript
// Canvas size changed
editor.on('canvas:size:update', (data) => {
  console.log('Canvas size updated:', data);
});

// Zoom level changed
editor.on('canvas:zoom:update', (zoomLevel) => {
  console.log('Zoom level:', zoomLevel);
});

// Canvas fitted to container
editor.on('canvas:fitted', () => {
  console.log('Canvas fitted to container');
});
```

## CSS Customization

The plugin adds CSS classes you can customize:

```css
/* Canvas container */
.gs-canvas-full-size {
  /* Your custom styles */
}

/* Zoom controls */
.gs-canvas-zoom-controls {
  position: absolute;
  bottom: 20px;
  right: 20px;
  display: flex;
  gap: 8px;
}

/* Zoom buttons */
.gs-canvas-zoom-btn {
  padding: 8px 12px;
  background: #fff;
  border: 1px solid #ddd;
  border-radius: 4px;
  cursor: pointer;
}

.gs-canvas-zoom-btn:hover {
  background: #f5f5f5;
}

/* Canvas wrapper */
.gs-canvas-wrapper {
  overflow: auto;
  width: 100%;
  height: 100%;
}
```

## Use Cases

### 1. Document Creation

Perfect for creating documents with precise dimensions:

```javascript
const editor = createStudioEditor({
  plugins: [canvasFullSize],
  project: {
    type: 'document',
    default: {
      pages: [{
        name: 'A4 Document',
        component: `
          <div style="width: 210mm; height: 297mm; padding: 20mm;">
            <h1>A4 Document</h1>
            <p>Precise A4 sizing with full canvas control.</p>
          </div>
        `
      }]
    }
  }
});
```

### 2. Print Layouts

Optimized for print-ready layouts:

```javascript
const editor = createStudioEditor({
  plugins: [canvasFullSize, presetPrintable],
  project: {
    type: 'document',
    default: {
      pages: [{
        name: 'Business Card',
        component: `
          <div style="width: 3.5in; height: 2in; background: white;">
            <h2>John Doe</h2>
            <p>CEO, Example Corp</p>
          </div>
        `
      }]
    }
  }
});
```

### 3. Large Format Designs

For designs that need more space:

```javascript
const editor = createStudioEditor({
  plugins: [canvasFullSize],
  project: {
    type: 'web',
    default: {
      pages: [{
        name: 'Banner',
        component: `
          <div style="width: 1920px; height: 600px;">
            <h1>Large Format Banner</h1>
          </div>
        `
      }]
    }
  }
});
```

## Custom Layout Integration

Integrate with custom layouts for enhanced UX:

```javascript
const editor = createStudioEditor({
  plugins: [canvasFullSize],
  layout: {
    default: {
      type: 'row',
      style: { height: '100%' },
      children: [
        {
          type: 'sidebarLeft',
          children: { type: 'panelLayers' }
        },
        {
          type: 'canvasSidebarTop',
          sidebarTop: {
            rightContainer: {
              buttons: ({ items }) => [
                {
                  id: 'fit-canvas',
                  icon: '<svg>...</svg>',
                  tooltip: 'Fit to Screen',
                  onClick: ({ editor }) => editor.runCommand('canvas:fitToScreen')
                },
                {
                  id: 'actual-size',
                  icon: '<svg>...</svg>',
                  tooltip: 'Actual Size',
                  onClick: ({ editor }) => editor.runCommand('canvas:actualSize')
                },
                ...items
              ]
            }
          }
        },
        { type: 'sidebarRight' }
      ]
    }
  }
});
```

## Best Practices

### 1. **Responsive Containers**
Ensure your editor container can handle dynamic sizing:

```css
#editor-container {
  width: 100%;
  height: 100vh;
  position: relative;
}
```

### 2. **Performance Optimization**
For large canvases, consider performance:

```javascript
plugins: [
  canvasFullSize.init({
    autoFit: false, // Disable auto-fit for very large canvases
    zoomControls: true,
    maxZoom: 2 // Limit max zoom for performance
  })
]
```

### 3. **Print Compatibility**
When combining with print features:

```javascript
// Ensure canvas size matches print dimensions
editor.on('canvas:size:update', ({ width, height }) => {
  // Convert to print units if needed
  const printWidth = `${width / 96}in`; // Convert px to inches
  const printHeight = `${height / 96}in`;
  
  console.log(`Print size: ${printWidth} x ${printHeight}`);
});
```

## Troubleshooting

### Common Issues

1. **Canvas not fitting properly**
   - Check container dimensions
   - Verify `autoFit` option is enabled
   - Ensure no CSS conflicts

2. **Zoom controls not appearing**
   - Verify `zoomControls` option is `true`
   - Check for CSS z-index conflicts
   - Ensure container has relative positioning

3. **Performance issues with large canvases**
   - Reduce `maxZoom` setting
   - Disable `autoFit` for very large documents
   - Consider using CSS transforms for better performance

### Debug Mode

```javascript
plugins: [
  canvasFullSize.init({
    debug: true,
    logLevel: 'info'
  })
]
```

## Integration with InvestorPrez

While not currently used in InvestorPrez, this plugin could be valuable for:

### Future Use Cases

1. **Presentation Templates**
   - Full-screen presentation layouts
   - Precise slide dimensions
   - Print-ready investor materials

2. **Document Generation**
   - Term sheets
   - Executive summaries
   - Financial reports

3. **Large Format Materials**
   - Trade show banners
   - Poster presentations
   - Marketing materials

## Related Documentation

- [Printable Preset](Preset_Printable.md) - Print optimization
- [Document Project Type](../02_Project-Types/Project-Types_Document.md) - Document projects
- [Layout Components](../03_Configuration/Layout/Configuration_Layout_Components.md) - Custom layouts

## Resources

- [GrapesJS Canvas Module](https://grapesjs.com/docs/modules/Canvas.html)
- [Print CSS Guidelines](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/print)