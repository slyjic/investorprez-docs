# Dialog Component Plugin

*Last Updated: August 12, 2025*
*Status: Current - GrapesJS SDK Reference Documentation*

## Overview

The Dialog component plugin provides modal dialog functionality for GrapesJS Studio SDK. This plugin enables you to create interactive modals, popups, and dialog boxes with customizable content, animations, and behaviors.

## Compatibility

- **Project Types**: `web`, `email`
- **Plan**: Startup plan
- **License**: Optional license key for use outside Studio SDK

## Features

- **Modal Dialogs**: Create fullscreen or sized modal windows
- **Customizable Content**: Add any content inside dialogs
- **Animation Support**: Built-in open/close animations
- **Overlay Options**: Configurable backdrop with click-to-close
- **Multiple Dialogs**: Support for stacked dialogs
- **Responsive Design**: Mobile-friendly dialog layouts
- **Accessibility**: Keyboard navigation and screen reader support

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
import { componentDialog } from '@grapesjs/studio-sdk-plugins';
import createStudioEditor from '@grapesjs/studio-sdk';

createStudioEditor({
  plugins: [
    componentDialog
  ],
  project: {
    type: 'web',
    default: {
      pages: [
        { name: 'Home', component: '<div>Click button to open dialog</div>' }
      ]
    }
  }
});
```

### React Integration

```javascript
import StudioEditor from '@grapesjs/studio-sdk/react';
import { componentDialog } from '@grapesjs/studio-sdk-plugins';

<StudioEditor
  options={{
    plugins: [componentDialog],
    project: {
      type: 'web',
      default: {
        pages: [{
          name: 'Dialog Demo',
          component: `
            <button data-gjs-type="dialog-trigger" data-target="my-dialog">
              Open Dialog
            </button>
            <div data-gjs-type="dialog" data-dialog-id="my-dialog">
              <div data-gjs-type="dialog-content">
                <h2>Dialog Title</h2>
                <p>This is dialog content.</p>
                <button data-gjs-type="dialog-close">Close</button>
              </div>
            </div>
          `
        }]
      }
    }
  }}
/>
```

## Plugin Options

| Option | Type | Description |
|--------|------|-------------|
| `licenseKey` | `string` | Optional license key for use outside Studio SDK |
| `block` | `object` | Block configuration or `false` to skip |
| `defaultAnimation` | `string` | Default animation (`'fade'`, `'slide'`, `'zoom'`) |
| `overlayClickClose` | `boolean` | Close dialog on overlay click (default: `true`) |
| `escapeKeyClose` | `boolean` | Close dialog on ESC key (default: `true`) |
| `focusTrap` | `boolean` | Trap focus within dialog (default: `true`) |

### Example with Options

```javascript
plugins: [
  componentDialog.init({
    licenseKey: 'your-license-key',
    block: {
      category: 'Interactive',
      label: 'Dialog',
      media: '<svg>...</svg>'
    },
    defaultAnimation: 'fade',
    overlayClickClose: true,
    escapeKeyClose: true,
    focusTrap: true
  })
]
```

## Component Types

### 1. Dialog Container

The main dialog wrapper:

```html
<div data-gjs-type="dialog" 
     data-dialog-id="unique-id"
     data-dialog-animation="fade"
     data-dialog-position="center">
  <!-- Dialog content here -->
</div>
```

### 2. Dialog Trigger

Button or element that opens the dialog:

```html
<button data-gjs-type="dialog-trigger" 
        data-target="unique-id">
  Open Dialog
</button>
```

### 3. Dialog Content

The content wrapper inside the dialog:

```html
<div data-gjs-type="dialog-content">
  <h2>Title</h2>
  <p>Content goes here</p>
</div>
```

### 4. Dialog Close

Close button inside the dialog:

```html
<button data-gjs-type="dialog-close">
  Close
</button>
```

## Styling

### Default Styles

```css
/* Dialog overlay */
.gs-dialog-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
  z-index: 1000;
  display: none;
}

/* Dialog container */
.gs-dialog {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background: white;
  border-radius: 8px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  max-width: 90%;
  max-height: 90vh;
  overflow: auto;
  z-index: 1001;
}

