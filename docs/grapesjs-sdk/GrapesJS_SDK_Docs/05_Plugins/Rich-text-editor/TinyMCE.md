# TinyMCE Rich Text Editor Plugin

*Last Updated: August 12, 2025*
*Status: Current - GrapesJS SDK Reference Documentation*

## Overview

The TinyMCE plugin integrates the world's most popular open-source rich text editor into GrapesJS Studio SDK. This plugin provides a comprehensive WYSIWYG editing experience with extensive formatting options, media management, and enterprise-grade features.

## Compatibility

- **Project Types**: `web`, `email`
- **Plan**: Startup plan (Basic features), Enterprise plan (Advanced features)
- **License**: TinyMCE API key required for cloud features
- **TinyMCE Version**: 6.x (latest)

## Features

- **Rich Formatting**: Bold, italic, underline, strikethrough, superscript, subscript
- **Text Styling**: Font family, size, color, background color
- **Paragraph Formatting**: Alignment, indentation, line height
- **Lists**: Ordered, unordered, and nested lists
- **Tables**: Advanced table creation and editing
- **Media**: Image upload, video embedding, media management
- **Links**: URL, email, anchor links with options
- **Code**: Syntax highlighting, code blocks
- **Templates**: Content templates and snippets
- **Plugins**: 50+ plugins available
- **Localization**: 100+ language packs

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
import { richTextTinyMCE } from '@grapesjs/studio-sdk-plugins';
import createStudioEditor from '@grapesjs/studio-sdk';

createStudioEditor({
  plugins: [
    richTextTinyMCE.init({
      apiKey: 'your-tinymce-api-key'
    })
  ],
  project: {
    type: 'web',
    default: {
      pages: [
        { name: 'Home', component: '<div>Rich text content here</div>' }
      ]
    }
  }
});
```

### React Integration

```javascript
import StudioEditor from '@grapesjs/studio-sdk/react';
import { richTextTinyMCE } from '@grapesjs/studio-sdk-plugins';

<StudioEditor
  options={{
    plugins: [
      richTextTinyMCE.init({
        apiKey: 'your-tinymce-api-key',
        config: {
          height: 500,
          menubar: true,
          plugins: [
            'advlist', 'autolink', 'lists', 'link', 'image', 'charmap',
            'preview', 'anchor', 'searchreplace', 'visualblocks', 'code',
            'fullscreen', 'insertdatetime', 'media', 'table', 'help'
          ],
          toolbar: 'undo redo | formatselect | ' +
            'bold italic backcolor | alignleft aligncenter ' +
            'alignright alignjustify | bullist numlist outdent indent | ' +
            'removeformat | help'
        }
      })
    ],
    project: {
      type: 'web'
    }
  }}
