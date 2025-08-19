# Configuration Overview

_Last Updated: August 12, 2025_
_Status: Current - GrapesJS SDK Reference Documentation_

Learn how to configure the Studio SDK and integrate it into your application. This includes detailed instructions on setting up various types of projects, how to load and store them, ensuring that you can leverage the full capabilities of the Studio SDK. For more information on setting up different types of projects, please refer to the relevant pages.

## Configuration Areas

### Projects

Learn how to configure the Studio SDK and integrate it into your application. This includes detailed instructions on setting up various types of projects, how to load and store them, ensuring that you can leverage the full capabilities of the Studio SDK.

**📖 [Project Configuration](./Configuration_Projects.md)**

### Blocks

The editor includes a Block module that allows you to define reusable content elements for your users in the project. You can customize blocks to include individual components or complex layouts.

**📖 [Blocks Configuration](./Configuration_Blocks.md)**

### Pages

The Studio SDK supports multipage functionality, allowing for customization in managing pages within your project.

**📖 [Pages Configuration](./Configuration_Pages.md)**

### Assets

Learn how to manage media and resources in your project, including uploading files and configuring storage settings. You can also integrate external services using Asset Providers, allowing you to load custom asset types such as images, videos, and documents.

**📖 [Assets Configuration](./Assets/Configuration_Assets_Overview.md)**

### Themes

Learn how to personalize the visual appearance of your editor, including customizing icons, choosing themes, and modifying styles to align with your brand's identity.

**📖 [Themes Configuration](./Configuration_Themes.md)**

### Layout

Discover how to adjust the layout interface of your editor, customizing panel positioning, dynamic layouts, responsive configurations and other structural elements to create an editor layout that best fits your users' workflow.

**📖 [Layout Configuration](./Layout/Configuration_Layout_Overview.md)**

### Global Styles

Define and manage styles that apply across your entire project, creating a cohesive and easily maintainable design system. Configure common styles, leverage CSS variables, and integrate external libraries to ensure consistent theming and styling for all components.

**📖 [Global Styles Configuration](./Configuration_Global-Styles.md)**

### Templates

Enable your users to select and start with pre-configured designs using our Template manager.

**📖 [Templates Configuration](./Configuration_Templates.md)**

### Data Sources

Connect your content to structured data and build dynamic, data-driven content with ease. Use variables, conditions, and repeatable collections to personalize content and automate rendering logic. Export fully resolved content or template-ready structures using merge tags.

**📖 [Data Sources Configuration](./Data-Sources/Configuration_Data-Sources_Overview.md)**

### Fonts

Customize the typography of your projects by managing fonts directly within the editor. Add custom fonts through project configuration, modify the default font list, and integrate external providers like Google Fonts. Enable a flexible and extensible font manager to give users full control over font selection.

**📖 [Fonts Configuration](./Configuration_Fonts.md)**

---

## Quick Start Guide

1. **Choose Your Project Type** - Start with [Project Types](../02_Project-Types/) to understand web, email, and document projects
2. **Configure Storage** - Set up [project storage](./Configuration_Projects.md#storage) and [asset storage](./Assets/Configuration_Assets_Overview.md#asset-storage)
3. **Customize the Interface** - Use [layout components](./Layout/Configuration_Layout_Components.md) to tailor the editor
4. **Add Content** - Configure [blocks](./Configuration_Blocks.md) and [templates](./Configuration_Templates.md)
5. **Style Your Projects** - Set up [themes](./Configuration_Themes.md) and [global styles](./Configuration_Global-Styles.md)

## Configuration Best Practices

- **Start Simple** - Begin with basic configuration and gradually add complexity
- **Use Cloud Storage** - For production, use cloud storage for both projects and assets
- **Plan Your Blocks** - Design reusable blocks that match your content needs
- **Test Responsive** - Ensure your configuration works across different devices
- **Document Changes** - Keep track of configuration changes for your team
