# Printable Preset

*Last Updated: August 12, 2025*
*Status: Current - GrapesJS SDK Reference Documentation*

## Overview

The Printable preset is a comprehensive plugin package designed specifically for creating print-ready documents in GrapesJS Studio SDK. It optimizes the editor for document creation, providing specialized tools, components, and styles for professional print layouts like invoices, reports, certificates, and business cards.

## Compatibility

- **Project Types**: `document`, `web`
- **Plan**: Startup plan
- **License**: Optional license key for use outside Studio SDK
- **Required for**: Document project type

## Features

- **Print-Optimized Components**: Specialized blocks for document creation
- **Page Size Management**: Support for standard paper sizes (A4, Letter, Legal, etc.)
- **Print Preview**: Native browser print preview integration
- **Print-Safe Styling**: CSS optimized for print media
- **Professional Templates**: Pre-built document templates
- **Measurement Units**: Support for print units (in, cm, mm, pt)

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
import { presetPrintable } from '@grapesjs/studio-sdk-plugins';
import createStudioEditor from '@grapesjs/studio-sdk';

createStudioEditor({
  plugins: [
    presetPrintable
  ],
  project: {
    type: 'document',
    default: {
      pages: [{
        name: 'Document',
        component: `
          <!DOCTYPE html>
          <html>
            <body style="padding: 40px; font-family: Arial, sans-serif">
              <h1>Print Document</h1>
              <p>Content optimized for printing.</p>
            </body>
          </html>
        `
      }]
    }
  }
});
```

### React Integration

```javascript
import StudioEditor from '@grapesjs/studio-sdk/react';
import { presetPrintable, canvasFullSize } from '@grapesjs/studio-sdk-plugins';

<StudioEditor
  options={{
    plugins: [
      presetPrintable,
      canvasFullSize // Optional: Enhanced canvas controls
    ],
    project: {
      type: 'document',
      default: {
        pages: [{
          name: 'Invoice',
          component: `
            <!DOCTYPE html>
            <html>
              <body style="padding: 40px; font-family: Arial, sans-serif">
                <header>
                  <h1>Invoice #2024-001</h1>
                  <p>Date: January 15, 2024</p>
                </header>
                <main>
                  <section>
                    <h2>Bill To:</h2>
                    <p>Client Name<br/>123 Business Ave<br/>City, State 12345</p>
                  </section>
                  <table style="width: 100%; border-collapse: collapse; margin: 20px 0;">
                    <thead>
                      <tr style="border-bottom: 2px solid #333;">
                        <th>Description</th>
                        <th>Quantity</th>
                        <th>Rate</th>
                        <th>Amount</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>Consulting Services</td>
                        <td>10</td>
                        <td>$150.00</td>
                        <td>$1,500.00</td>
                      </tr>
                    </tbody>
                  </table>
                </main>
              </body>
            </html>
          `
        }]
      }
    }
  }}
/>
```

### Complete Document Example

```javascript
import { presetPrintable, canvasFullSize } from '@grapesjs/studio-sdk-plugins';