/>
```

## Plugin Options

| Option | Type | Description |
|--------|------|-------------|
| `apiKey` | `string` | TinyMCE API key (required for cloud features) |
| `config` | `object` | TinyMCE configuration object |
| `toolbar` | `string/array` | Toolbar button configuration |
| `plugins` | `array` | TinyMCE plugins to load |
| `contentStyle` | `string` | CSS to apply to editor content |
| `skin` | `string` | Editor skin (`'oxide'`, `'oxide-dark'`) |
| `language` | `string` | Editor language code |

### Example with Options

```javascript
plugins: [
  richTextTinyMCE.init({
    apiKey: 'your-tinymce-api-key',
    config: {
      height: 400,
      menubar: 'file edit view insert format tools table help',
      plugins: [
        'advlist', 'autolink', 'lists', 'link', 'image', 'charmap', 'preview',
        'anchor', 'searchreplace', 'visualblocks', 'code', 'fullscreen',
        'insertdatetime', 'media', 'table', 'code', 'help', 'wordcount',
        'emoticons', 'template', 'paste', 'directionality', 'codesample'
      ],
      toolbar: [
        'undo redo | formatselect | bold italic underline strikethrough | forecolor backcolor',
        'alignleft aligncenter alignright alignjustify | bullist numlist | outdent indent',
        'link image media table | code preview fullscreen | help'
      ],
      content_style: 'body { font-family: Arial, sans-serif; font-size: 14px; }',
      skin: 'oxide',
      language: 'en',
      browser_spellcheck: true,
      contextmenu: false
    }
  })
]
```

## Configuration Examples

### 1. Basic Configuration

```javascript
const basicConfig = {
  height: 300,
  menubar: false,
  plugins: ['lists', 'link', 'image', 'paste', 'help'],
  toolbar: 'undo redo | formatselect | bold italic | alignleft aligncenter alignright | bullist numlist | link image',
  content_style: 'body { font-family: Helvetica, Arial, sans-serif; }'
};
```

### 2. Advanced Configuration

```javascript
const advancedConfig = {
  height: 500,
  menubar: true,
  plugins: [
    'advlist', 'autolink', 'lists', 'link', 'image', 'charmap', 'preview',
    'anchor', 'searchreplace', 'visualblocks', 'codesample', 'fullscreen',
    'insertdatetime', 'media', 'table', 'help', 'wordcount', 'template',
    'paste', 'autosave', 'directionality', 'emoticons', 'hr', 'pagebreak',
    'nonbreaking', 'toc', 'imagetools', 'textpattern', 'noneditable'
  ],
  toolbar: [
    'undo redo | formatselect | bold italic underline strikethrough | \
    forecolor backcolor | alignleft aligncenter alignright alignjustify',
    'bullist numlist outdent indent | link image media | \
    table codesample | fullscreen preview | help'
  ],
  image_advtab: true,
  importcss_append: true,
  templates: [
    { title: 'New Table', description: 'Creates a new table', content: '<table>...</table>' },
    { title: 'Starting content', description: 'Basic template', url: 'templates/basic.html' }
  ],
  template_cdate_format: '[Date Created (CDATE): %m/%d/%Y : %H:%M:%S]',
  template_mdate_format: '[Date Modified (MDATE): %m/%d/%Y : %H:%M:%S]',
  image_caption: true,
  quickbars_selection_toolbar: 'bold italic | quicklink h2 h3 blockquote quickimage quicktable',
  noneditable_class: 'mceNonEditable',
  toolbar_mode: 'sliding',
  contextmenu: 'link image table',
  content_style: 'body { font-family: Helvetica, Arial, sans-serif; font-size: 16px }'
};
```

### 3. Email-Optimized Configuration

```javascript
const emailConfig = {
  height: 400,
  menubar: false,
  plugins: ['lists', 'link', 'image', 'paste', 'table', 'code'],
  toolbar: 'formatselect | bold italic | alignleft aligncenter alignright | bullist numlist | link image table',
  forced_root_block: 'div',
  inline_styles: true,
  convert_fonts_to_spans: true,
  table_default_attributes: {
    border: '0',
    cellpadding: '10',
    cellspacing: '0'
  },
  table_default_styles: {
    width: '100%',
    borderCollapse: 'collapse'
  },
  content_style: `
    body { 
      font-family: Arial, sans-serif; 
      font-size: 14px;
      line-height: 1.6;
    }
    table { 
      border-collapse: collapse; 
    }
  `
};
```

## Custom Formats

### Adding Custom Formats

```javascript
config: {
  formats: {
    highlight: { inline: 'span', styles: { backgroundColor: '#ff0' } },
    brandcolor: { inline: 'span', styles: { color: '#007bff' } }
  },
  style_formats: [
    { title: 'Headings', items: [
      { title: 'Heading 1', format: 'h1' },
      { title: 'Heading 2', format: 'h2' },
      { title: 'Heading 3', format: 'h3' }
    ]},
    { title: 'Inline', items: [
      { title: 'Bold', format: 'bold' },
      { title: 'Italic', format: 'italic' },
      { title: 'Highlight', format: 'highlight' },
      { title: 'Brand Color', format: 'brandcolor' }
    ]},
    { title: 'Blocks', items: [
      { title: 'Paragraph', format: 'p' },
      { title: 'Blockquote', format: 'blockquote' },
      { title: 'Code Block', format: 'pre' }
    ]}
  ]
}
```

## Image Management

### Image Upload Configuration

```javascript
config: {
  images_upload_url: '/api/upload',
  images_upload_base_path: '/uploads',
  images_upload_credentials: true,
  images_upload_handler: async (blobInfo, progress) => {
    const formData = new FormData();
    formData.append('file', blobInfo.blob(), blobInfo.filename());
    
    try {
      const response = await fetch('/api/upload', {
        method: 'POST',
        body: formData
      });
      
      const data = await response.json();
      return data.location;
    } catch (error) {
      throw new Error('Image upload failed');
    }
  },
  file_picker_types: 'image',
  file_picker_callback: (callback, value, meta) => {
    if (meta.filetype === 'image') {
      // Custom file picker logic
      const input = document.createElement('input');
      input.setAttribute('type', 'file');
      input.setAttribute('accept', 'image/*');
      
      input.onchange = function() {
        const file = this.files[0];
        const reader = new FileReader();
        
        reader.onload = function () {
          callback(reader.result, { alt: file.name });
        };
        
        reader.readAsDataURL(file);
      };
      
      input.click();
    }
  }
}
```

## Templates and Snippets

### Content Templates

```javascript
config: {
  templates: [
    {
      title: 'Newsletter Header',
      description: 'Standard newsletter header',
      content: `
        <table width="100%" cellpadding="0" cellspacing="0">
          <tr>
            <td align="center">
              <h1 style="color: #333;">Newsletter Title</h1>
              <p style="color: #666;">Monthly Update</p>
            </td>
          </tr>
        </table>
      `
    },
    {
      title: 'Call to Action',
      description: 'CTA button template',
      content: `
        <table cellpadding="0" cellspacing="0">
          <tr>
            <td style="background-color: #007bff; padding: 10px 20px;">
              <a href="#" style="color: white; text-decoration: none;">Click Here</a>
            </td>
          </tr>
        </table>
      `
    }
  ]
}
```

## Plugins

### Essential Plugins

```javascript
// Core editing
'paste', 'searchreplace', 'autolink', 'directionality', 'visualblocks', 'visualchars', 'fullscreen'