/* Dialog content */
.gs-dialog-content {
  padding: 2rem;
}

/* Dialog states */
.gs-dialog.open {
  display: block;
}

/* Animations */
.gs-dialog[data-animation="fade"] {
  opacity: 0;
  transition: opacity 0.3s ease;
}

.gs-dialog[data-animation="fade"].open {
  opacity: 1;
}
```

### Custom Styling

```javascript
// Add custom styles
editor.on('load', () => {
  editor.CssComposer.add(`
    .my-custom-dialog {
      width: 600px;
      max-width: 95%;
    }
    
    .my-custom-dialog .gs-dialog-content {
      background: #f5f5f5;
      padding: 3rem;
    }
  `);
});
```

## Advanced Examples

### 1. Confirmation Dialog

```html
<div data-gjs-type="dialog" data-dialog-id="confirm-dialog">
  <div data-gjs-type="dialog-content">
    <h3>Confirm Action</h3>
    <p>Are you sure you want to proceed?</p>
    <div class="dialog-actions">
      <button data-gjs-type="dialog-close">Cancel</button>
      <button data-gjs-type="dialog-confirm" class="primary">Confirm</button>
    </div>
  </div>
</div>
```

### 2. Form Dialog

```html
<div data-gjs-type="dialog" data-dialog-id="form-dialog">
  <div data-gjs-type="dialog-content">
    <h2>Contact Form</h2>
    <form>
      <div class="form-group">
        <label>Name</label>
        <input type="text" name="name" required>
      </div>
      <div class="form-group">
        <label>Email</label>
        <input type="email" name="email" required>
      </div>
      <div class="form-group">
        <label>Message</label>
        <textarea name="message" rows="4" required></textarea>
      </div>
      <div class="form-actions">
        <button type="button" data-gjs-type="dialog-close">Cancel</button>
        <button type="submit">Submit</button>
      </div>
    </form>
  </div>
</div>
```

### 3. Image Gallery Dialog

```html
<div data-gjs-type="dialog" data-dialog-id="gallery-dialog" class="fullscreen-dialog">
  <div data-gjs-type="dialog-content">
    <button data-gjs-type="dialog-close" class="close-btn">×</button>
    <div class="gallery-container">
      <img src="image1.jpg" alt="Gallery Image">
      <div class="gallery-nav">
        <button class="prev">Previous</button>
        <button class="next">Next</button>
      </div>
    </div>
  </div>
</div>
```

## JavaScript API

### Opening Dialogs Programmatically

```javascript
// Open a dialog
editor.runCommand('dialog:open', { id: 'my-dialog' });

// Close a dialog
editor.runCommand('dialog:close', { id: 'my-dialog' });

// Toggle a dialog
editor.runCommand('dialog:toggle', { id: 'my-dialog' });

// Close all dialogs
editor.runCommand('dialog:closeAll');
```

### Events

```javascript
// Dialog opened
editor.on('dialog:open', (dialog) => {
  console.log('Dialog opened:', dialog.getId());
});

// Dialog closed
editor.on('dialog:close', (dialog) => {
  console.log('Dialog closed:', dialog.getId());
});

