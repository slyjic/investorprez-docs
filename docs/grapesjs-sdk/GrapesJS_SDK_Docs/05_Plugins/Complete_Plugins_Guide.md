# Complete GrapesJS Studio SDK Plugins Guide

*Last Updated: August 12, 2025*
*Status: Current - GrapesJS SDK Reference Documentation*

## Installation

All official Studio SDK plugins are available through a single package:

```bash
# npm
npm i @grapesjs/studio-sdk-plugins

# pnpm
pnpm add @grapesjs/studio-sdk-plugins

# yarn
yarn add @grapesjs/studio-sdk-plugins
```

## Official Plugins

### 1. Absolute Mode Plugin

**Purpose**: Enables free drag-and-drop positioning using absolute coordinates.

**Use Cases**:
- Fixed-layout designs
- Print documents
- Business cards
- Certificates
- Static prototypes

**Usage**:
```javascript
import { canvasAbsoluteMode } from '@grapesjs/studio-sdk-plugins';

const config = {
  plugins: [
    canvasAbsoluteMode
  ]
};
```

**Conditional Usage**:
```javascript
// Only for elements already using position: absolute
plugins: [
  canvasAbsoluteMode.init({
    conditional: true
  })
]
```

### 2. Grid Mode Plugin

**Purpose**: Visually manage CSS Grid layouts directly in the editor.

**Features**:
- Drag grid elements on canvas
- Update grid CSS properties from Style Manager
- Visual grid lines and helpers

**Usage**:
```javascript
import { canvasGridMode } from '@grapesjs/studio-sdk-plugins';

const config = {
  plugins: [
    canvasGridMode.init({
      styleableGrid: true
    })
  ]
};
```

**Example Grid Structure**:
```css
.grid-container {
  display: grid;
  grid-template-columns: repeat(12, 1fr);
  grid-template-rows: auto;
  gap: 1rem;
}

.grid-item {
  grid-column: span 4; /* 4 columns out of 12 */
}
```

### 3. Iconify Plugin

**Purpose**: Add icon components with an icon picker using Iconify collections.

**Features**:
- Access to thousands of icons
- Visual icon picker
- Multiple icon collections
- Customizable icon properties

**Usage**:
```javascript
import { iconifyComponent } from '@grapesjs/studio-sdk-plugins';

const config = {
  plugins: [
    iconifyComponent.init({
      block: { 
        category: 'Extra', 
        label: 'Icon' 
      },
      collections: ['mdi', 'fa-solid', 'heroicons'],
      extendIconComponent: true
    })
  ]
};
```

**Options**:
- `licenseKey` (string): Optional, for use outside SDK
- `block` (object): Block properties or `false` to skip
- `collections` (array): Icon collections to load
- `extendIconComponent` (boolean): Extend default icon component

### 4. Rich Text Editor (ProseMirror)

**Purpose**: Advanced rich text editing capabilities.

**Features**:
- Full rich text formatting
- Lists, headings, quotes
- Links and media
- Keyboard shortcuts

**Usage**:
```javascript
import { richTextEditor } from '@grapesjs/studio-sdk-plugins';

const config = {
  plugins: [
    richTextEditor.init({
      // ProseMirror options
    })
  ]
};
```

### 5. Sidebar Buttons Plugin

**Purpose**: Add custom buttons to the editor sidebar.

**Features**:
- Custom action buttons
- Icon support
- Tooltips
- Keyboard shortcuts

**Usage**:
```javascript
import { sidebarButtons } from '@grapesjs/studio-sdk-plugins';

const config = {
  plugins: [
    sidebarButtons.init({
      buttons: [
        {
          id: 'custom-action',
          label: 'Custom Action',
          icon: 'icon-class',
          command: 'custom-command'
        }
      ]
    })
  ]
};
```

### 6. Custom Renderer (React)

**Purpose**: Render components using React instead of vanilla HTML.

**Use Cases**:
- React component integration
- Dynamic component rendering
- Advanced interactivity

**Usage**:
```javascript
import { customRendererReact } from '@grapesjs/studio-sdk-plugins';

const config = {
  plugins: [
    customRendererReact.init({
      components: {
        'my-react-component': MyReactComponent
      }
    })
  ]
};
```

## Plugin Development

### Creating a Custom Plugin