const editor = createStudioEditor({
  plugins: [presetPrintable, canvasFullSize],
  project: {
    type: 'document',
    default: {
      pages: [{
        name: 'Business Report',
        component: `
          <!DOCTYPE html>
          <html>
            <head>
              <style>
                @media print {
                  body { margin: 0; }
                  .page-break { page-break-before: always; }
                }
                body {
                  font-family: 'Times New Roman', serif;
                  line-height: 1.6;
                  padding: 1in;
                  max-width: 8.5in;
                }
                .header {
                  text-align: center;
                  margin-bottom: 2em;
                  border-bottom: 2px solid #333;
                  padding-bottom: 1em;
                }
                .section {
                  margin: 2em 0;
                }
                table {
                  width: 100%;
                  border-collapse: collapse;
                  margin: 1em 0;
                }
                th, td {
                  border: 1px solid #ddd;
                  padding: 8px;
                  text-align: left;
                }
                th {
                  background-color: #f2f2f2;
                }
              </style>
            </head>
            <body>
              <div class="header">
                <h1>Annual Business Report</h1>
                <p>Fiscal Year 2024</p>
              </div>
              
              <div class="section">
                <h2>Executive Summary</h2>
                <p>This report provides an overview of our company's performance and achievements during the 2024 fiscal year.</p>
              </div>
              
              <div class="section">
                <h2>Financial Highlights</h2>
                <table>
                  <thead>
                    <tr>
                      <th>Metric</th>
                      <th>2024</th>
                      <th>2023</th>
                      <th>Change</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>Revenue</td>
                      <td>$2.5M</td>
                      <td>$2.1M</td>
                      <td>+19%</td>
                    </tr>
                    <tr>
                      <td>Net Income</td>
                      <td>$450K</td>
                      <td>$380K</td>
                      <td>+18%</td>
                    </tr>
                  </tbody>
                </table>
              </div>
              
              <div class="page-break"></div>
              
              <div class="section">
                <h2>Future Outlook</h2>
                <p>Looking ahead to 2025, we anticipate continued growth and expansion into new markets.</p>
              </div>
            </body>
          </html>
        `
      }]
    }
  },
  layout: {
    default: {
      type: 'row',
      style: { height: '100%' },
      children: [
        {
          type: 'sidebarLeft',
          children: {
            type: 'panelLayers',
            header: { label: 'Layers', collapsible: false }
          }
        },
        {
          type: 'canvasSidebarTop',
          sidebarTop: {
            rightContainer: {
              buttons: ({ items }) => [
                {
                  id: 'print',
                  icon: '<svg viewBox="0 0 24 24"><path d="M18 3H6v4h12m1 5a1 1 0 0 1-1-1 1 1 0 0 1 1-1 1 1 0 0 1 1 1 1 1 0 0 1-1 1m-3 7H8v-5h8m3-6H5a3 3 0 0 0-3 3v6h4v4h12v-4h4v-6a3 3 0 0 0-3-3Z"/></svg>',
                  tooltip: 'Print Document',
                  onClick: ({ editor }) => editor.runCommand('presetPrintable:print')
                },
                ...items.filter(item => !['showImportCode', 'fullscreen'].includes(item.id))
              ]
            }
          }
        },
        { type: 'sidebarRight' }
      ]
    }
  }
});
```

## Plugin Options

| Option | Type | Description |
|--------|------|-------------|
| `licenseKey` | `string` | Optional license key for use outside Studio SDK |
| `pageSize` | `string` | Default page size (`'A4'`, `'Letter'`, `'Legal'`, etc.) |
| `orientation` | `string` | Page orientation (`'portrait'`, `'landscape'`) |
| `margins` | `object` | Page margins `{ top, right, bottom, left }` |
| `printButton` | `boolean` | Show print button in toolbar (default: `true`) |
| `printPreview` | `boolean` | Enable print preview (default: `true`) |
| `units` | `string` | Default measurement units (`'px'`, `'in'`, `'cm'`, `'mm'`) |

### Example with Options

```javascript
plugins: [
  presetPrintable.init({
    licenseKey: 'your-license-key', // Only needed outside Studio SDK
    pageSize: 'A4',
    orientation: 'portrait',
    margins: {
      top: '1in',
      right: '1in',
      bottom: '1in',
      left: '1in'
    },
    printButton: true,
    printPreview: true,
    units: 'in'
  })
]
```

## Commands

### Print Commands

```javascript
// Print the current document
editor.runCommand('presetPrintable:print');

// Show print preview
editor.runCommand('presetPrintable:preview');

// Set page size
editor.runCommand('presetPrintable:setPageSize', { size: 'A4' });

// Set orientation
editor.runCommand('presetPrintable:setOrientation', { orientation: 'landscape' });

// Set margins
editor.runCommand('presetPrintable:setMargins', {
  margins: { top: '1in', right: '1in', bottom: '1in', left: '1in' }
});
```

### Page Management

```javascript
// Add page break
editor.runCommand('presetPrintable:addPageBreak');

// Remove page break
editor.runCommand('presetPrintable:removePageBreak');