// Formatting
'link', 'image', 'media', 'table', 'charmap', 'hr', 'pagebreak', 'nonbreaking', 'anchor', 'toc'

// Advanced features
'insertdatetime', 'advlist', 'lists', 'wordcount', 'imagetools', 'textpattern', 'noneditable'

// Premium plugins (require additional license)
'mentions', 'checklist', 'mediaembed', 'casechange', 'export', 'formatpainter', 'permanentpen'
```

## API Integration

### Accessing TinyMCE Instance

```javascript
editor.on('rte:enable', (view, rte) => {
  if (rte.constructor.name === 'TinyMCE') {
    const tinymce = rte.editor;
    
    // Use TinyMCE API
    tinymce.on('change', () => {
      console.log('Content changed:', tinymce.getContent());
    });
    
    // Add custom button
    tinymce.ui.registry.addButton('customButton', {
      text: 'My Button',
      onAction: () => {
        tinymce.insertContent('<p>Custom content</p>');
      }
    });
  }
});
```

### Custom Commands

```javascript
// Add custom command
editor.Commands.add('tinymce:insert-template', {
  run(editor, sender, options) {
    const rte = editor.RichTextEditor.getActive();
    if (rte && rte.editor) {
      rte.editor.insertContent(options.template);
    }
  }
});

// Use custom command
editor.runCommand('tinymce:insert-template', {
  template: '<div class="custom-template">Template content</div>'
});
```

## Styling

### Editor Appearance

```css
/* Custom editor styles */
.tox-tinymce {
  border: 2px solid #ddd;
  border-radius: 4px;
}

.tox .tox-toolbar {
  background-color: #f8f9fa;
}

.tox .tox-toolbar__group {
  border-color: #dee2e6;
}

/* Dark theme */
.dark-theme .tox-tinymce {
  border-color: #444;
}

