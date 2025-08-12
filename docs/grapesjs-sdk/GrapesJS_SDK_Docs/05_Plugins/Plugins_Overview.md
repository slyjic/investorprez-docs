# GrapesJS Studio SDK Plugins Overview

*Last Updated: August 12, 2025*
*Status: Current - GrapesJS SDK Reference Documentation*

## What are Plugins?

Plugins are extensions that enhance the core functionality of the GrapesJS editor. They are functions that run when the editor is initialized, allowing developers to:

- Customize the canvas behavior
- Add new component types
- Integrate external libraries
- Modify editor behaviors
- Keep the editor modular and scalable

## Benefits of Using Plugins

1. **Customization** - Tailor the editor to specific needs
2. **Reusability** - Share functionality across projects
3. **Integration** - Connect with external libraries and services
4. **Maintainability** - Keep code organized and modular

## Installing Plugins

Most Studio SDK plugins are available through the official plugins package:

```bash
# npm
npm i @grapesjs/studio-sdk-plugins

# pnpm
pnpm add @grapesjs/studio-sdk-plugins

# yarn
yarn add @grapesjs/studio-sdk-plugins

# CDN (replace 'latest' with specific version)
<script src="https://unpkg.com/@grapesjs/studio-sdk-plugins@latest/dist/[plugin-name]/index.umd.js"></script>
```

## Using Plugins

### Basic Usage

```javascript
import { pluginName } from '@grapesjs/studio-sdk-plugins';

const config = {
  plugins: [
    pluginName,
    // ... other plugins
  ],
  // ... other configuration
};
```

### With Options

```javascript
const config = {
  plugins: [
    {
      id: pluginName,
      options: {
        // Plugin-specific options
      }
    }
  ]
};
```

## Available Official Plugins

### 1. [Absolute Mode](Absolute-mode.md)
Enables free drag-and-drop positioning using absolute coordinates. Perfect for:
- Fixed-layout designs
- Print documents
- Business cards
- Certificates
- Static prototypes

### 2. [Grid Mode](Grid-mode.md)
Provides a grid layout system for structured designs.

### 3. [Rich Text Editor (ProseMirror)](Rich-text_editor_proseMirror.txt)
Advanced rich text editing capabilities using ProseMirror.

### 4. [Iconify](iconify.md)
Integration with Iconify for thousands of icons.

### 5. [Sidebar Buttons](sidebar-buttons.md)
Add custom buttons to the editor sidebar.

### 6. [Custom Renderer (React)](custom-renderer_react.md)
Custom rendering using React components.

## Creating Custom Plugins

### Plugin Structure

```javascript
const myPlugin = (editor, options = {}) => {
  // Default options
  const defaults = {
    // ... default settings
  };

  // Merge with user options
  const opts = { ...defaults, ...options };

  // Plugin logic
  editor.on('load', () => {
    // Initialize plugin features
  });

  // Add commands
  editor.Commands.add('my-command', {
    run(editor) {
      // Command logic
    }
  });

  // Add components
  editor.Components.addType('my-component', {
    // Component definition
  });
};

export default myPlugin;
```

### Plugin Best Practices

1. **Namespace Your Plugin**
   ```javascript
   const PLUGIN_NAME = 'myPlugin';
   const COMMAND_PREFIX = `${PLUGIN_NAME}:`;
   ```

2. **Provide Defaults**
   ```javascript
   const defaults = {
     enabled: true,
     // ... other defaults
   };
   ```

3. **Clean Up on Destroy**
   ```javascript
   editor.on('destroy', () => {
     // Clean up listeners, intervals, etc.
   });
   ```

4. **Document Options**
   ```javascript
   /**
    * @param {Object} options
    * @param {boolean} [options.enabled=true] - Enable/disable plugin
    * @param {string} [options.position='top'] - Position of elements
    */
   ```

## Plugin Categories

### Layout Plugins
- Absolute Mode - Free positioning
- Grid Mode - Grid-based layouts
- Flexbox helpers

### Component Plugins
- Table components
- Animation components
- Form builders

### Integration Plugins
- Iconify - Icon libraries
- Font providers
- Asset managers

### Editor Enhancement Plugins
- Rich text editors
- Code editors
- Color pickers

### Utility Plugins
- Export/Import helpers
- Keyboard shortcuts
- Undo/Redo enhancements

## Plugin Configuration

### Global Plugin Settings

```javascript
const config = {
  pluginManager: {
    // Global settings for all plugins
  },
  plugins: [
    // Plugin list
  ]
};
```

### Conditional Plugin Loading

```javascript
const plugins = [];

if (projectType === 'web') {
  plugins.push(webSpecificPlugin);
}

if (needsAbsoluteMode) {
  plugins.push(canvasAbsoluteMode);
}

const config = { plugins };
```

## InvestorPrez Plugin Usage

InvestorPrez currently uses or has used the following plugins:

1. **Absolute Mode** (Archived) - Was used for comment pin positioning
2. **Custom Block Plugins** - For presentation-specific blocks
3. **Storage Plugins** - Custom auto-save functionality

## Troubleshooting Plugins

### Common Issues

1. **Plugin Not Loading**
   - Check import path
   - Verify plugin is in the plugins array
   - Check browser console for errors

2. **Plugin Conflicts**
   - Some plugins may conflict
   - Load order can matter
   - Check plugin documentation

3. **License Issues**
   - Some plugins require valid license
   - Check console for license warnings

### Debug Mode

```javascript
const config = {
  plugins: [
    {
      id: pluginName,
      options: {
        debug: true
      }
    }
  ]
};
```

## Resources

- [Official Plugin Repository](https://github.com/GrapesJS/plugins)
- [Plugin Development Guide](https://grapesjs.com/docs/modules/Plugins.html)
- [Community Plugins](https://grapesjs.com/plugins)