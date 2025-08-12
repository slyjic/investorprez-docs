# Document

*Last Updated: August 12, 2025*
*Status: Current - GrapesJS SDK Reference Documentation*

The Document project type extends the default [Web](/docs-sdk/project-types/web) project, offering a simplified setup for print-friendly HTML content. Ideal for layouts like invoices, reports, or badges, it ensures your designs remain consistent when exported for print.

![Document Builder](/docs-sdk/assets/images/printable-plugin-1053616058e037d32b8ddf9aa8935ae6.webp)

To function correctly, this project type requires the [Printable plugin](/docs-sdk/plugins/preset/printable).

- React
- JS
- 🍇  Demo

  import StudioEditor from '@grapesjs/studio-sdk/react';import '@grapesjs/studio-sdk/style';import { presetPrintable, canvasFullSize } from '@grapesjs/studio-sdk-plugins';// ...<StudioEditor options={{      // ...      plugins: [        presetPrintable,        canvasFullSize, // Optional      ],      project: {        type: 'document', // Ensure the project type is set to 'document'        default: {          pages: [            {              name: 'Invoice',              component: `<!DOCTYPE html>                <html>                  <body style="padding: 40px; font-family: Arial, Helvetica, sans-serif">                    <h1>New Document</h1>                    <p>Content of the document.</p>                  </body>                <html>              `,            }          ]        }      },      // Custom layout for demo purposes      layout: {        default: {          type: 'row',          height: '100%',          children: [            {              type: 'sidebarLeft',              children: { type: 'panelLayers', header: { label: 'Layers', collapsible: false, icon: 'layers' } }            },            {              type: 'canvasSidebarTop',              sidebarTop: {                rightContainer: {                  buttons: ({ items }) => [                    {                      id: 'print',                      icon: '<svg viewBox="0 0 24 24"><path d="M18 3H6v4h12m1 5a1 1 0 0 1-1-1 1 1 0 0 1 1-1 1 1 0 0 1 1 1 1 1 0 0 1-1 1m-3 7H8v-5h8m3-6H5a3 3 0 0 0-3 3v6h4v4h12v-4h4v-6a3 3 0 0 0-3-3Z"/></svg>',                      onClick: ({ editor }) => editor.runCommand('presetPrintable:print')                    },                    ...items.filter(item => !['showImportCode', 'fullscreen'].includes(item.id))                  ]                }              }            },            { type: 'sidebarRight' }          ]        }      },          }}/>

  import createStudioEditor from '@grapesjs/studio-sdk';import '@grapesjs/studio-sdk/style';import { presetPrintable, canvasFullSize } from '@grapesjs/studio-sdk-plugins';// ...createStudioEditor({ // ... plugins: [ presetPrintable, canvasFullSize, // Optional ], project: { type: 'document', // Ensure the project type is set to 'document' default: { pages: [ { name: 'Invoice', component: `<!DOCTYPE html> <html> <body style="padding: 40px; font-family: Arial, Helvetica, sans-serif"> <h1>New Document</h1> <p>Content of the document.</p> </body> <html> `, } ] } }, // Custom layout for demo purposes layout: { default: { type: 'row', height: '100%', children: [ { type: 'sidebarLeft', children: { type: 'panelLayers', header: { label: 'Layers', collapsible: false, icon: 'layers' } } }, { type: 'canvasSidebarTop', sidebarTop: { rightContainer: { buttons: ({ items }) => [ { id: 'print', icon: '<svg viewBox="0 0 24 24"><path d="M18 3H6v4h12m1 5a1 1 0 0 1-1-1 1 1 0 0 1 1-1 1 1 0 0 1 1 1 1 1 0 0 1-1 1m-3 7H8v-5h8m3-6H5a3 3 0 0 0-3 3v6h4v4h12v-4h4v-6a3 3 0 0 0-3-3Z"/></svg>', onClick: ({ editor }) => editor.runCommand('presetPrintable:print') }, ...items.filter(item => !['showImportCode', 'fullscreen'].includes(item.id)) ] } } }, { type: 'sidebarRight' } ] } }, })

Code

.code-block-fyqqw5 code { max-height: 600px; }