.dark-theme .tox .tox-toolbar {
  background-color: #2a2a2a;
}
```

### Content Styles

```javascript
content_style: `
  body {
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
    font-size: 16px;
    line-height: 1.6;
    color: #333;
  }
  
  h1, h2, h3, h4, h5, h6 {
    font-weight: 600;
    line-height: 1.2;
    margin-top: 1em;
    margin-bottom: 0.5em;
  }
  
  p {
    margin: 1em 0;
  }
  
  blockquote {
    border-left: 4px solid #ddd;
    padding-left: 1em;
    margin-left: 0;
    font-style: italic;
  }
  
  pre {
    background: #f4f4f4;
    padding: 1em;
    border-radius: 4px;
    overflow-x: auto;
  }
  
  table {
    border-collapse: collapse;
    width: 100%;
    margin: 1em 0;
  }
  
  table th,
  table td {
    border: 1px solid #ddd;
    padding: 8px;
  }
  
  table th {
    background-color: #f4f4f4;
    font-weight: bold;
  }
`
```

## Localization

### Setting Language

```javascript
config: {
  language: 'es', // Spanish
  language_url: '/tinymce/langs/es.js',
  directionality: 'ltr', // or 'rtl' for right-to-left
}
```

### Available Languages

Common language codes:
- `en` - English
- `es` - Spanish
- `fr` - French
- `de` - German
- `it` - Italian
- `pt_BR` - Portuguese (Brazil)
- `zh_CN` - Chinese (Simplified)
- `ja` - Japanese
- `ko` - Korean
- `ar` - Arabic

## Security

### Content Filtering

```javascript
config: {
  // Restrict allowed elements
  valid_elements: 'p,br,strong,em,ul,ol,li,a[href|target],img[src|alt|width|height]',
  
  // Remove unwanted elements
  invalid_elements: 'script,style,iframe',
  
  // Force specific attributes
  forced_root_block: 'p',
  
  // Sanitize pasted content
  paste_as_text: true,
  paste_data_images: false,
  
  // Content Security Policy
  content_security_policy: "default-src 'self'"
}
```

## Performance

### Optimization Tips

```javascript
config: {
  // Lazy load plugins
  setup: (editor) => {
    editor.on('init', () => {
      // Load heavy plugins after init
      tinymce.PluginManager.load('imagetools', '/plugins/imagetools/plugin.min.js');
    });
  },
  
  // Minimize toolbar
  toolbar_mode: 'sliding',
  
  // Disable features not needed
  menubar: false,
  statusbar: false,
  
  // Cache configuration
  cache_suffix: '?v=6.0.0'
}
```

## Troubleshooting

### Common Issues

1. **Editor not loading**
   - Check API key is valid
   - Verify TinyMCE CDN is accessible
   - Check for JavaScript errors

2. **Toolbar buttons missing**
   - Ensure plugins are loaded
   - Check toolbar configuration syntax
   - Verify plugin names are correct

3. **Styles not applying**
   - Check content_style configuration
   - Verify CSS specificity
   - Test in different browsers

### Debug Mode

```javascript
config: {
  // Enable debug mode
  debug: true,
  
  // Log events
  setup: (editor) => {
    editor.on('init', () => console.log('Editor initialized'));
    editor.on('change', () => console.log('Content changed'));
    editor.on('error', (e) => console.error('Editor error:', e));
  }
}
```

## Integration with InvestorPrez

TinyMCE enhances InvestorPrez content editing:

### Use Cases

1. **Presentation Content**
   - Rich text slides
   - Formatted descriptions
   - Styled bullet points

2. **Company Information**
   - About us sections
   - Team bios
   - Product descriptions

3. **Legal Content**
   - Terms and conditions
   - Privacy policies
   - Disclaimers

### Example Implementation

```javascript
// Investor pitch content editor
const pitchEditor = {
  apiKey: 'your-key',
  config: {
    height: 400,
    menubar: false,
    plugins: ['lists', 'link', 'image', 'table', 'code'],
    toolbar: 'formatselect | bold italic | bullist numlist | link image',
    style_formats: [
      { title: 'Highlight', inline: 'span', styles: { backgroundColor: '#ffeb3b' } },
      { title: 'Brand Blue', inline: 'span', styles: { color: '#007bff' } },
      { title: 'Metric', inline: 'strong', styles: { fontSize: '1.5em', color: '#28a745' } }
    ],
    content_style: `
      body { 
        font-family: -apple-system, BlinkMacSystemFont, sans-serif;
        font-size: 16px;
        line-height: 1.6;
      }
      .metric { 
        color: #28a745; 
        font-size: 1.5em; 
        font-weight: bold; 
      }
    `
  }
};
```

## Related Documentation

- [Rich Text Editor Overview](../Rich-text-editor.md)
- [ProseMirror Plugin](./ProseMirror.md) - Alternative editor
- [Components Overview](../../03_Configuration/Components/Configuration_Components_Overview.md)

## Resources

- [TinyMCE Documentation](https://www.tiny.cloud/docs/)
- [TinyMCE Plugins](https://www.tiny.cloud/docs/plugins/)
- [TinyMCE API Reference](https://www.tiny.cloud/docs/api/)