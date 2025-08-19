# GrapesJS Studio SDK Documentation

*Last Updated: August 12, 2025*
*Status: Current - GrapesJS SDK Reference Documentation*

This directory contains comprehensive documentation for the GrapesJS Studio SDK used in InvestorPrez.

## 📚 Documentation Structure

### 1. Overview
- [Getting Started](01_Overview/Overview_Getting-Started.md) - Quick start guide
- [Editor Configurator](01_Overview/Overview_Editor-Configurator.md) - Editor configuration basics
- [Licenses](01_Overview/Overview_Licenses.md) - Licensing information

### 2. Project Types
- [Web Projects](02_Project-Types/Project-Types_Web.md) - Standard web page builder
- [Email Projects](02_Project-Types/Project-Types_Email.md) - MJML-powered email builder
- [Document Projects](02_Project-Types/Project-Types_Document.md) - Document creation

### 3. Configuration
- [Configuration Overview](03_Configuration/Configuration_Overview.md) - Main configuration guide
- [Projects](03_Configuration/Configuration_Projects.md) - Project setup and management
- [Blocks](03_Configuration/Configuration_Blocks.md) - Block configuration
- [Pages](03_Configuration/Configuration_Pages.md) - Multi-page support
- [Templates](03_Configuration/Configuration_Templates.md) - Template management
- [Themes](03_Configuration/Configuration_Themes.md) - Theme customization
- [Global Styles](03_Configuration/Configuration_Global-Styles.md) - CSS and styling
- [Fonts](03_Configuration/Configuration_Fonts.md) - Font management
- **Assets**
  - [Assets Overview](03_Configuration/Assets/Configuration_Assets_Overview.md)
  - [Asset Providers](03_Configuration/Assets/Configuration_Assets_Providers.md)
- **Components**
  - [Components Overview](03_Configuration/Components/Configuration_Components_Overview.md)
  - [Component Properties](03_Configuration/Components/Configuration_Component_Properties.md)
  - [Component Methods](03_Configuration/Components/Configuration_Components_Methods.md)
- **Layout**
  - [Layout Overview](03_Configuration/Layout/Configuration_Layout_Overview.md)
  - [Layout Components](03_Configuration/Layout/Configuration_Layout_Components.md)
- **Data Sources**
  - [Data Sources Overview](03_Configuration/Data-Sources/Configuration_Data-Sources_Overview.md)
  - [Template Engine](03_Configuration/Data-Sources/Configuration_Data-sources_Template-engine.md)

### 4. Device Manager API
- [Device Manager Overview](04_Device-Manager-API/Device-Manager-API_Overview.md) - Responsive design management

### 5. Plugins
- [**Plugins Overview**](05_Plugins/Plugins_Overview.md) - Introduction to plugin system
- [**Complete Plugins Guide**](05_Plugins/Complete_Plugins_Guide.md) - Comprehensive plugin reference
- [**Plugins Directory**](05_Plugins/README.md) - All plugin documentation
- **Available Plugins**:
  - [Absolute Mode](05_Plugins/Absolute-mode.md) - Absolute positioning
  - [Grid Mode](05_Plugins/Grid-mode.md) - Grid layout system
  - [Rich Text Editor](05_Plugins/Rich-text_editor_proseMirror.txt) - ProseMirror integration
  - [Iconify](05_Plugins/iconify.md) - Icon integration
  - [Sidebar Buttons](05_Plugins/sidebar-buttons.md) - Custom sidebar buttons
  - [Custom Renderer React](05_Plugins/custom-renderer_react.md) - React rendering
  - [Data Sources Overview](05_Plugins/Data_Sources_Overview.md) - Dynamic content systems
  - [Handlebars Data Sources](05_Plugins/Data_Sources_Handlebars.md) - Template engine integration
  - [Canvas Full Size](05_Plugins/Canvas_Full_Size.md) - Enhanced canvas controls

### 6. Components
- [Animation](06_Components/Animation.md) - Animation components
- [Table](06_Components/table.md) - Table component
- [List Pages](06_Components/List-pages.md) - Page listing component

### 7. Custom Renderer
- [React Renderer](07_Custom-Renderer/React-renderer.md) - Custom React rendering

### 8. Presets
- [Printable](08_Preset/Printable.md) - Print-optimized document creation preset

### 9. InvestorPrez Integration
- [**InvestorPrez Integration Overview**](09_InvestorPrez-Integration/InvestorPrez_Integration_Overview.md) - Complete InvestorPrez-specific implementation guide
  - Multi-presentation isolation
  - React 18.3.1 integration patterns
  - Storage and auto-save configuration
  - Troubleshooting InvestorPrez-specific issues

### 10. Reference
- [**SDK Commands Reference**](SDK_Commands_Reference.md) - Complete command API
- [**Migration Guide**](Migration_Guide.md) - Version migration and updates
- [Rich Text Editor](Rich-text-editor.md) - Rich text capabilities
- [Open Source Device](GrapesJS_open-source_device.md) - Device management

## 🚀 Quick Links

### Essential Reads
1. [Getting Started](01_Overview/Overview_Getting-Started.md)
2. [Configuration Overview](03_Configuration/Configuration_Overview.md)
3. [SDK Commands Reference](SDK_Commands_Reference.md)

### InvestorPrez-Specific Implementation
1. [**InvestorPrez Integration Overview**](09_InvestorPrez-Integration/InvestorPrez_Integration_Overview.md) - **START HERE** for InvestorPrez implementation
2. [React Renderer](07_Custom-Renderer/React-renderer.md) - React-specific patterns after reading integration guide
3. [Configuration Overview](03_Configuration/Configuration_Overview.md) - General configuration reference

### Common Tasks
- **InvestorPrez Implementation**: See [InvestorPrez Integration Overview](09_InvestorPrez-Integration/InvestorPrez_Integration_Overview.md)
- **Setting up a new project**: See [Project Types](02_Project-Types/)
- **Customizing blocks**: See [Blocks Configuration](03_Configuration/Configuration_Blocks.md)
- **Managing assets**: See [Assets Overview](03_Configuration/Assets/Configuration_Assets_Overview.md)
- **Adding custom fonts**: See [Fonts Configuration](03_Configuration/Configuration_Fonts.md)
- **Creating custom components**: See [Components Overview](03_Configuration/Components/Configuration_Components_Overview.md)

## 📝 Notes

- This documentation is based on GrapesJS Studio SDK v1.0.51
- For the latest updates, check the [official GrapesJS documentation](https://grapesjs.com/docs/)
- InvestorPrez-specific implementations may differ from standard SDK usage

## 🔧 InvestorPrez Integration

InvestorPrez uses the GrapesJS Studio SDK with the following customizations:

1. **Project Type**: Web project type for presentation building
2. **Storage**: Custom storage manager with auto-save functionality
3. **Blocks**: Custom presentation blocks (Hero, Features, Team, etc.)
4. **Themes**: Professional presentation themes
5. **Assets**: Vercel Blob storage integration
6. **Typography**: 6 professional typography presets
7. **Components**: Custom comment-pin component (archived)

For InvestorPrez-specific implementation details, see the main [Architecture Decisions](../../ARCHITECTURE_DECISIONS.md) document.