// Set page numbering
editor.runCommand('presetPrintable:setPageNumbers', { enabled: true, format: 'Page {n} of {total}' });
```

## Standard Page Sizes

The preset supports standard paper sizes:

```javascript
const supportedSizes = {
  // ISO A Series
  'A3': { width: '11.7in', height: '16.5in' },
  'A4': { width: '8.27in', height: '11.7in' },
  'A5': { width: '5.83in', height: '8.27in' },
  
  // US Standard
  'Letter': { width: '8.5in', height: '11in' },
  'Legal': { width: '8.5in', height: '14in' },
  'Tabloid': { width: '11in', height: '17in' },
  
  // Business
  'Business Card': { width: '3.5in', height: '2in' },
  'Postcard': { width: '6in', height: '4in' },
  
  // Custom
  'Custom': { width: 'custom', height: 'custom' }
};
```

## Print-Optimized Blocks

The preset includes specialized blocks for documents:

### Document Structure Blocks

```javascript
// Header block
{
  id: 'doc-header',
  label: 'Document Header',
  category: 'Document',
  content: `
    <header style="text-align: center; border-bottom: 2px solid #333; padding-bottom: 1em; margin-bottom: 2em;">
      <h1>Document Title</h1>
      <p>Subtitle or Date</p>
    </header>
  `
}

// Footer block
{
  id: 'doc-footer',
  label: 'Document Footer',
  category: 'Document',
  content: `
    <footer style="text-align: center; border-top: 1px solid #ddd; padding-top: 1em; margin-top: 2em;">
      <p>© 2024 Company Name. All rights reserved.</p>
    </footer>
  `
}

// Page break block
{
  id: 'page-break',
  label: 'Page Break',
  category: 'Document',
  content: '<div class="page-break" style="page-break-before: always;"></div>'
}
```

### Content Blocks

```javascript
// Table block
{
  id: 'print-table',
  label: 'Print Table',
  category: 'Content',
  content: `
    <table style="width: 100%; border-collapse: collapse; margin: 1em 0;">
      <thead>
        <tr style="background-color: #f2f2f2;">
          <th style="border: 1px solid #ddd; padding: 8px;">Header 1</th>
          <th style="border: 1px solid #ddd; padding: 8px;">Header 2</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td style="border: 1px solid #ddd; padding: 8px;">Data 1</td>
          <td style="border: 1px solid #ddd; padding: 8px;">Data 2</td>
        </tr>
      </tbody>
    </table>
  `
}

// Signature block
{
  id: 'signature',
  label: 'Signature Line',
  category: 'Content',
  content: `
    <div style="margin: 2em 0;">
      <div style="border-bottom: 1px solid #333; width: 200px; margin-bottom: 0.5em;"></div>
      <p style="margin: 0; font-size: 0.9em;">Signature</p>
    </div>
  `
}
```

## CSS Print Styles

The preset automatically includes print-optimized CSS:

```css
@media print {
  /* Remove editor UI elements */
  .gjs-editor-cont { margin: 0 !important; }
  .gjs-cv-canvas { background: white !important; }
  
  /* Page setup */
  @page {
    margin: 1in;
    size: A4;
  }
  
  /* Typography */
  body {
    font-family: 'Times New Roman', serif;
    font-size: 12pt;
    line-height: 1.4;
    color: black;
  }
  
  /* Layout */
  .page-break {
    page-break-before: always;
  }
  
  .no-print {
    display: none;
  }
  
  /* Tables */
  table {
    border-collapse: collapse;
  }
  
  th, td {
    border: 1px solid black;
  }
  
  /* Images */
  img {
    max-width: 100%;
    height: auto;
  }
  
  /* Colors */
  * {
    color: black !important;
    background: white !important;
  }
}
```

## Events

Listen to print-related events:

```javascript
// Before print
editor.on('print:before', () => {
  console.log('Preparing document for printing...');
});

// After print
editor.on('print:after', () => {
  console.log('Print dialog closed');
});

// Page size changed
editor.on('print:pageSize:update', (size) => {
  console.log('Page size changed to:', size);
});