```javascript
const myCustomPlugin = (editor, options = {}) => {
  const defaults = {
    // Default options
    enabled: true,
    position: 'top'
  };

  const opts = { ...defaults, ...options };

  // Plugin initialization
  editor.on('load', () => {
    console.log('Plugin loaded');
    
    // Add custom command
    editor.Commands.add('my-plugin:command', {
      run(editor) {
        // Command logic
      },
      stop(editor) {
        // Cleanup
      }
    });

    // Add custom component
    editor.Components.addType('my-component', {
      model: {
        defaults: {
          name: 'My Component',
          // Component config
        }
      },
      view: {
        // Component view
      }
    });

    // Add block
    if (opts.addBlock) {
      editor.Blocks.add('my-block', {
        label: 'My Block',
        content: { type: 'my-component' },
        category: 'Custom'
      });
    }
  });

  // Cleanup
  editor.on('destroy', () => {
    // Remove listeners, clear intervals, etc.
  });
};

// Export
export default myCustomPlugin;
```

### Plugin Best Practices

1. **Namespace Everything**
```javascript
const PLUGIN_NAME = 'my-plugin';
const COMMAND_PREFIX = `${PLUGIN_NAME}:`;
const COMPONENT_PREFIX = `${PLUGIN_NAME}-`;
```

2. **Provide TypeScript Types**
```typescript
interface MyPluginOptions {
  enabled?: boolean;
  position?: 'top' | 'bottom' | 'left' | 'right';
  customOption?: string;
}

declare function myPlugin(editor: Editor, options?: MyPluginOptions): void;
```

3. **Handle Errors Gracefully**
```javascript
try {
  // Plugin logic
} catch (error) {
  console.error(`${PLUGIN_NAME} Error:`, error);
  // Fallback behavior
}
```

4. **Document Thoroughly**
```javascript
/**
 * My Custom Plugin
 * 
 * @param {Editor} editor - GrapesJS editor instance
 * @param {Object} options - Plugin options
 * @param {boolean} [options.enabled=true] - Enable/disable plugin
 * @param {string} [options.position='top'] - Position of elements
 * 
 * @example
 * plugins: [
 *   myPlugin.init({ enabled: true, position: 'bottom' })
 * ]
 */
```

## Plugin Configuration

### Global Plugin Options

```javascript
const config = {
  pluginManager: {
    // Options applied to all plugins
    theme: 'dark',
    locale: 'en'
  },
  plugins: [
    // Individual plugins
  ]
};
```

### Conditional Loading

```javascript
const plugins = [];

// Load based on project type
if (projectType === 'web') {
  plugins.push(canvasGridMode);
  plugins.push(iconifyComponent);
}

if (projectType === 'email') {
  plugins.push(emailSpecificPlugin);
}

// Load based on user preferences
if (userPreferences.absoluteMode) {
  plugins.push(canvasAbsoluteMode);
}

const config = { plugins };
```

### Plugin Order

Some plugins may depend on load order:

```javascript
const config = {
  plugins: [
    // Load foundational plugins first
    coreEnhancementPlugin,
    
    // Then UI plugins
    sidebarButtons,
    
    // Finally, component plugins
    iconifyComponent,
    customComponents
  ]
};
```

## CDN Usage

For CDN usage, plugins are available globally:

```html
<!-- Load plugin -->
<script src="https://unpkg.com/@grapesjs/studio-sdk-plugins@latest/dist/canvasAbsoluteMode/index.umd.js"></script>

<script>
// Plugin available as global
const plugin = globalThis.StudioSdkPlugins_canvasAbsoluteMode;

createStudioEditor({
  plugins: [plugin]
});
</script>
```

## Troubleshooting

### Plugin Not Loading
1. Check import path is correct
2. Verify plugin is added to plugins array
3. Check browser console for errors
4. Ensure dependencies are installed

### Plugin Conflicts
1. Check if plugins modify same functionality
2. Try changing plugin order
3. Check plugin documentation for known conflicts
4. Use plugin options to disable conflicting features

### Performance Issues
1. Load plugins conditionally
2. Use lazy loading for heavy plugins
3. Monitor browser performance tab
4. Consider plugin alternatives

## InvestorPrez Plugin Usage

InvestorPrez uses the following plugin approach:

1. **Core Functionality**: Built-in without plugins
2. **Absolute Mode**: Previously used for comment pins (archived)
3. **Custom Blocks**: Implemented as native components
4. **Future Considerations**:
   - Grid Mode for layout templates
   - Iconify for presentation icons
   - Rich Text Editor for enhanced content

## Resources

- [Official Plugin Docs](https://grapesjs.com/docs/modules/Plugins.html)
- [Plugin Examples](https://github.com/GrapesJS/plugins)
- [Community Plugins](https://grapesjs.com/plugins)
- [Plugin Development Guide](https://grapesjs.com/docs/api/plugin_api.html)