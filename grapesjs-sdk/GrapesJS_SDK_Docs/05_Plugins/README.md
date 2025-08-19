# GrapesJS Studio SDK Plugins

*Last Updated: August 12, 2025*
*Status: Current - GrapesJS SDK Reference Documentation*

This directory contains documentation for all GrapesJS Studio SDK plugins.

## 📚 Plugin Documentation

### Overview & Guides
- [**Plugins Overview**](Plugins_Overview.md) - Introduction to the plugin system
- [**Complete Plugins Guide**](Complete_Plugins_Guide.md) - Comprehensive guide to all plugins

### Official Plugins

#### Layout & Positioning
- [**Absolute Mode**](Absolute-mode.md) - Free drag-and-drop positioning for fixed layouts
- [**Grid Mode**](Grid-mode.md) - Visual CSS Grid layout management

#### Components & UI
- [**Dialog**](Components/Dialog.md) - Modal dialogs and popups
- [**Accordion**](Components/Accordion.md) - Collapsible content sections
- [**Swiper (Slider)**](Components/Swiper.md) - Touch-enabled sliders and carousels
- [**LightGallery**](Components/LightGallery.md) - Feature-rich image and video gallery
- [**FsLightbox**](Components/FsLightbox.md) - Lightweight image viewer
- [**Flex Columns**](Components/Flex_Columns.md) - Advanced flexbox column layouts
- [**Iconify**](iconify.md) - Icon picker with thousands of icons from Iconify
- [**Table Component**](../06_Components/table.md) - Advanced table management
- [**Animation**](../06_Components/Animation.md) - Animation components
- [**Sidebar Buttons**](sidebar-buttons.md) - Custom sidebar button integration

#### Text & Content
- [**TinyMCE**](Rich-text-editor/TinyMCE.md) - World's most popular WYSIWYG editor
- [**Rich Text Editor (ProseMirror)**](Rich-text_editor_proseMirror.txt) - Advanced rich text editing
- [**Rich Text Editor**](../Rich-text-editor.md) - Standard rich text capabilities

#### Data Sources
- [**Data Sources Overview**](Data_Sources_Overview.md) - Dynamic content and template engines
- [**Handlebars Data Sources**](Data_Sources_Handlebars.md) - Handlebars template integration
- [**EJS Data Sources**](Data_Sources/EJS.md) - Embedded JavaScript templates

#### Canvas & Layout
- [**Canvas Full Size**](Canvas_Full_Size.md) - Enhanced canvas sizing and zoom controls

#### Rendering
- [**Custom Renderer (React)**](custom-renderer_react.md) - React component rendering
- [**React Renderer**](../07_Custom-Renderer/React-renderer.md) - Detailed React integration

#### Presets
- [**Printable Preset**](../08_Preset/Printable.md) - Print-optimized document creation

## 🚀 Quick Start

### Installing Plugins

```bash
npm i @grapesjs/studio-sdk-plugins
```

### Basic Usage

```javascript
import { pluginName } from '@grapesjs/studio-sdk-plugins';

const config = {
  plugins: [
    pluginName,
    // or with options
    pluginName.init({ /* options */ })
  ]
};
```

## 📦 Plugin Categories

### 1. **Layout Plugins**
Manage component positioning and layout structures
- Absolute Mode - Fixed positioning
- Grid Mode - CSS Grid layouts

### 2. **Component Plugins**
Add new component types to the editor
- Iconify - Icon components
- Table - Table structures
- Animation - Animated elements

### 3. **Enhancement Plugins**
Extend editor functionality
- Sidebar Buttons - UI extensions
- Rich Text Editor - Content editing

### 4. **Integration Plugins**
Connect with external libraries
- Custom Renderer - React integration
- Asset providers
- Data sources

## 🛠️ Creating Custom Plugins

See [Complete Plugins Guide](Complete_Plugins_Guide.md#plugin-development) for detailed plugin development instructions.

### Quick Example

```javascript
const myPlugin = (editor, options = {}) => {
  editor.on('load', () => {
    // Plugin logic
    editor.Commands.add('my-command', {
      run() { /* ... */ }
    });
  });
};
```

## 🎯 InvestorPrez Plugin Usage

InvestorPrez currently uses a minimal plugin approach:

| Plugin | Status | Purpose |
|--------|--------|---------|
| Absolute Mode | Archived | Was used for comment pins |
| Custom Blocks | Native | Presentation-specific blocks |
| Storage Handler | Native | Auto-save functionality |

### Future Considerations
- Grid Mode for template layouts
- Iconify for presentation icons
- Enhanced rich text editing

## 📖 Additional Resources

- [Plugin API Reference](https://grapesjs.com/docs/api/plugin_api.html)
- [Official Plugins Repository](https://github.com/GrapesJS/plugins)
- [Community Plugins](https://grapesjs.com/plugins)
- [Plugin Development Tutorial](https://grapesjs.com/docs/modules/Plugins.html)

## ⚠️ Important Notes

1. **License Key**: Some plugins require a valid Studio SDK license key
2. **Compatibility**: Not all core GrapesJS plugins work with Studio SDK
3. **Performance**: Load plugins conditionally based on need
4. **Order Matters**: Some plugins depend on load order

---

For plugin-specific details, refer to individual plugin documentation files.