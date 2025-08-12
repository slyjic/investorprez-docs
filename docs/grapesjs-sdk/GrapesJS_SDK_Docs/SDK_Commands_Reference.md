# GrapesJS Studio SDK - Commands Reference

*Last Updated: August 12, 2025*
*Status: Current - Documentation Standards Update*

## Overview

The Studio SDK provides a comprehensive set of commands that can be executed through the editor instance. These commands allow programmatic control over various editor features.

## Command Structure

Commands are executed using the `runCommand` method:

```javascript
editor.runCommand('command-name', options);
```

## Font Management Commands

### studio:font-get
Retrieve all registered fonts in the editor.

```javascript
const fonts = editor.runCommand('studio:font-get');
// Returns: Array of font objects
```

### studio:font-add
Add a new font to the editor.

```javascript
editor.runCommand('studio:font-add', {
  id: 'custom-font',
  name: 'Custom Font',
  src: 'https://example.com/font.woff2',
  type: 'font'
});
```

### studio:font-remove
Remove a font from the editor.

```javascript
editor.runCommand('studio:font-remove', { 
  id: 'font-id' 
});
```

### studio:font-manager-open
Open the font manager UI.

```javascript
editor.runCommand('studio:font-manager-open');
```

## Core Editor Commands

### core:component-select
Select a component in the editor.

```javascript
editor.runCommand('core:component-select', {
  component: componentInstance
});
```

### core:component-delete
Delete the selected component.

```javascript
editor.runCommand('core:component-delete');
```

### core:undo
Undo the last action.

```javascript
editor.runCommand('core:undo');
```

### core:redo
Redo the previously undone action.

```javascript
editor.runCommand('core:redo');
```

### core:canvas-clear
Clear the entire canvas.

```javascript
editor.runCommand('core:canvas-clear');
```

## Panel Commands

### core:open-blocks
Open the blocks panel.

```javascript
editor.runCommand('core:open-blocks');
```

### core:open-layers
Open the layers panel.

```javascript
editor.runCommand('core:open-layers');
```

### core:open-styles
Open the styles panel.

```javascript
editor.runCommand('core:open-styles');
```

### core:open-traits
Open the traits/properties panel.

```javascript
editor.runCommand('core:open-traits');
```

## Storage Commands

### core:store
Save the current project state.

```javascript
editor.runCommand('core:store');
```

### core:load
Load a project state.

```javascript
editor.runCommand('core:load');
```

## Device Commands

### core:set-device-desktop
Set the canvas to desktop view.

```javascript
editor.runCommand('core:set-device-desktop');
```

### core:set-device-tablet
Set the canvas to tablet view.

```javascript
editor.runCommand('core:set-device-tablet');
```

### core:set-device-mobile
Set the canvas to mobile view.

```javascript
editor.runCommand('core:set-device-mobile');
```

## Modal Commands

### core:open-assets
Open the asset manager modal.

```javascript
editor.runCommand('core:open-assets');
```

## Custom Commands

You can register custom commands:

```javascript
editor.Commands.add('custom:my-command', {
  run(editor, sender, options) {
    // Command logic here
    console.log('Custom command executed', options);
  },
  stop(editor, sender, options) {
    // Cleanup logic here
  }
});

// Execute custom command
editor.runCommand('custom:my-command', { 
  customOption: 'value' 
});
```

## Command Events

Listen to command execution:

```javascript
editor.on('run:command-name', (options) => {
  console.log('Command executed with options:', options);
});

editor.on('stop:command-name', (options) => {
  console.log('Command stopped with options:', options);
});
```

## Best Practices

1. **Check Command Existence**: Before running a command, verify it exists:
   ```javascript
   if (editor.Commands.has('command-name')) {
     editor.runCommand('command-name');
   }
   ```

2. **Handle Errors**: Wrap command execution in try-catch blocks:
   ```javascript
   try {
     editor.runCommand('command-name', options);
   } catch (error) {
     console.error('Command failed:', error);
   }
   ```

3. **Command State**: Some commands can be active/inactive:
   ```javascript
   const isActive = editor.Commands.isActive('command-name');
   ```

4. **Command Results**: Some commands return values:
   ```javascript
   const result = editor.runCommand('command-name');
   ```