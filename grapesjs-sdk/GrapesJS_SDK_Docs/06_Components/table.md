# Table

*Last Updated: August 12, 2025*
*Status: Current - GrapesJS SDK Reference Documentation*

Project types

`web`

Plan

Startup plan

Add table component with additional functionalities.

![Table plugin](/docs-sdk/assets/images/table-plugin-f8c7596df01f9e12fb5d94a9de4ee502.png)

Install the Studio SDK plugins package:

- npm
- pnpm
- yarn
- CDN

  npm i @grapesjs/studio-sdk-plugins

  pnpm add @grapesjs/studio-sdk-plugins

  yarn add @grapesjs/studio-sdk-plugins

  // It's recommended to replace the `latest` tag with the specific latest version to avoid any potential breaking changes.// The loaded plugin is globally available via `globalThis.StudioSdkPlugins_tableComponent`."https://unpkg.com/@grapesjs/studio-sdk-plugins@latest/dist/tableComponent/index.umd.js"

Import and use the table plugin in your project:

- React
- JS
- 🍇  Demo

  import StudioEditor from '@grapesjs/studio-sdk/react';import '@grapesjs/studio-sdk/style';import { tableComponent } from "@grapesjs/studio-sdk-plugins";// ...<StudioEditor options={{      // ...      plugins: [        tableComponent.init({          block: { category: 'Extra', label: 'My Table' }        })      ],      project: {        default: {          pages: [            {              name: 'Home',              component: `                <h1>Table plugin</h1>                <table>                  <tbody>                    <tr>                      <td>Cell 0:0</td>                      <td></td>                    </tr>                    <tr>                      <td></td>                      <td>Cell 1:1</td>                    </tr>                  </tbody>                </table>            `},          ]        },      }      }}/>

  import createStudioEditor from '@grapesjs/studio-sdk';import '@grapesjs/studio-sdk/style';import { tableComponent } from "@grapesjs/studio-sdk-plugins";// ...createStudioEditor({ // ... plugins: [ tableComponent.init({ block: { category: 'Extra', label: 'My Table' } }) ], project: { default: { pages: [ { name: 'Home', component: ` <h1>Table plugin</h1> <table> <tbody> <tr> <td>Cell 0:0</td> <td></td> </tr> <tr> <td></td> <td>Cell 1:1</td> </tr> </tbody> </table> `}, ] }, } })

Code

.code-block-hmmk code { max-height: 600px; }

### Plugin options[​](#plugin-options "Direct link to Plugin options")

Property

Type

Description

block

Block options for the table component. See https://grapesjs.com/docs/api/block.html#properties for more information.

**Example**

    {  "category": "Extra",  "label": "Table"}

licenseKey

string

The license key for the plugin. This is optional, only required if the plugin is used outside of Studio SDK.

**Example**

    "your-license-key"

openSettings

function

Customize the layout for table component setting actions, which by default are shown in a popover.

**Example - Dialog Layout**

    ({ editor, layoutProps }) => {  // open settings in a dialog  editor.runCommand('studio:layoutToggle', {    ...layoutProps,    header: false,    style: { marginLeft: -20, marginRight: -20 },    placer: { type: 'dialog', title: layoutProps.header?.label },  });}

**Example - Sidebar Layout (InvestorPrez Implementation)**

    ({ editor, layoutProps }) => {
      // Open table settings in the right sidebar for better UX
      editor.runCommand('studio:layoutToggle', {
        ...layoutProps,
        header: { 
          label: 'Table Settings',
          collapsible: true
        },
        placer: { 
          type: 'static', 
          layoutId: 'sidebarRight' 
        },
        style: { 
          width: '100%',
          height: 'auto'
        }
      });
    }
