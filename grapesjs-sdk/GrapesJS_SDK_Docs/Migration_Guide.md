# GrapesJS Studio SDK Migration Guide

*Last Updated: August 12, 2025*
*Status: Current - GrapesJS SDK Reference Documentation*

## Overview

This guide helps developers migrate between different versions of the GrapesJS Studio SDK and understand breaking changes.

## Current Version

InvestorPrez uses **GrapesJS Studio SDK v1.0.51**

## Migration from Core GrapesJS to Studio SDK

### Key Differences

1. **Import Changes**
   ```javascript
   // Old (Core GrapesJS)
   import grapesjs from 'grapesjs';
   
   // New (Studio SDK)
   import { Studio } from '@grapesjs/studio-sdk';
   ```

2. **Initialization**
   ```javascript
   // Old
   const editor = grapesjs.init({
     container: '#gjs',
     // ... config
   });
   
   // New
   const studio = new Studio({
     root: document.getElementById('studio-root'),
     project: projectConfig,
     // ... config
   });
   ```

3. **Storage Manager**
   ```javascript
   // Old
   storageManager: {
     type: 'remote',
     autosave: true,
     // ... storage config
   }
   
   // New
   storageManager: {
     type: 'none' // Handle storage externally
   }
   ```

## Common Migration Issues

### 1. Plugin Compatibility

Not all core GrapesJS plugins are compatible with Studio SDK. Check compatibility:

- ✅ Compatible: Most official plugins
- ⚠️ May need updates: Community plugins
- ❌ Incompatible: Plugins that modify core UI

### 2. Custom Components

Update component definitions:

```javascript
// Old
editor.DomComponents.addType('custom-component', {
  model: {
    defaults: {
      // ... component config
    }
  }
});

// New
editor.Components.addType('custom-component', {
  model: {
    defaults: {
      // ... component config
    }
  }
});
```

### 3. Event Handling

Event names have changed:

```javascript
// Old
editor.on('component:add', handler);

// New
editor.on('component:create', handler);
```

### 4. Asset Management

Asset handling is now more structured:

```javascript
// Old
editor.AssetManager.add([...]);

// New - Use asset providers
assets: {
  providers: [{
    id: 'custom-provider',
    onLoad: async () => [...],
    onAdd: async (asset) => {...}
  }]
}
```

## Breaking Changes

### v1.0.0 → v1.0.51

1. **License Key Required**
   - All deployments now require a valid license key
   - Add to configuration: `licenseKey: 'your-key'`

2. **Import Path Changes**
   - Style imports no longer use `.css` extension
   - `import '@grapesjs/studio-sdk/style'` (not `style.css`)

3. **Default Storage**
   - Default storage type changed from 'local' to 'none'
   - Must explicitly configure storage

## Best Practices for Migration

1. **Test in Development First**
   - Create a separate branch for migration
   - Test all custom components and plugins
   - Verify storage and asset handling

2. **Update Dependencies**
   ```bash
   npm update @grapesjs/studio-sdk
   ```

3. **Review Custom Code**
   - Check all custom components
   - Update event listeners
   - Verify command usage

4. **Backup Projects**
   - Export all projects before migration
   - Test import after migration

## InvestorPrez-Specific Migration Notes

### Custom Blocks

Update block definitions in `presentationBlocks.ts`:

```javascript
// Ensure all blocks use new structure
{
  id: 'block-id',
  label: 'Block Label',
  category: 'Category',
  content: {
    type: 'component-type',
    // ... component definition
  }
}
```

### Storage Integration

Update `presentationService.ts`:

```javascript
// Ensure storage methods align with new SDK
async savePresentation(id: string, data: any) {
  // Convert to new format if needed
  const studioData = this.convertToStudioFormat(data);
  // ... save logic
}
```

### Typography Presets

Verify typography presets still work:

```javascript
// Check preset application
editor.getSelected()?.setStyle({
  'font-family': preset.fontFamily,
  'font-size': preset.fontSize,
  // ... other styles
});
```

## Troubleshooting

### Common Errors

1. **"licenseKey option not provided"**
   - Add valid license key to configuration
   - Check environment variables

2. **"Component type not found"**
   - Re-register custom components after initialization
   - Check component type names

3. **"Storage manager error"**
   - Verify storage configuration
   - Check API endpoints

### Debug Mode

Enable debug mode for migration:

```javascript
const studio = new Studio({
  // ... config
  debug: true,
  log: ['warning', 'error', 'debug']
});
```

## Resources

- [Official Migration Guide](https://grapesjs.com/docs/migration)
- [Studio SDK Changelog](https://github.com/GrapesJS/studio-sdk/releases)
- [InvestorPrez Issues](https://github.com/slyjic/investorprez/issues)