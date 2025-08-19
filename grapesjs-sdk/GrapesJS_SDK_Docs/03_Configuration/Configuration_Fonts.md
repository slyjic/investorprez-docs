# GrapesJS Studio SDK - Font Configuration

*Last Updated: August 12, 2025*
*Status: Current - GrapesJS SDK Reference Documentation*

## Overview

The Studio SDK provides comprehensive font management capabilities that allow you to customize typography within the editor. Users can select from custom fonts, integrate external font providers, and manage fonts dynamically.

## Basic Configuration

### Enabling Font Manager

To enable the font manager in your Studio SDK configuration:

```javascript
const config = {
  fonts: {
    enableFontManager: true
  }
};
```

## Adding Custom Fonts

### Method 1: Default Fonts Configuration

Add custom fonts through the `fonts.default` configuration:

```javascript
const config = {
  fonts: {
    enableFontManager: true,
    default: [
      {
        id: 'custom-font-1',
        name: 'My Custom Font',
        src: 'https://example.com/fonts/custom-font.woff2',
        type: 'font'
      }
    ]
  }
};
```

### Method 2: Project JSON Configuration

Fonts can be added to your project JSON under `custom.globalPageSettings.fonts`:

```javascript
{
  "custom": {
    "globalPageSettings": {
      "fonts": [
        {
          "id": "aboreto",
          "type": "font",
          "src": "https://fonts.gstatic.com/s/aboreto/v2/0nz6y6w9tBtO7jgcJsR3zg.woff2",
          "name": "Aboreto"
        }
      ]
    }
  }
}
```

## Custom Font Providers

Create custom font providers to integrate external font services:

```javascript
const customFontProvider = {
  id: "custom-fonts",
  label: "Custom Font Provider",
  types: "font",
  onLoad: async (props) => {
    // Fetch fonts from your source
    return [
      {
        id: 'font-1',
        type: 'font',
        src: 'https://example.com/font-1.woff2',
        name: 'Custom Font 1'
      },
      {
        id: 'font-2',
        type: 'font',
        src: 'https://example.com/font-2.woff2',
        name: 'Custom Font 2'
      }
    ];
  }
};

// Add to configuration
const config = {
  fonts: {
    enableFontManager: true,
    providers: [customFontProvider]
  }
};
```

## Variable Font Support

The SDK supports variable fonts with axis descriptors:

```javascript
{
  id: 'variable-font',
  type: 'font',
  src: 'https://example.com/variable-font.woff2',
  name: 'Variable Font',
  weight: "300 800", // Weight range
  style: "normal italic" // Style variations
}
```

## Font Management Commands

The SDK provides commands for programmatic font management:

### Get All Fonts
```javascript
const fonts = editor.runCommand('studio:font-get');
```

### Add a Font
```javascript
editor.runCommand('studio:font-add', {
  id: 'new-font',
  name: 'New Font',
  src: 'https://example.com/new-font.woff2',
  type: 'font'
});
```

### Remove a Font
```javascript
editor.runCommand('studio:font-remove', { id: 'font-id' });
```

### Open Font Manager
```javascript
editor.runCommand('studio:font-manager-open');
```

## Google Fonts Integration

Enable Google Fonts provider:

```javascript
const config = {
  fonts: {
    enableFontManager: true,
    providers: [
      {
        id: 'google-fonts',
        label: 'Google Fonts',
        plugin: '@grapesjs/studio-sdk/google-fonts-provider'
      }
    ]
  }
};
```

## Best Practices

1. **Performance**: Use web font formats (WOFF2) for better compression
2. **Fallbacks**: Always specify fallback fonts in your CSS
3. **Preloading**: Consider preloading critical fonts
4. **Variable Fonts**: Use variable fonts to reduce the number of font files
5. **License Compliance**: Ensure proper licensing for all custom fonts

## Example: Complete Font Configuration

```javascript
const studioConfig = {
  projectType: 'web',
  fonts: {
    enableFontManager: true,
    default: [
      {
        id: 'system-ui',
        name: 'System UI',
        src: 'system-ui, -apple-system, BlinkMacSystemFont, sans-serif',
        type: 'font'
      }
    ],
    providers: [
      // Google Fonts provider
      {
        id: 'google-fonts',
        plugin: '@grapesjs/studio-sdk/google-fonts-provider'
      },
      // Custom provider
      {
        id: 'brand-fonts',
        label: 'Brand Fonts',
        types: 'font',
        onLoad: async () => {
          return [
            {
              id: 'brand-primary',
              name: 'Brand Primary',
              src: '/assets/fonts/brand-primary.woff2',
              type: 'font'
            }
          ];
        }
      }
    ]
  }
};
```