// Before dialog open (cancelable)
editor.on('dialog:before-open', (dialog, event) => {
  // Prevent opening
  if (someCondition) {
    event.preventDefault();
  }
});
```

### Custom Dialog Actions

```javascript
// Add custom action handler
editor.Commands.add('dialog:custom-action', {
  run(editor, sender, options) {
    const { dialogId, action } = options;
    const dialog = editor.Components.find(`[data-dialog-id="${dialogId}"]`)[0];
    
    switch (action) {
      case 'confirm':
        // Handle confirmation
        console.log('Confirmed!');
        editor.runCommand('dialog:close', { id: dialogId });
        break;
    }
  }
});
```

## Configuration Examples

### 1. Alert Dialog Configuration

```javascript
const alertDialogConfig = {
  type: 'dialog',
  attributes: {
    'data-dialog-id': 'alert',
    'data-dialog-animation': 'zoom',
    'data-dialog-closeable': false
  },
  components: [{
    type: 'dialog-content',
    components: [
      { tagName: 'h3', content: 'Alert' },
      { tagName: 'p', content: 'This is an important message.' },
      { type: 'dialog-close', content: 'OK' }
    ]
  }]
};
```

### 2. Modal with Header and Footer

```javascript
const modalConfig = {
  type: 'dialog',
  attributes: { 'data-dialog-id': 'modal' },
  components: [
    {
      type: 'dialog-header',
      components: [
        { tagName: 'h2', content: 'Modal Title' },
        { type: 'dialog-close', content: '×' }
      ]
    },
    {
      type: 'dialog-content',
      components: [
        { tagName: 'p', content: 'Modal body content...' }
      ]
    },
    {
      type: 'dialog-footer',
      components: [
        { type: 'dialog-close', content: 'Close' },
        { tagName: 'button', content: 'Save', attributes: { class: 'primary' } }
      ]
    }
  ]
};
```

## Best Practices

### 1. **Accessibility**

```html
<!-- Add ARIA attributes -->
<div data-gjs-type="dialog" 
     role="dialog"
     aria-labelledby="dialog-title"
     aria-describedby="dialog-description">
  <div data-gjs-type="dialog-content">
    <h2 id="dialog-title">Dialog Title</h2>
    <p id="dialog-description">Dialog description...</p>
  </div>
</div>
```

### 2. **Mobile Responsiveness**

```css
@media (max-width: 768px) {
  .gs-dialog {
    width: 95%;
    max-height: 95vh;
    margin: 2.5vh auto;
  }
  
  .gs-dialog-content {
    padding: 1rem;
  }
}
```

### 3. **Performance**

```javascript
// Lazy load dialog content
editor.on('dialog:before-open', async (dialog) => {
  if (!dialog.get('loaded')) {
    const content = await fetchDialogContent(dialog.getId());
    dialog.components(content);
    dialog.set('loaded', true);
  }
});
```

## Troubleshooting

### Common Issues

1. **Dialog not opening**
   - Check dialog ID matches trigger target
   - Verify plugin is loaded
   - Check for JavaScript errors

2. **Z-index conflicts**
   - Adjust dialog z-index in CSS
   - Check for competing fixed elements
   - Use higher z-index values

3. **Content overflow**
   - Set max-height on dialog content
   - Add overflow: auto to content wrapper
   - Consider scrollable sections

### Debug Mode

```javascript
plugins: [
  componentDialog.init({
    debug: true,
    onError: (error) => {
      console.error('Dialog error:', error);
    }
  })
]
```

## Integration with InvestorPrez

Dialog components could enhance InvestorPrez presentations:

### Use Cases

1. **Interactive Presentations**
   - Pop-up details for charts/graphs
   - Additional information modals
   - Video player dialogs

2. **Forms and CTAs**
   - Contact forms in presentations
   - Email capture dialogs
   - Meeting scheduling modals

3. **Media Viewers**
   - Fullscreen image galleries
   - Document viewers
   - Video presentations

### Example Implementation

```javascript
// Investment details dialog
const investmentDialog = {
  type: 'dialog',
  attributes: { 'data-dialog-id': 'investment-details' },
  components: [{
    type: 'dialog-content',
    components: [
      { tagName: 'h2', content: 'Investment Opportunity' },
      { tagName: 'p', content: 'Minimum Investment: $50,000' },
      { tagName: 'p', content: 'Expected ROI: 25% annually' },
      { type: 'dialog-close', content: 'Close' }
    ]
  }]
};
```

## Related Documentation

- [Components Overview](../../03_Configuration/Components/Configuration_Components_Overview.md)
- [Animation](../Animation.md) - Animation components
- [Layout Components](../../03_Configuration/Layout/Configuration_Layout_Components.md)

## Resources

- [ARIA Dialog Pattern](https://www.w3.org/WAI/ARIA/apg/patterns/dialog-modal/)
- [Modal Accessibility](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/dialog_role)
- [CSS Animations](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Animations)