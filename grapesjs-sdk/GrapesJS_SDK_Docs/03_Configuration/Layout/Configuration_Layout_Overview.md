# Layout

_Last Updated: August 12, 2025_
_Status: Current - GrapesJS SDK Reference Documentation_

Studio SDK provides a powerful and flexible layout system specifically for the editor UI, enabling full customization of editor components and panel arrangements to suit your specific needs.

![Layout example 3 columns](/docs-sdk/assets/images/layout-example-3-columns-c1ddab2710d988c96a9c8a39b7034663.png)

![Layout example sidebar](/docs-sdk/assets/images/layout-example-sidebar-4491f363311daf2e56a882929d378f0f.png)

![Layout example sidebar inversed](/docs-sdk/assets/images/layout-example-sidebar-inv-799ec59a79fef3a7bc03ccf18786140e.png)

![Layout example rows](/docs-sdk/assets/images/layout-example-rows-f0894e895d5ae7001646e065d7b291e1.png)

## Table of Contents

- [Initialization](#initialization)
- [Layout Components](#layout-components)
- [Responsive Layout](#responsive-layout)
- [Layout Commands](#layout-commands)

## Initialization[​](#initialization "Direct link to Initialization")

Studio initializes with a preconfigured layout, allowing you to start using the editor right out of the box.

Below is the configuration used by the default layout via `layout.default` option.

- React
  import StudioEditor from '@grapesjs/studio-sdk/react';
  import '@grapesjs/studio-sdk/style';

        // ...
        <StudioEditor
          options={{
            // ...
            project: {
              default: {
                pages: [{ name: 'Home', component: '<h1>Home page</h1>'}]
              }
            },
            layout: {
              default: {
                type: 'row',
                style: { height: '100%' },
                children: [
                  { type: 'sidebarLeft' },
                  { type: 'canvasSidebarTop' },
                  { type: 'sidebarRight' }
                ]
              },
            }
          }}
        />

The layout is built using Studio component configurations, each defined by a `type` along with other properties.

Studio includes a set of predefined [Layout Components](#layout-components), which you can use to compose a customized editor interface.

### Required conditions[​](#required-conditions "Direct link to Required conditions")

When configuring the layout, keep these two requirements in mind:

1.  The root component of `layout.default` must be a [`row`](/docs-sdk/configuration/layout/components#row) or [`column`](/docs-sdk/configuration/layout/components#column) type.
2.  The `layout.default` must include inside one of the [Canvas components](/docs-sdk/configuration/layout/components#canvas-components).

## Layout Components[​](#layout-components "Direct link to Layout Components")

Check the [Layout Components](/docs-sdk/configuration/layout/components) page to explore all the components available for building your editor interface.

## Responsive Layout[​](#responsive-layout "Direct link to Responsive Layout")

Studio supports also responsive configuration, enabling the layout to adjust automatically based on the width of the editor container.

Just like with `layout.default`, each `responsive` layout configuration must adhere to the same [required conditions](#required-conditions).

- React
  import StudioEditor from '@grapesjs/studio-sdk/react';
  import '@grapesjs/studio-sdk/style';

        // ...
        <StudioEditor
          options={{
            // ...
            layout: {
              default: {
                type: 'row',
                style: { height: '100%' },
                children: [
                  { type: 'sidebarLeft' },
                  { type: 'canvasSidebarTop' },
                  { type: 'sidebarRight' }
                ]
              },
              responsive: {
                // Studio will switch the layout when the editor container width is below 1000px.
                1000: {
                  type: 'row',
                  style: { height: '100%' },
                  children: [{ type: 'sidebarLeft' }, { type: 'canvas' }]
                },
                600: {
                  type: 'column',
                  style: { height: '100%' },
                  children: [{ type: 'canvas' }, { type: 'row', children: 'Text' }]
                }
              }
            }
          }}
        />

## Layout Commands[​](#layout-commands "Direct link to Layout Commands")

Studio provides a set of commands for managing the layout of the editor interface.

### Dynamic layouts[​](#dynamic-layouts "Direct link to Dynamic layouts")

You can manage dynamic layouts with `studio:layoutAdd`, `studio:layoutRemove`, and `studio:layoutToggle` commands. Various `placer` types are available to position your components precisely.

#### Absolute placer[​](#absolute-placer "Direct link to Absolute placer")

Use `absolute` placer allows you to position the layout at a specific absolute location within the editor interface.

- React
  import StudioEditor from '@grapesjs/studio-sdk/react';
  import '@grapesjs/studio-sdk/style';

        // ...
        <StudioEditor
          options={{
            // ...
            layout: {
              default: {
                type: 'row',
                style: { height: '100%' },
                children: [
                  {
                    type: 'column',
                    style: { padding: 5, gap: 5, borderRightWidth: 1, zIndex: 20, alignItems: 'center' },
                    children: [
                      {
                        type: 'button',
                        icon: 'layers',
                        editorEvents: {
                          'studio:layoutToggle:layoutId1': ({ fromEvent, setState }) => setState({ active: fromEvent.isOpen })
                        },
                        onClick: ({ editor }) => {
                          editor.runCommand('studio:layoutRemove', { id: 'layoutId2' });
                          editor.runCommand('studio:layoutToggle', {
                            id: 'layoutId1',
                            layout: { type: 'panelPagesLayers' },
                            header: { label: 'Layers' },
                            placer: { type: 'absolute', position: 'left' },
                            style: { marginLeft: 42 }
                          });
                        }
                      },
                      {
                        type: 'button',
                        icon: 'viewGridPlus',
                        editorEvents: {
                          'studio:layoutToggle:layoutId2': ({ fromEvent, setState }) => setState({ active: fromEvent.isOpen })
                        },
                        onClick: ({ editor }) => {
                          editor.runCommand('studio:layoutRemove', { id: 'layoutId1' });
                          editor.runCommand('studio:layoutToggle', {
                            id: 'layoutId2',
                            layout: { type: 'panelBlocks' },
                            header: { label: 'Blocks' },
                            placer: { type: 'absolute', position: 'right' },
                          });
                        }
                      }
                    ]
                  },
                  { type: 'canvas', grow: true }
                ]
              },
            }
          }}
        />

#### Static placer[​](#static-placer "Direct link to Static placer")

Use `static` placer to position your components according to a specifically defined layout in your configuration.

- React
  import StudioEditor from '@grapesjs/studio-sdk/react';
  import '@grapesjs/studio-sdk/style';

        // ...
        <StudioEditor
          options={{
            // ...
            layout: {
              default: {
                type: 'row',
                style: { height: '100%' },
                children: [
                  {
                    type: 'column',
                    style: { padding: 5, gap: 5, borderRightWidth: 1, alignItems: 'center' },
                    children: [
                      {
                        type: 'button',
                        tooltip: 'Layers',
                        icon: 'layers',
                        editorEvents: {
                          'studio:layoutToggle:layoutId1': ({ fromEvent, setState }) => setState({ active: fromEvent.isOpen })
                        },
                        onClick: ({ editor }) => {
                          editor.runCommand('studio:layoutRemove', { id: 'layoutId2' });
                          editor.runCommand('studio:layoutToggle', {
                            id: 'layoutId1',
                            layout: { type: 'panelPagesLayers' },
                            header: { label: 'Layers' },
                            placer: { type: 'static', layoutId: 'hiddenLeftContainer' },
                            style: { width: 300, overflow: 'hidden' }
                          });
                        }
                      },
                      {
                        type: 'button',
                        tooltip: 'Blocks',
                        icon: 'viewGridPlus',
                        editorEvents: {
                          'studio:layoutToggle:layoutId2': ({ fromEvent, setState }) => setState({ active: fromEvent.isOpen })
                        },
                        onClick: ({ editor }) => {
                          editor.runCommand('studio:layoutRemove', { id: 'layoutId1' });
                          editor.runCommand('studio:layoutToggle', {
                            id: 'layoutId2',
                            layout: { type: 'panelBlocks' },
                            header: { label: 'Blocks' },
                            placer: { type: 'static', layoutId: 'hiddenRightContainer' },
                            style: { width: 300, overflow: 'hidden' }
                          });
                        }
                      }
                    ]
                  },
                  { id: 'hiddenLeftContainer', type: 'column' },
                  { type: 'canvas', grow: true },
                  { id: 'hiddenRightContainer', type: 'column' }
                ]
              }
            }
          }}
        />

#### Popover placer[​](#popover-placer "Direct link to Popover placer")

The `popover` placer allows you to position your components inside a dynamically positioned popover.

- React
  import StudioEditor from '@grapesjs/studio-sdk/react';
  import '@grapesjs/studio-sdk/style';

        // ...
        <StudioEditor
          options={{
            // ...
            layout: {
              default: {
                type: 'row',
                style: { height: '100%' },
                children: [
                  {
                    type: 'column',
                    style: { padding: 5, borderRightWidth: 1, alignItems: 'center', justifyContent: 'space-between' },
                    children: [
                      {
                        type: 'button',
                        tooltip: 'Layers',
                        icon: 'layers',
                        editorEvents: {
                          'studio:layoutToggle:layoutId1': ({ fromEvent, setState }) => setState({ active: fromEvent.isOpen })
                        },
                        onClick: ({ editor, event }) => {
                          const rect = event.currentTarget.getBoundingClientRect();
                          editor.runCommand('studio:layoutRemove', { id: 'layoutId2' });
                          editor.runCommand('studio:layoutToggle', {
                            id: 'layoutId1',
                            layout: { type: 'panelLayers' },
                            header: { label: 'Layers' },
                            placer: { type: 'popover', x: rect.x + rect.width, y: rect.y },
                            style: { height: 300, width: 230 }
                          });
                        }
                      },
                      {
                        type: 'button',
                        tooltip: 'Blocks',
                        icon: 'viewGridPlus',
                        editorEvents: {
                          'studio:layoutToggle:layoutId2': ({ fromEvent, setState }) => setState({ active: fromEvent.isOpen }),
                          'block:drag:stop': ({ fromEvent, editor }) => {
                            fromEvent && editor.runCommand('studio:layoutRemove', { id: 'layoutId2' });
                          }
                        },
                        onClick: ({ editor, event }) => {
                          const rect = event.currentTarget.getBoundingClientRect();
                          editor.runCommand('studio:layoutRemove', { id: 'layoutId1' });
                          editor.runCommand('studio:layoutToggle', {
                            id: 'layoutId2',
                            layout: { type: 'panelBlocks', symbols: false },
                            header: { label: 'Blocks' },
                            placer: { type: 'popover', closeOnClickAway: true, x: rect.x + rect.width, y: rect.y },
                            style: { height: 300, width: 230 }
                          });
                        }
                      }
                    ]
                  },
                  { type: 'canvas', grow: true }
                ]
              },
            }
          }}
        />

#### Dialog placer[​](#dialog-placer "Direct link to Dialog placer")

The `dialog` placer enables you to position your layout within a dialog component.

- React
  import StudioEditor from '@grapesjs/studio-sdk/react';
  import '@grapesjs/studio-sdk/style';

        // ...
        <StudioEditor
          options={{
            // ...
            layout: {
              default: {
                type: 'row',
                style: { height: '100%' },
                children: [
                  {
                    type: 'column',
                    style: { padding: 5, borderRightWidth: 1, alignItems: 'center' },
                    children: [
                      {
                        type: 'button',
                        tooltip: 'Layers',
                        icon: 'layers',
                        onClick: ({ editor }) => {
                          editor.runCommand('studio:layoutToggle', {
                            id: 'layoutId1',
                            header: false,
                            layout: { type: 'panelLayers' },
                            placer: { type: 'dialog', title: 'Layers' },
                            style: { height: 300 }
                          });
                        }
                      },
                      {
                        type: 'button',
                        tooltip: 'Blocks',
                        icon: 'viewGridPlus',
                        onClick: ({ editor }) => {
                          editor.runCommand('studio:layoutToggle', {
                            id: 'layoutId2',
                            header: false,
                            layout: { type: 'panelBlocks', symbols: false },
                            placer: { type: 'dialog', title: 'Blocks', size: 'l' },
                            style: { height: 300 }
                          });
                        }
                      }
                    ]
                  },
                  { type: 'canvas', grow: true }
                ]
              },
            }
          }}
        />