// Margins changed
editor.on('print:margins:update', (margins) => {
  console.log('Margins updated:', margins);
});
```

## Templates

The preset can include pre-built templates:

### Invoice Template

```javascript
const invoiceTemplate = {
  name: 'Invoice Template',
  component: `
    <!DOCTYPE html>
    <html>
      <head>
        <style>
          body { font-family: Arial, sans-serif; padding: 40px; }
          .header { display: flex; justify-content: space-between; margin-bottom: 2em; }
          .invoice-details { margin: 2em 0; }
          .billing-info { display: flex; justify-content: space-between; margin: 2em 0; }
          table { width: 100%; border-collapse: collapse; margin: 2em 0; }
          th, td { border: 1px solid #ddd; padding: 12px; text-align: left; }
          th { background-color: #f2f2f2; }
          .total { text-align: right; font-weight: bold; font-size: 1.2em; }
        </style>
      </head>
      <body>
        <div class="header">
          <div>
            <h1>INVOICE</h1>
            <p>Invoice #: INV-2024-001</p>
            <p>Date: January 15, 2024</p>
          </div>
          <div>
            <h3>Your Company</h3>
            <p>123 Business Street<br>City, State 12345<br>phone@company.com</p>
          </div>
        </div>
        
        <div class="billing-info">
          <div>
            <h3>Bill To:</h3>
            <p>Client Name<br>456 Client Avenue<br>Client City, State 67890</p>
          </div>
          <div>
            <h3>Payment Terms:</h3>
            <p>Due Date: February 15, 2024<br>Net 30</p>
          </div>
        </div>
        
        <table>
          <thead>
            <tr>
              <th>Description</th>
              <th>Quantity</th>
              <th>Rate</th>
              <th>Amount</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>Consulting Services</td>
              <td>10 hours</td>
              <td>$150.00</td>
              <td>$1,500.00</td>
            </tr>
            <tr>
              <td>Development Work</td>
              <td>20 hours</td>
              <td>$100.00</td>
              <td>$2,000.00</td>
            </tr>
          </tbody>
        </table>
        
        <div class="total">
          <p>Subtotal: $3,500.00</p>
          <p>Tax (8.5%): $297.50</p>
          <p><strong>Total: $3,797.50</strong></p>
        </div>
      </body>
    </html>
  `
};
```

## Best Practices

### 1. **Use Print-Safe Units**
```css
/* Preferred for print */
.document {
  width: 8.5in;
  height: 11in;
  padding: 1in;
  font-size: 12pt;
}

/* Avoid for print */
.document {
  width: 100vw;
  height: 100vh;
  padding: 5%;
  font-size: 1.2rem;
}
```

### 2. **Optimize Typography**
```css
body {
  font-family: 'Times New Roman', 'Georgia', serif; /* Print-safe fonts */
  font-size: 12pt; /* Standard print size */
  line-height: 1.4; /* Readable line spacing */
  color: black; /* High contrast */
}
```

### 3. **Handle Page Breaks**
```css
.section {
  page-break-inside: avoid; /* Keep sections together */
}

.page-break {
  page-break-before: always; /* Force new page */
}

table {
  page-break-inside: auto; /* Allow table breaks */
}

tr {
  page-break-inside: avoid; /* Keep rows together */
}
```

### 4. **Print Preview Testing**
```javascript
// Test print styles
editor.on('print:before', () => {
  // Add print-specific styles
  document.body.classList.add('print-mode');
});

editor.on('print:after', () => {
  // Remove print-specific styles
  document.body.classList.remove('print-mode');
});
```

## Troubleshooting

### Common Issues

1. **Print styles not applied**
   - Ensure `@media print` styles are included
   - Check for CSS specificity conflicts
   - Verify print preview is enabled

2. **Page breaks not working**
   - Use `page-break-before: always` CSS
   - Ensure elements are block-level
   - Check browser print settings

3. **Fonts not printing correctly**
   - Use web-safe fonts for print
   - Avoid custom fonts that may not be available
   - Test with system fonts

4. **Content cut off**
   - Check page margins
   - Verify page size settings
   - Test with different browsers

### Debug Mode

```javascript
plugins: [
  presetPrintable.init({
    debug: true,
    logPrintEvents: true
  })
]
```

## Integration with InvestorPrez

While not currently used, the Printable preset could enhance InvestorPrez for:

### Future Use Cases

1. **Print-Ready Presentations**
   - Investor pitch decks for print
   - Executive summaries
   - Term sheets

2. **Professional Documents**
   - Business plans
   - Financial reports
   - Legal documents

3. **Marketing Materials**
   - Company brochures
   - Fact sheets
   - Product catalogs

## Related Documentation

- [Canvas Full Size](../05_Plugins/Canvas_Full_Size.md) - Enhanced canvas controls
- [Document Project Type](../02_Project-Types/Project-Types_Document.md) - Document projects
- [Layout Components](../03_Configuration/Layout/Configuration_Layout_Components.md) - Custom layouts

## Resources

- [CSS Print Styles](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/print)
- [Print CSS Best Practices](https://www.smashingmagazine.com/2015/01/designing-for-print-with-css/)
- [Page Break Properties](https://developer.mozilla.org/en-US/docs/Web/CSS/page-break-before)