# Layout Components

_Last Updated: August 12, 2025_
_Status: Current - GrapesJS SDK Reference Documentation_

Below is a list of layout components available to help you compose your editor interface.

## Row

A component that arranges its child components in a horizontal row layout.

### Example

**React:**

```jsx
import StudioEditor from "@grapesjs/studio-sdk/react";
import "@grapesjs/studio-sdk/style";

<StudioEditor
  options={{
    layout: {
      default: {
        type: "column",
        style: { height: "100%" },
        children: [
          {
            type: "row",
            className: "custom-classname-row",
            style: {
              color: "white",
              padding: 3,
              height: 30,
              gap: 10,
            },
            children: [
              {
                type: "text",
                style: { backgroundColor: "green" },
                content: "Text 1",
              },
              {
                type: "text",
                style: { backgroundColor: "green" },
                content: "Text 2",
              },
              "Text 3",
            ],
          },
          { type: "canvas" },
          { type: "row", children: "Footer text" },
        ],
      },
    },
  }}
/>;
```

**JavaScript:**

```javascript
import createStudioEditor from "@grapesjs/studio-sdk";
import "@grapesjs/studio-sdk/style";

createStudioEditor({
  layout: {
    default: {
      type: "column",
      style: { height: "100%" },
      children: [
        {
          type: "row",
          className: "custom-classname-row",
          style: {
            color: "white",
            padding: 3,
            height: 30,
            gap: 10,
          },
          children: [
            {
              type: "text",
              style: { backgroundColor: "green" },
              content: "Text 1",
            },
            {
              type: "text",
              style: { backgroundColor: "green" },
              content: "Text 2",
            },
            "Text 3",
          ],
        },
        { type: "canvas" },
        { type: "row", children: "Footer text" },
      ],
    },
  },
});
```

You can easily customize the component, as with all layout components, by applying `className` and `style` properties.

### Row Properties

| Property         | Type               | Description                                                                                                                         |
| ---------------- | ------------------ | ----------------------------------------------------------------------------------------------------------------------------------- |
| `type`\*         | `row`              | Type of the layout component.                                                                                                       |
| `alignItems`     | `string`           | The alignment of inner components along the cross axis. Options: `"start"`, `"end"`, `"center"`, `"baseline"`, `"stretch"`          |
| `as`             | `string`           | The HTML tag to use for the layout component. Example: `"div"`                                                                      |
| `children`       | `Layout component` | The children layout components.                                                                                                     |
| `className`      | `string`           | The CSS class name(s) for the component.                                                                                            |
| `full`           | `boolean`          | If true, the component will take up the full available space. Default: `false`                                                      |
| `gap`            | `number`           | The gap between inner components. Example: `10`                                                                                     |
| `grow`           | `boolean`          | If true, the component will grow to fill available space. Default: `false`                                                          |
| `height`         | `string \| number` | The height of the component. Example: `100`                                                                                         |
| `htmlAttrs`      | `object`           | The HTML attributes for the component.                                                                                              |
| `id`             | `string`           | The unique identifier for the component.                                                                                            |
| `justifyContent` | `string`           | The alignment of inner components along the main axis. Options: `"start"`, `"end"`, `"center"`, `"between"`, `"around"`, `"evenly"` |
| `style`          | `object`           | The inline styles for the component.                                                                                                |
| `width`          | `string \| number` | The width of the component. Example: `100`                                                                                          |

---

## Column

Similar to the [`row`](#row), the column component arranges its children in a vertical layout.

### Example

**React:**

```jsx
import StudioEditor from "@grapesjs/studio-sdk/react";
import "@grapesjs/studio-sdk/style";

<StudioEditor
  options={{
    layout: {
      default: {
        type: "row",
        style: { height: "100%" },
        children: [
          {
            type: "column",
            style: { width: "200px" },
            children: ["Text 1", "Text 2"],
          },
          { type: "canvas" },
          {
            type: "column",
            style: { width: "200px" },
            children: "Text 1",
          },
        ],
      },
    },
  }}
/>;
```

**JavaScript:**

```javascript
import createStudioEditor from "@grapesjs/studio-sdk";
import "@grapesjs/studio-sdk/style";

createStudioEditor({
  layout: {
    default: {
      type: "row",
      style: { height: "100%" },
      children: [
        {
          type: "column",
          style: { width: "200px" },
          children: ["Text 1", "Text 2"],
        },
        { type: "canvas" },
        {
          type: "column",
          style: { width: "200px" },
          children: "Text 1",
        },
      ],
    },
  },
});
```

### Column Properties

| Property         | Type               | Description                                                                                                                         |
| ---------------- | ------------------ | ----------------------------------------------------------------------------------------------------------------------------------- |
| `type`\*         | `column`           | Type of the layout component.                                                                                                       |
| `alignItems`     | `string`           | The alignment of inner components along the cross axis. Options: `"start"`, `"end"`, `"center"`, `"baseline"`, `"stretch"`          |
| `as`             | `string`           | The HTML tag to use for the layout component. Example: `"div"`                                                                      |
| `children`       | `Layout component` | The children layout components.                                                                                                     |
| `className`      | `string`           | The CSS class name(s) for the component.                                                                                            |
| `full`           | `boolean`          | If true, the component will take up the full available space. Default: `false`                                                      |
| `gap`            | `number`           | The gap between inner components. Example: `10`                                                                                     |
| `grow`           | `boolean`          | If true, the component will grow to fill available space. Default: `false`                                                          |
| `height`         | `string \| number` | The height of the component. Example: `100`                                                                                         |
| `htmlAttrs`      | `object`           | The HTML attributes for the component.                                                                                              |
| `id`             | `string`           | The unique identifier for the component.                                                                                            |
| `justifyContent` | `string`           | The alignment of inner components along the main axis. Options: `"start"`, `"end"`, `"center"`, `"between"`, `"around"`, `"evenly"` |
| `style`          | `object`           | The inline styles for the component.                                                                                                |
| `width`          | `string \| number` | The width of the component. Example: `100`                                                                                          |

---

## Text

A basic text element that can be added to components accepting children. Text can be included either directly as a string or as an object `{ type: 'text', content: '...' }`. For usage examples, see the configurations above.

### Text Properties

| Property    | Type               | Description                                                    |
| ----------- | ------------------ | -------------------------------------------------------------- |
| `type`\*    | `text`             | Type of the layout component.                                  |
| `content`\* | `string`           | Content of the text. Example: `"Hello, World!"`                |
| `as`        | `string`           | The HTML tag to use for the layout component. Example: `"div"` |
| `children`  | `Layout component` | The children layout components.                                |
| `className` | `string`           | The CSS class name(s) for the component.                       |
| `htmlAttrs` | `object`           | The HTML attributes for the component.                         |
| `id`        | `string`           | The unique identifier for the component.                       |
| `style`     | `object`           | The inline styles for the component.                           |

---

## Tabs

A component that organizes content into a tabbed layout, enabling users to switch between different sections.

### Example

**React:**

```jsx
import StudioEditor from "@grapesjs/studio-sdk/react";
import "@grapesjs/studio-sdk/style";

<StudioEditor
  options={{
    project: {
      default: {
        pages: [
          {
            name: "Home",
            component:
              "<h1>Add dynamic tab by selecting the heading component</h1><div>Some content</div>",
          },
        ],
      },
    },
    layout: {
      default: {
        type: "row",
        style: { height: "100%" },
        children: [
          { type: "canvas" },
          {
            type: "column",
            style: { width: 300 },
            children: {
              type: "tabs",
              value: "tab2", // default selected tab
              tabs: [
                // tab id and label are required
                {
                  id: "tab1",
                  label: "Tab 1",
                  children: ["Content Tab 1"],
                },
                {
                  id: "tab2",
                  label: "Tab 2",
                  children: "Content Tab 2",
                },
              ],
              editorEvents: {
                // Update tabs state based on editor events
                "component:selected": ({ editor, state, setState }) => {
                  const customTabId = "tabHeading";
                  const initialTabs =
                    state.tabs?.filter((tab) => tab.id !== customTabId) || [];

                  if (editor.getSelected()?.get("type") === "heading") {
                    setState({
                      value: customTabId,
                      tabs: [
                        ...initialTabs,
                        {
                          id: "tabHeading",
                          label: "Heading",
                          children: ["Selected heading"],
                        },
                      ],
                    });
                  } else {
                    setState({ tabs: initialTabs });
                  }
                },
              },
            },
          },
        ],
      },
    },
  }}
/>;
```

**JavaScript:**

```javascript
import createStudioEditor from "@grapesjs/studio-sdk";
import "@grapesjs/studio-sdk/style";

createStudioEditor({
  project: {
    default: {
      pages: [
        {
          name: "Home",
          component:
            "<h1>Add dynamic tab by selecting the heading component</h1><div>Some content</div>",
        },
      ],
    },
  },
  layout: {
    default: {
      type: "row",
      style: { height: "100%" },
      children: [
        { type: "canvas" },
        {
          type: "column",
          style: { width: 300 },
          children: {
            type: "tabs",
            value: "tab2", // default selected tab
            tabs: [
              // tab id and label are required
              {
                id: "tab1",
                label: "Tab 1",
                children: ["Content Tab 1"],
              },
              {
                id: "tab2",
                label: "Tab 2",
                children: "Content Tab 2",
              },
            ],
            editorEvents: {
              // Update tabs state based on editor events
              "component:selected": ({ editor, state, setState }) => {
                const customTabId = "tabHeading";
                const initialTabs =
                  state.tabs?.filter((tab) => tab.id !== customTabId) || [];

                if (editor.getSelected()?.get("type") === "heading") {
                  setState({
                    value: customTabId,
                    tabs: [
                      ...initialTabs,
                      {
                        id: "tabHeading",
                        label: "Heading",
                        children: ["Selected heading"],
                      },
                    ],
                  });
                } else {
                  setState({ tabs: initialTabs });
                }
              },
            },
          },
        },
      ],
    },
  },
});
```

Each tab within the `tabs` property must include an `id` and `label` property. Additionally, the `value` property can be set to specify the default selected tab.

### Tabs Properties

| Property       | Type       | Description                                           |
| -------------- | ---------- | ----------------------------------------------------- |
| `type`\*       | `tabs`     | Type of the layout component.                         |
| `tabs`\*       | `array`    | Tabs configuration.                                   |
| `className`    | `string`   | The CSS class name(s) for the component.              |
| `editorEvents` | `object`   | Update layout component state based on editor events. |
| `id`           | `string`   | The unique identifier for the component.              |
| `onChange`     | `function` | The function to call when the field value changes.    |
| `style`        | `object`   | The inline styles for the component.                  |
| `value`        | `string`   | Tab id value to select on initial render.             |
| `variant`      | `string`   | Variant of the tabs. Example: `"pills"`               |

---

## Button

A button component that can be used to trigger actions.

### Example

**React:**

```jsx
import StudioEditor from "@grapesjs/studio-sdk/react";
import "@grapesjs/studio-sdk/style";

<StudioEditor
  options={{
    layout: {
      default: {
        type: "row",
        style: { height: "100%" },
        children: [
          {
            type: "column",
            style: {
              width: 100,
              justifyContent: "center",
              alignItems: "center",
              gap: 5,
            },
            children: [
              {
                type: "button",
                label: "Button",
                variant: "outline",
                onClick: () => alert("Button clicked"),
              },
              {
                type: "button",
                label: "Button",
                icon: "close",
                size: "s",
                tooltip: "Button tooltip",
                style: {
                  padding: 5,
                  backgroundColor: "red",
                  color: "white",
                },
                onClick: ({ editor }) => {
                  alert("Num of pages: " + editor.Pages.getAll().length);
                },
              },
              {
                type: "button",
                icon: '<svg viewBox="0 0 24 24"><path d="M12 2C11.5 2 11 2.19 10.59 2.59L2.59 10.59C1.8 11.37 1.8 12.63 2.59 13.41L10.59 21.41C11.37 22.2 12.63 22.2 13.41 21.41L21.41 13.41C22.2 12.63 22.2 11.37 21.41 10.59L13.41 2.59C13 2.19 12.5 2 12 2M11 7H13V13H11V7M11 15H13V17H11V15Z" style="fill: currentcolor;"></path></svg>',
                variant: "primary",
                onClick: () => alert("Icon only button"),
              },
              {
                type: "button",
                icon: "check",
                active: true,
                onClick: ({ state, setState }) => {
                  const newActive = !state.active;
                  alert("Is to activate?: " + newActive);
                  setState({ active: newActive });
                },
              },
            ],
          },
          { type: "canvas" },
        ],
      },
    },
  }}
/>;
```

The component accepts a `label` property for the button text, an `icon` that can be an SVG string or a [default icon name](/docs-sdk/configuration/themes#default-icons) and additional properties to customize the button layout (eg. `variant`, `size`).

Inside the `onClick` property, you have access to the [GrapesJS `editor` instance](https://grapesjs.com/docs/api/editor.html), as well as the `state` and `setState`, which allow you to interact with the editor or modify the current button's state.

In the [Layout Commands](/docs-sdk/configuration/layout/overview#layout-commands) section, you'll find more examples of button usage for managing editor layouts.

### Button Properties

| Property       | Type               | Description                                                                   |
| -------------- | ------------------ | ----------------------------------------------------------------------------- |
| `type`\*       | `button`           | Type of the layout component.                                                 |
| `active`       | `boolean`          | Indicates if the button is active. Default: `false`                           |
| `as`           | `string`           | The HTML tag to use for the layout component. Example: `"div"`                |
| `buttonType`   | `string`           | HTML button type attribute. Options: `"button"`, `"submit"`, `"reset"`        |
| `children`     | `Layout component` | The children layout components.                                               |
| `className`    | `string`           | The CSS class name(s) for the component.                                      |
| `disabled`     | `boolean`          | Indicates whether the component is disabled. Default: `false`                 |
| `editorEvents` | `object`           | Events to be handled by the editor.                                           |
| `icon`         | `string`           | Icon to be displayed in the button. Example: `"close"`                        |
| `id`           | `string`           | The unique identifier for the component.                                      |
| `label`        | `string`           | Label for the button, can be a ReactNode or a function returning a ReactNode. |
| `onClick`      | `function`         | Click event handler for the button.                                           |
| `size`         | `string`           | Size of the button. Options: `"xs"`, `"s"`, `"m"`, `"lg"`                     |
| `style`        | `object`           | The inline styles for the component.                                          |
| `tooltip`      | `string`           | Tooltip text for the button.                                                  |
| `variant`      | `string`           | Variant of the button style. Options: `"primary"`, `"outline"`, `"shallow"`   |

---

## Devices

Displays the available devices that users can switch between in the editor canvas for responsive style editing. The component is connected to the [GrapesJS Devices API](https://grapesjs.com/docs/api/device_manager.html).

### Example

**React:**

```jsx
import StudioEditor from "@grapesjs/studio-sdk/react";
import "@grapesjs/studio-sdk/style";

<StudioEditor
  options={{
    layout: {
      default: {
        type: "column",
        style: { height: "100%" },
        children: [
          {
            type: "row",
            style: {
              justifyContent: "center",
              alignItems: "center",
              gap: 5,
            },
            children: [
              {
                type: "button",
                label: "Add Random Device",
                onClick: ({ editor }) => {
                  const width = `${Math.floor(Math.random() * (1000 - 500 + 1) + 500)}px`;
                  const name = `Random ${width}`;
                  editor.Devices.add({
                    id: `random-${width}`,
                    name,
                    width,
                  });
                  alert(`Created "${name}"`);
                },
              },
              {
                type: "devices",
                style: { width: "100px" },
              },
            ],
          },
          { type: "canvas" },
        ],
      },
    },
  }}
/>;
```

### Devices Properties

| Property    | Type      | Description                                                    |
| ----------- | --------- | -------------------------------------------------------------- |
| `type`\*    | `devices` | Type of the layout component.                                  |
| `as`        | `string`  | The HTML tag to use for the layout component. Example: `"div"` |
| `className` | `string`  | The CSS class name(s) for the component.                       |
| `id`        | `string`  | The unique identifier for the component.                       |
| `style`     | `object`  | The inline styles for the component.                           |

---

## Panel Components

### PanelPages

Displays the pages of the project. The component is connected to the [GrapesJS Pages API](https://grapesjs.com/docs/api/pages.html) and the [Pages configuration](/docs-sdk/configuration/pages).

#### Example

**React:**

```jsx
import StudioEditor from "@grapesjs/studio-sdk/react";
import "@grapesjs/studio-sdk/style";

<StudioEditor
  options={{
    project: {
      default: {
        pages: [{ name: "Home", component: "<h1>Home page</h1>" }],
      },
    },
    layout: {
      default: {
        type: "row",
        style: { height: "100%" },
        children: [
          {
            type: "column",
            children: {
              type: "panelPages",
              style: { width: 300 },
              header: { label: "My pages", collapsible: false },
            },
          },
          { type: "canvas" },
        ],
      },
    },
  }}
/>;
```

#### PanelPages Properties

| Property    | Type         | Description                                                    |
| ----------- | ------------ | -------------------------------------------------------------- |
| `type`\*    | `panelPages` | Type of the layout component.                                  |
| `as`        | `string`     | The HTML tag to use for the layout component. Example: `"div"` |
| `className` | `string`     | The CSS class name(s) for the component.                       |
| `header`    | `object`     | Header of the panel.                                           |
| `htmlAttrs` | `object`     | The HTML attributes for the component.                         |
| `id`        | `string`     | The unique identifier for the component.                       |
| `resizable` | `object`     | Resizable configuration of the panel.                          |
| `style`     | `object`     | The inline styles for the component.                           |

---

### PanelPageSettings

Displays the [Page Settings](/docs-sdk/configuration/pages#settings) panel, allowing users to configure settings for individual pages.

#### Example

**React:**

```jsx
import StudioEditor from "@grapesjs/studio-sdk/react";
import "@grapesjs/studio-sdk/style";

<StudioEditor
  options={{
    project: {
      default: {
        pages: [{ name: "Home", component: "<h1>Home page</h1>" }],
      },
    },
    layout: {
      default: {
        type: "row",
        style: { height: "100%" },
        children: [
          {
            type: "column",
            style: { width: 300 },
            children: { type: "panelPageSettings" },
          },
          { type: "canvas" },
        ],
      },
    },
  }}
/>;
```

#### PanelPageSettings Properties

| Property    | Type                | Description                                                              |
| ----------- | ------------------- | ------------------------------------------------------------------------ |
| `type`\*    | `panelPageSettings` | Type of the layout component.                                            |
| `as`        | `string`            | The HTML tag to use for the layout component. Example: `"div"`           |
| `className` | `string`            | The CSS class name(s) for the component.                                 |
| `header`    | `object`            | Header of the panel.                                                     |
| `htmlAttrs` | `object`            | The HTML attributes for the component.                                   |
| `id`        | `string`            | The unique identifier for the component.                                 |
| `page`      | `Page`              | The page to display settings for. Example: `editor.Pages.getSelected();` |
| `resizable` | `object`            | Resizable configuration of the panel.                                    |
| `style`     | `object`            | The inline styles for the component.                                     |

---

### PanelLayers

Displays the layers of the currently selected page. The component is connected to the [GrapesJS Layers API](https://grapesjs.com/docs/api/layer_manager.html), enabling users to manage and organize their design layers efficiently.

#### Example

**React:**

```jsx
import StudioEditor from "@grapesjs/studio-sdk/react";
import "@grapesjs/studio-sdk/style";

<StudioEditor
  options={{
    project: {
      default: {
        pages: [{ name: "Home", component: "<h1>Home page</h1>" }],
      },
    },
    layout: {
      default: {
        type: "row",
        style: { height: "100%" },
        children: [
          {
            type: "column",
            style: { width: 300 },
            children: {
              type: "panelLayers",
              header: {
                label: "Layers label",
                icon: '<svg viewBox="0 0 24 24"><path d="M19,13H13V19H11V13H5V11H11V5H13V11H19V13Z"/></svg>',
              },
            },
          },
          { type: "canvas" },
        ],
      },
    },
  }}
/>;
```

#### PanelLayers Properties

| Property    | Type          | Description                                                    |
| ----------- | ------------- | -------------------------------------------------------------- |
| `type`\*    | `panelLayers` | Type of the layout component.                                  |
| `as`        | `string`      | The HTML tag to use for the layout component. Example: `"div"` |
| `className` | `string`      | The CSS class name(s) for the component.                       |
| `header`    | `object`      | Header of the panel.                                           |
| `htmlAttrs` | `object`      | The HTML attributes for the component.                         |
| `id`        | `string`      | The unique identifier for the component.                       |
| `resizable` | `object`      | Resizable configuration of the panel.                          |
| `style`     | `object`      | The inline styles for the component.                           |

---

### PanelPagesLayers

Displays a combined panel that includes both the [PanelPages](#panelpages) and [PanelLayers](#panellayers). This component provides a comprehensive view for managing project pages and their respective layers in a unified interface.

#### Example

**React:**

```jsx
import StudioEditor from "@grapesjs/studio-sdk/react";
import "@grapesjs/studio-sdk/style";

<StudioEditor
  options={{
    project: {
      default: {
        pages: [{ name: "Home", component: "<h1>Home page</h1>" }],
      },
    },
    layout: {
      default: {
        type: "row",
        style: { height: "100%" },
        children: [
          {
            type: "column",
            children: {
              type: "panelPagesLayers",
              resizable: {
                right: true,
                width: 300,
                height: "100%",
                minWidth: 200,
                maxWidth: 300,
              },
              panelPagesProps: { header: { label: "My Pages" } },
              panelLayersProps: { header: { label: "My Layers" } },
            },
          },
          { type: "canvas" },
        ],
      },
    },
  }}
/>;
```

#### PanelPagesLayers Properties

| Property           | Type               | Description                                                    |
| ------------------ | ------------------ | -------------------------------------------------------------- |
| `type`\*           | `panelPagesLayers` | Type of the layout component.                                  |
| `as`               | `string`           | The HTML tag to use for the layout component. Example: `"div"` |
| `className`        | `string`           | The CSS class name(s) for the component.                       |
| `header`           | `object`           | Header of the panel.                                           |
| `htmlAttrs`        | `object`           | The HTML attributes for the component.                         |
| `id`               | `string`           | The unique identifier for the component.                       |
| `panelLayersProps` | `PanelLayersProps` | Properties for the panel layers.                               |
| `panelPagesProps`  | `PanelPagesProps`  | Properties for the panel pages.                                |
| `resizable`        | `object`           | Resizable configuration of the panel.                          |
| `style`            | `object`           | The inline styles for the component.                           |

---

### PanelBlocks

Displays the blocks panel, which is connected to the [GrapesJS Blocks API](https://grapesjs.com/docs/api/block_manager.html).

#### Example

**React:**

```jsx
import StudioEditor from "@grapesjs/studio-sdk/react";
import "@grapesjs/studio-sdk/style";

<StudioEditor
  options={{
    layout: {
      default: {
        type: "row",
        style: { height: "100%" },
        children: [
          {
            type: "column",
            style: { width: 300 },
            children: [
              {
                type: "button",
                label: "Add Random Block",
                style: { margin: "10px auto" },
                variant: "outline",
                onClick: ({ editor }) => {
                  const id = Math.random().toString(36).substring(5);
                  const name = `Block ${id}`;
                  editor.Blocks.add(`block-${id}`, {
                    label: name,
                    category: "Random",
                    media:
                      '<svg viewBox="0 0 24 24"><path d="M19,3H5C3.89,3 3,3.89 3,5V19A2,2 0 0,0 5,21H19A2,2 0 0,0 21,19V5C21,3.89 20.1,3 19,3M19,5V19H5V5H19Z" /></svg>',
                    content: `<div>HTML from ${name}</div>`,
                  });
                  alert(`Created "${name}"`);
                },
              },
              {
                type: "panelBlocks",
                header: { label: "My blocks" },
              },
            ],
          },
          { type: "canvas" },
        ],
      },
    },
  }}
/>;
```

#### PanelBlocks Properties

| Property         | Type          | Description                                                    |
| ---------------- | ------------- | -------------------------------------------------------------- |
| `type`\*         | `panelBlocks` | Type of the layout component.                                  |
| `as`             | `string`      | The HTML tag to use for the layout component. Example: `"div"` |
| `blocks`         | `function`    | Filter blocks.                                                 |
| `className`      | `string`      | The CSS class name(s) for the component.                       |
| `header`         | `object`      | Header of the panel.                                           |
| `hideCategories` | `boolean`     | Whether to hide categories. Default: `false`                   |
| `htmlAttrs`      | `object`      | The HTML attributes for the component.                         |
| `id`             | `string`      | The unique identifier for the component.                       |
| `itemLayout`     | `function`    | Custom layout for rendering single blocks.                     |
| `resizable`      | `object`      | Resizable configuration of the panel.                          |
| `search`         | `boolean`     | Whether to show search. Default: `true`                        |
| `style`          | `object`      | The inline styles for the component.                           |
| `symbols`        | `boolean`     | Whether to show symbols. Default: `true`                       |

---

### PanelGlobalStyles

Displays Global Styles panel. The component is connected to the [Global Styles configuration](/docs-sdk/configuration/global-styles).

#### Example

**React:**

```jsx
import StudioEditor from "@grapesjs/studio-sdk/react";
import "@grapesjs/studio-sdk/style";

<StudioEditor
  options={{
    project: {
      default: {
        pages: [{ name: "Home", component: "<h1>Home page</h1>" }],
      },
    },
    layout: {
      default: {
        type: "row",
        style: { height: "100%" },
        children: [
          {
            type: "column",
            style: { width: 300 },
            children: [
              {
                type: "panelGlobalStyles",
                header: { label: "Global Styles" },
              },
            ],
          },
          { type: "canvas" },
        ],
      },
    },
    globalStyles: {
      default: [
        {
          id: "h1Color",
          property: "color",
          field: "color",
          defaultValue: "red",
          selector: "h1",
          label: "H1 color",
        },
      ],
    },
  }}
/>;
```

#### PanelGlobalStyles Properties

| Property    | Type                | Description                                                    |
| ----------- | ------------------- | -------------------------------------------------------------- |
| `type`\*    | `panelGlobalStyles` | Type of the layout component.                                  |
| `as`        | `string`            | The HTML tag to use for the layout component. Example: `"div"` |
| `className` | `string`            | The CSS class name(s) for the component.                       |
| `header`    | `object`            | Header of the panel.                                           |
| `htmlAttrs` | `object`            | The HTML attributes for the component.                         |
| `id`        | `string`            | The unique identifier for the component.                       |
| `resizable` | `object`            | Resizable configuration of the panel.                          |
| `style`     | `object`            | The inline styles for the component.                           |

---

### PanelSelectors

Displays component selectors, providing users with the ability to choose the styling target. The component is connected to the [GrapesJS Selectors API](https://grapesjs.com/docs/api/selector_manager.html).

#### Example

**React:**

```jsx
import StudioEditor from "@grapesjs/studio-sdk/react";
import "@grapesjs/studio-sdk/style";

<StudioEditor
  options={{
    project: {
      default: {
        pages: [{ name: "Home", component: "<h1>Home page</h1>" }],
      },
    },
    layout: {
      default: {
        type: "row",
        style: { height: "100%" },
        children: [
          { type: "canvas" },
          {
            type: "column",
            style: { width: 300 },
            children: {
              type: "panelSelectors",
              style: { padding: 5 },
            },
          },
        ],
      },
    },
  }}
/>;
```

#### PanelSelectors Properties

| Property        | Type             | Description                                                    |
| --------------- | ---------------- | -------------------------------------------------------------- |
| `type`\*        | `panelSelectors` | Type of the layout component.                                  |
| `as`            | `string`         | The HTML tag to use for the layout component. Example: `"div"` |
| `className`     | `string`         | The CSS class name(s) for the component.                       |
| `header`        | `object`         | Header of the panel.                                           |
| `htmlAttrs`     | `object`         | The HTML attributes for the component.                         |
| `id`            | `string`         | The unique identifier for the component.                       |
| `resizable`     | `object`         | Resizable configuration of the panel.                          |
| `stateSelector` | `boolean`        | Enable the state selector. Default: `false`                    |
| `style`         | `object`         | The inline styles for the component.                           |
| `styleCatalog`  | `boolean`        | Enable the style catalog. Default: `false`                     |

---

### PanelStyles

Displays the styles of the currently selected component, allowing users to easily view and edit styles directly within the editor. The component is connected to the [GrapesJS Style Manager API](https://grapesjs.com/docs/api/style_manager.html).

#### Example

**React:**

```jsx
import StudioEditor from "@grapesjs/studio-sdk/react";
import "@grapesjs/studio-sdk/style";

<StudioEditor
  options={{
    project: {
      default: {
        pages: [{ name: "Home", component: "<div>Select me</div>" }],
      },
    },
    layout: {
      default: {
        type: "row",
        style: { height: "100%" },
        children: [
          { type: "canvas" },
          {
            type: "column",
            style: { width: 300 },
            children: { type: "panelStyles" },
          },
        ],
      },
    },
  }}
/>;
```

#### PanelStyles Properties

| Property    | Type          | Description                                                    |
| ----------- | ------------- | -------------------------------------------------------------- |
| `type`\*    | `panelStyles` | Type of the layout component.                                  |
| `as`        | `string`      | The HTML tag to use for the layout component. Example: `"div"` |
| `className` | `string`      | The CSS class name(s) for the component.                       |
| `header`    | `object`      | Header of the panel.                                           |
| `htmlAttrs` | `object`      | The HTML attributes for the component.                         |
| `id`        | `string`      | The unique identifier for the component.                       |
| `resizable` | `object`      | Resizable configuration of the panel.                          |
| `style`     | `object`      | The inline styles for the component.                           |

---

### PanelProperties

Displays the properties of the currently selected component. The component is connected to the [GrapesJS Traits API](https://grapesjs.com/docs/modules/Traits.html).

#### Example

**React:**

```jsx
import StudioEditor from "@grapesjs/studio-sdk/react";
import "@grapesjs/studio-sdk/style";

<StudioEditor
  options={{
    project: {
      default: {
        pages: [{ name: "Home", component: "<h1>Select me</h1>" }],
      },
    },
    layout: {
      default: {
        type: "row",
        style: { height: "100%" },
        children: [
          { type: "canvas" },
          {
            type: "column",
            style: { width: 300 },
            children: {
              type: "panelProperties",
              style: { padding: 10 },
            },
          },
        ],
      },
    },
  }}
/>;
```

#### PanelProperties Properties

| Property    | Type              | Description                                                    |
| ----------- | ----------------- | -------------------------------------------------------------- |
| `type`\*    | `panelProperties` | Type of the layout component.                                  |
| `as`        | `string`          | The HTML tag to use for the layout component. Example: `"div"` |
| `className` | `string`          | The CSS class name(s) for the component.                       |
| `header`    | `object`          | Header of the panel.                                           |
| `htmlAttrs` | `object`          | The HTML attributes for the component.                         |
| `id`        | `string`          | The unique identifier for the component.                       |
| `resizable` | `object`          | Resizable configuration of the panel.                          |
| `style`     | `object`          | The inline styles for the component.                           |

---

### PanelSidebarTabs

Displays combined tab views for [PanelSelectors](#panelselectors), [PanelStyles](#panelstyles) and [PanelProperties](#panelproperties), allowing users to easily switch between different panel functionalities within the sidebar.

#### Example

**React:**

```jsx
import StudioEditor from "@grapesjs/studio-sdk/react";
import "@grapesjs/studio-sdk/style";

<StudioEditor
  options={{
    project: {
      default: {
        pages: [{ name: "Home", component: "<h1>Select me</h1>" }],
      },
    },
    layout: {
      default: {
        type: "row",
        style: { height: "100%" },
        children: [
          { type: "canvas" },
          {
            type: "column",
            style: { width: 300 },
            children: {
              type: "panelSidebarTabs",
            },
          },
        ],
      },
    },
  }}
/>;
```

#### PanelSidebarTabs Properties

| Property    | Type               | Description                                                    |
| ----------- | ------------------ | -------------------------------------------------------------- |
| `type`\*    | `panelSidebarTabs` | Type of the layout component.                                  |
| `as`        | `string`           | The HTML tag to use for the layout component. Example: `"div"` |
| `className` | `string`           | The CSS class name(s) for the component.                       |
| `header`    | `object`           | Header of the panel.                                           |
| `htmlAttrs` | `object`           | The HTML attributes for the component.                         |
| `id`        | `string`           | The unique identifier for the component.                       |
| `resizable` | `object`           | Resizable configuration of the panel.                          |
| `style`     | `object`           | The inline styles for the component.                           |

---

### PanelAssets

Displays project assets, providing users with access to various media and resources. The component is connected to the [GrapesJS Assets API](https://grapesjs.com/docs/api/assets.html).

#### Example

**React:**

```jsx
import StudioEditor from "@grapesjs/studio-sdk/react";
import "@grapesjs/studio-sdk/style";

<StudioEditor
  options={{
    gjsOptions: {
      storageManager: false,
      assetManager: {
        assets: Array(20)
          .fill(0)
          .map((_, i) => `https://picsum.photos/seed/${i}/300/300`),
      },
    },
    layout: {
      default: {
        type: "row",
        style: { height: "100%" },
        children: [
          {
            type: "column",
            style: { width: 400 },
            children: [
              {
                type: "panelAssets",
                header: { label: "My Assets" },
                content: {
                  itemsPerRow: 2,
                  header: { upload: false },
                },
                onSelect: ({ asset, editor }) => {
                  const root = editor.getWrapper();
                  let imgCmp = root.findFirstType("image");
                  if (!imgCmp) {
                    imgCmp = root.append({ type: "image" }, { at: 0 })[0];
                  }
                  imgCmp.set({ src: asset.getSrc() });
                },
              },
            ],
          },
          { type: "canvas" },
        ],
      },
    },
  }}
/>;
```

#### PanelAssets Properties

| Property           | Type          | Description                                                                                                                                                                                                                                                                                                                                             |
| ------------------ | ------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `type`\*           | `panelAssets` | Type of the layout component.                                                                                                                                                                                                                                                                                                                           |
| `as`               | `string`      | The HTML tag to use for the layout component. Example: `"div"`                                                                                                                                                                                                                                                                                          |
| `assets`           | `array`       | A custom array of assets. Overrides any other configured onLoad or providers.                                                                                                                                                                                                                                                                           |
| `className`        | `string`      | The CSS class name(s) for the component.                                                                                                                                                                                                                                                                                                                |
| `close`            | `function`    | Define how to close your AssetManager. For the main AssetManager, it closes the dialog.                                                                                                                                                                                                                                                                 |
| `content`          | `object`      | Content configuration for the AssetManager.                                                                                                                                                                                                                                                                                                             |
| `header`           | `object`      | Header of the panel.                                                                                                                                                                                                                                                                                                                                    |
| `htmlAttrs`        | `object`      | The HTML attributes for the component.                                                                                                                                                                                                                                                                                                                  |
| `id`               | `string`      | The unique identifier for the component.                                                                                                                                                                                                                                                                                                                |
| `onSelect`         | `function`    | Callback when an asset is selected.                                                                                                                                                                                                                                                                                                                     |
| `optionalProvider` | `boolean`     | When true, adds `{ id: undefined, label: 'Project assets' }` as an extra option for the asset provider filter at the beginning. Default: `true`                                                                                                                                                                                                         |
| `optionalType`     | `boolean`     | When true, adds `{ id: undefined, label: 'All' }` as an extra option for the asset type filter at the beginning. Default: `false`                                                                                                                                                                                                                       |
| `providerId`       | `string`      | Initial state of the asset provider filter. Example: `"unsplash"`                                                                                                                                                                                                                                                                                       |
| `providers`        | `array`       | The ids of providers that will be available in this assets panel layout. These providers need to exist in AssetsConfig.providers first. Defaults to all providers specified in AssetsConfig. Set to an empty array to hide the asset provider filter.                                                                                                   |
| `resizable`        | `object`      | Resizable configuration of the panel.                                                                                                                                                                                                                                                                                                                   |
| `style`            | `object`      | The inline styles for the component.                                                                                                                                                                                                                                                                                                                    |
| `typeId`           | `string`      | Initial state of the asset type filter. Default: `image`                                                                                                                                                                                                                                                                                                |
| `types`            | `array`       | Options that show up in the asset type filter. The selected type filters providers in the asset provider filter by `assetProvider.type`. This filter is required by default. To make it optional set `assetManagerProps.optionalType = true`. Set to an empty array to hide the asset type filter. Default: `[{ id: AssetType.image, label: 'Images'}]` |

---

### PanelTemplates

Displays a list of templates that users can select as a starting point for their project. For more details, refer to the [Templates page](/docs-sdk/configuration/templates).

#### Example

**React:**

```jsx
import StudioEditor from "@grapesjs/studio-sdk/react";
import "@grapesjs/studio-sdk/style";

<StudioEditor
  options={{
    layout: {
      default: {
        type: "row",
        style: { height: "100%" },
        children: [
          {
            type: "column",
            style: { width: 350 },
            children: [
              {
                type: "panelTemplates",
                classNameAccordion: "flex-grow h-full",
                classNameAccordionContent: "flex-grow h-full",
                header: { label: "Choose a template for your project" },
                content: { itemsPerRow: 1 },
                templates: [
                  {
                    id: "template1",
                    name: "Template 1",
                    data: {
                      pages: [
                        {
                          name: "Home",
                          component:
                            '<h1 class="title">Template 1</h1><style>.title { color: red; font-size: 10rem; text-align: center }</style>',
                        },
                      ],
                    },
                  },
                  {
                    id: "template2",
                    name: "Template 2",
                    data: {
                      pages: [
                        {
                          component:
                            '<h1 class="title">Template 2</h1><style>.title { color: blue; font-size: 10rem; text-align: center }</style>',
                        },
                      ],
                    },
                  },
                ],
              },
            ],
          },
          { type: "canvas" },
        ],
      },
    },
  }}
/>;
```

#### PanelTemplates Properties

| Property    | Type             | Description                                                    |
| ----------- | ---------------- | -------------------------------------------------------------- |
| `type`\*    | `panelTemplates` | Type of the layout component.                                  |
| `as`        | `string`         | The HTML tag to use for the layout component. Example: `"div"` |
| `className` | `string`         | The CSS class name(s) for the component.                       |
| `content`   | `object`         | Extra props to customize this layout panel.                    |
| `header`    | `object`         | Header of the panel.                                           |
| `htmlAttrs` | `object`         | The HTML attributes for the component.                         |
| `id`        | `string`         | The unique identifier for the component.                       |
| `onSelect`  | `function`       | Provide a custom handler for the select button.                |
| `resizable` | `object`         | Resizable configuration of the panel.                          |
| `style`     | `object`         | The inline styles for the component.                           |
| `templates` | `array`          | Custom array of templates to show in this panel.               |

---

## Custom

Provide a custom React component via `component` or any other custom element via `render` option.

### Example

**React:**

```jsx
import StudioEditor from "@grapesjs/studio-sdk/react";
import "@grapesjs/studio-sdk/style";

<StudioEditor
  options={{
    layout: {
      default: {
        type: "row",
        style: { height: "100%" },
        children: [
          {
            type: "sidebarLeft",
            children: [
              {
                // React component
                type: "custom",
                component: ({ editor }) => (
                  <button onClick={() => alert(editor.getHtml())}>
                    Get HTML!!!
                  </button>
                ),
              },
              {
                // HTML string
                type: "custom",
                render: () => "HTML as <b>string</b>",
              },
              {
                // HTML element
                type: "custom",
                render: () => {
                  const el = document.createElement("div");
                  el.innerHTML = "HTML as <b>element</b>";
                  return el;
                },
              },
              // Custom element, with cleanup
              {
                type: "custom",
                render: ({ editor, addEl, removeEl }) => {
                  const buttonEl = document.createElement("button");
                  buttonEl.innerHTML = "Button with <b>cleanup</b>";
                  buttonEl.style.cssText = "border: 1px solid; padding: 5px;";
                  const onClick = () =>
                    alert("Button clicked: " + editor?.getHtml());
                  buttonEl.addEventListener("click", onClick);
                  addEl(buttonEl);
                  return () => {
                    // Remember to cleanup to avoid memory leaks
                    buttonEl.removeEventListener("click", onClick);
                    removeEl(buttonEl);
                  };
                },
              },
            ],
          },
          { type: "canvasSidebarTop" },
          { type: "sidebarRight" },
        ],
      },
    },
  }}
/>;
```

### Custom Properties

| Property    | Type              | Description                                                                                                                                   |
| ----------- | ----------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| `type`\*    | `custom`          | Type of the layout component.                                                                                                                 |
| `className` | `string`          | The CSS class name(s) for the component.                                                                                                      |
| `component` | `React Component` | Component to be rendered in the custom layout.                                                                                                |
| `id`        | `string`          | The unique identifier for the component.                                                                                                      |
| `noWrapper` | `boolean`         | Indicates if the custom layout should not be wrapped (only works for React Components as the custom render needs a wrapper). Default: `false` |
| `render`    | `function`        | Function to render the custom layout.                                                                                                         |
| `style`     | `object`          | The inline styles for the component.                                                                                                          |

---

## VirtualList

A virtual list component that renders only the visible items, improving performance when dealing with a large number of items.

### Example

**React:**

```jsx
import StudioEditor from "@grapesjs/studio-sdk/react";
import "@grapesjs/studio-sdk/style";

<StudioEditor
  options={{
    layout: {
      default: {
        type: "row",
        style: { height: "100%" },
        children: [
          {
            type: "virtualList",
            itemsPerRow: 4,
            style: { width: 700 },
            items: Array(100)
              .fill(0)
              .map((_, i) => ({
                id: i,
                name: "Item " + i,
              })),
            itemLayout: ({ item, editor }) => ({
              type: "column",
              gap: 5,
              children: [
                {
                  type: "custom",
                  render: () =>
                    `<img height="100" src="https://picsum.photos/seed/image-${item.id}/100/100"/>`,
                },
                {
                  type: "button",
                  label: `Add ${item.name}`,
                  variant: "primary",
                  style: { width: "100%" },
                  onClick() {
                    editor.getWrapper().append(`
                      <div style="padding: 10px">
                        <img src="https://picsum.photos/seed/image-${item.id}/100/100"/>
                        <p>Item from the list: ${item.name}</p>
                      </div>
                    `);
                  },
                },
              ],
            }),
          },
          { type: "canvas" },
        ],
      },
    },
  }}
/>;
```

### VirtualList Properties

| Property      | Type          | Description                                             |
| ------------- | ------------- | ------------------------------------------------------- |
| `type`\*      | `virtualList` | Type of the layout component.                           |
| `items`\*     | `array`       | The items to be displayed in the virtual list.          |
| `className`   | `string`      | The CSS class name(s) for the component.                |
| `id`          | `string`      | The unique identifier for the component.                |
| `itemLayout`  | `function`    | The layout component for the items in the virtual list. |
| `itemsPerRow` | `number`      | The number of items per row. Default: `12`              |
| `style`       | `object`      | The inline styles for the component.                    |

---

## Sidebar Components

Studio includes sidebar components that can be toggled based on specific conditions, such as when the default preview command is triggered.

### Example

**React:**

```jsx
import StudioEditor from "@grapesjs/studio-sdk/react";
import "@grapesjs/studio-sdk/style";

<StudioEditor
  options={{
    layout: {
      default: {
        type: "row",
        style: { height: "100%" },
        children: [
          {
            type: "sidebarLeft",
            style: {
              alignItems: "center",
              justifyContent: "center",
            },
            children: [
              {
                type: "button",
                label: "Toggle Right Sidebar",
                variant: "outline",
                onClick: ({ editor }) => {
                  editor.runCommand("studio:sidebarRight:toggle");
                },
              },
            ],
          },
          {
            type: "column",
            style: { flexGrow: 1 },
            children: [
              {
                type: "sidebarTop",
                style: {
                  alignItems: "center",
                  justifyContent: "center",
                  gap: 10,
                },
                children: [
                  {
                    type: "button",
                    icon: "eye",
                    variant: "outline",
                    onClick: ({ editor }) => {
                      editor.runCommand("core:preview");
                    },
                  },
                  {
                    type: "button",
                    label: "Toggle Bottom Sidebar",
                    variant: "outline",
                    onClick: ({ editor }) => {
                      editor.runCommand("studio:sidebarBottom:toggle");
                    },
                  },
                ],
              },
              {
                type: "row",
                style: { flexGrow: 1, overflow: "hidden" },
                children: [
                  { type: "canvas", grow: true },
                  {
                    type: "sidebarRight",
                    style: {
                      alignItems: "center",
                      justifyContent: "center",
                    },
                    children: [
                      {
                        type: "button",
                        label: "Toggle Left Sidebar",
                        variant: "outline",
                        onClick: ({ editor }) => {
                          editor.runCommand("studio:sidebarLeft:toggle");
                        },
                      },
                    ],
                  },
                ],
              },
              {
                type: "sidebarBottom",
                style: {
                  alignItems: "center",
                  justifyContent: "center",
                },
                children: [
                  {
                    type: "button",
                    label: "Toggle Top Sidebar",
                    variant: "outline",
                    onClick: ({ editor }) => {
                      editor.runCommand("studio:sidebarTop:toggle");
                    },
                  },
                ],
              },
            ],
          },
        ],
      },
    },
  }}
/>;
```

### Sidebar Properties

#### SidebarBottom Properties

| Property    | Type               | Description                                                    |
| ----------- | ------------------ | -------------------------------------------------------------- |
| `type`\*    | `sidebarBottom`    | Type of the layout component.                                  |
| `as`        | `string`           | The HTML tag to use for the layout component. Example: `"div"` |
| `children`  | `Layout component` | The children layout components.                                |
| `className` | `string`           | The CSS class name(s) for the component.                       |
| `htmlAttrs` | `object`           | The HTML attributes for the component.                         |
| `id`        | `string`           | The unique identifier for the component.                       |
| `style`     | `object`           | The inline styles for the component.                           |

#### SidebarLeft Properties

| Property    | Type               | Description                                                    |
| ----------- | ------------------ | -------------------------------------------------------------- |
| `type`\*    | `sidebarLeft`      | Type of the layout component.                                  |
| `as`        | `string`           | The HTML tag to use for the layout component. Example: `"div"` |
| `children`  | `Layout component` | The children layout components.                                |
| `className` | `string`           | The CSS class name(s) for the component.                       |
| `id`        | `string`           | The unique identifier for the component.                       |
| `resizable` | `boolean`          | Indicates whether the sidebar is resizable. Default: `true`    |
| `style`     | `object`           | The inline styles for the component.                           |

#### SidebarRight Properties

| Property    | Type               | Description                                                    |
| ----------- | ------------------ | -------------------------------------------------------------- |
| `type`\*    | `sidebarRight`     | Type of the layout component.                                  |
| `as`        | `string`           | The HTML tag to use for the layout component. Example: `"div"` |
| `children`  | `Layout component` | The children layout components.                                |
| `className` | `string`           | The CSS class name(s) for the component.                       |
| `id`        | `string`           | The unique identifier for the component.                       |
| `resizable` | `boolean`          | Indicates whether the sidebar is resizable. Default: `true`    |
| `style`     | `object`           | The inline styles for the component.                           |

#### SidebarTop Properties

| Property         | Type               | Description                                                    |
| ---------------- | ------------------ | -------------------------------------------------------------- |
| `type`\*         | `sidebarTop`       | Type of the layout component.                                  |
| `as`             | `string`           | The HTML tag to use for the layout component. Example: `"div"` |
| `children`       | `Layout component` | The children layout components.                                |
| `className`      | `string`           | The CSS class name(s) for the component.                       |
| `devices`        | `DevicesProps`     | The properties for the devices section of the top bar.         |
| `height`         | `number \| string` | The height of the top bar. Example: `50`                       |
| `id`             | `string`           | The unique identifier for the component.                       |
| `leftContainer`  | `object`           | The properties for the left container of the top bar.          |
| `rightContainer` | `object`           | The properties for the right container of the top bar.         |
| `style`          | `object`           | The inline styles for the component.                           |

---

## Canvas Components

The layout configuration must include one of the following canvas components:

- `canvas`: The basic canvas component
- `canvasSidebarTop`: The canvas component combined with `sidebarTop`

### Example

**React:**

```jsx
import StudioEditor from "@grapesjs/studio-sdk/react";
import "@grapesjs/studio-sdk/style";

<StudioEditor
  options={{
    layout: {
      default: {
        type: "row",
        style: { height: "100%" },
        children: [
          {
            type: "sidebarLeft",
            children: [{ type: "panelPagesLayers" }],
          },
          {
            type: "canvasSidebarTop",
          },
          {
            type: "sidebarRight",
          },
        ],
      },
    },
  }}
/>;
```

### Canvas Properties

#### Canvas Properties

| Property    | Type      | Description                                                                |
| ----------- | --------- | -------------------------------------------------------------------------- |
| `type`\*    | `canvas`  | Type of the layout component.                                              |
| `className` | `string`  | The CSS class name(s) for the component.                                   |
| `grow`      | `boolean` | If true, the component will grow to fill available space. Default: `false` |
| `id`        | `string`  | The unique identifier for the component.                                   |
| `style`     | `object`  | The inline styles for the component.                                       |

#### CanvasSidebarTop Properties

| Property     | Type               | Description                                                    |
| ------------ | ------------------ | -------------------------------------------------------------- |
| `type`\*     | `canvasSidebarTop` | Type of the layout component.                                  |
| `as`         | `string`           | The HTML tag to use for the layout component. Example: `"div"` |
| `className`  | `string`           | The CSS class name(s) for the component.                       |
| `htmlAttrs`  | `object`           | The HTML attributes for the component.                         |
| `id`         | `string`           | The unique identifier for the component.                       |
| `sidebarTop` | `SidebarTopProps`  | The sidebar top configuration.                                 |
| `style`      | `object`           | The inline styles for the component.                           |

---

## Form Components

The layout configuration could include one of the following form components:

- `InputField`: The basic input field component
- `SelectField`: The select field component
- `ButtonGroupField`: The button group field component
- `CodeField`: The code field component

### Example

**React:**

```jsx
import StudioEditor from "@grapesjs/studio-sdk/react";
import "@grapesjs/studio-sdk/style";

<StudioEditor
  options={{
    layout: {
      default: {
        type: "row",
        style: { height: "100%" },
        children: [
          {
            type: "button",
            variant: "primary",
            label: "View Form",
            onClick: ({ editor }) => {
              editor.runCommand("studio:layoutToggle", {
                id: "viewFormComponents",
                header: false,
                placer: {
                  type: "dialog",
                  size: "l",
                  title: "Form components",
                },
                layout: {
                  type: "column",
                  as: "form",
                  style: { height: 500, gap: 20 },
                  htmlAttrs: {
                    onSubmit: (ev) => {
                      ev.preventDefault();
                      const fd = new FormData(ev.currentTarget);
                      editor.addComponents({
                        type: "text",
                        tagName: "p",
                        content: JSON.stringify(
                          {
                            name: fd.get("name"),
                            companySize: fd.get("companySize"),
                            account: fd.get("account"),
                            html: fd.get("html"),
                          },
                          null,
                          2,
                        ),
                      });
                      editor.runCommand("studio:layoutRemove", {
                        id: "viewFormComponents",
                      });
                    },
                  },
                  children: [
                    {
                      type: "inputField",
                      name: "name",
                      label: "Name",
                      placeholder: "Insert your name",
                      required: true,
                      value: "",
                      onChange: ({ value, setState }) => setState({ value }),
                    },
                    {
                      type: "codeField",
                      language: "html",
                      label: "HTML",
                      name: "html",
                      value: "<div>Hello</div>",
                      onChange: ({ value, setState }) => setState({ value }),
                      required: true,
                    },
                    {
                      type: "selectField",
                      name: "companySize",
                      label: "Company size",
                      emptyState: "Select",
                      value: "",
                      required: true,
                      options: [
                        { id: "1", label: "1" },
                        { id: "2-10", label: "2-10" },
                        { id: "11-50", label: "11-50" },
                        { id: "51-200", label: "51-200" },
                        { id: "201-500", label: "201-500" },
                        { id: "500+", label: "500+" },
                      ],
                      onChange: ({ value, setState }) => setState({ value }),
                    },
                    {
                      type: "buttonGroupField",
                      id: "account",
                      name: "account",
                      label: "Account",
                      value: "",
                      options: [
                        { id: "Personal", label: "Personal" },
                        { id: "Professional", label: "Professional" },
                      ],
                      onChange: ({ value, setState }) => setState({ value }),
                    },
                    {
                      type: "row",
                      style: { gap: 10 },
                      children: {
                        type: "button",
                        variant: "primary",
                        label: "Submit",
                        buttonType: "submit",
                      },
                    },
                  ],
                },
              });
            },
          },
          { type: "canvas" },
        ],
      },
    },
  }}
/>;
```

### Form Field Properties

#### InputField Properties

| Property       | Type         | Description                                                                 |
| -------------- | ------------ | --------------------------------------------------------------------------- |
| `type`\*       | `inputField` | Type of the layout component.                                               |
| `value`\*      | `string`     | The value of the field. Example: `"username"`                               |
| `className`    | `string`     | The CSS class name(s) for the component.                                    |
| `disabled`     | `boolean`    | Indicates whether the field is disabled. Default: `false`                   |
| `editorEvents` | `object`     | Update layout component state based on editor events.                       |
| `id`           | `string`     | The unique identifier for the component.                                    |
| `inputType`    | `string`     | The type of the field. Example: `"text"`                                    |
| `label`        | `string`     | The label for the field. Example: `"Username"`                              |
| `name`         | `string`     | The name attribute for the field. Example: `"username"`                     |
| `onChange`     | `function`   | The function to call when the field value changes.                          |
| `onInput`      | `function`   | The function to call when the field value changes on input.                 |
| `placeholder`  | `string`     | The placeholder text for the field.                                         |
| `readOnly`     | `boolean`    | Indicates whether the field is read-only. Default: `false`                  |
| `required`     | `boolean`    | Indicates whether the field is required. Default: `false`                   |
| `row`          | `boolean`    | Indicates if the field should be rendered in a row layout. Default: `false` |
| `size`         | `string`     | The size of the field. Options: `"m"`, `"s"`                                |
| `style`        | `object`     | The inline styles for the component.                                        |

#### SelectField Properties

| Property       | Type          | Description                                                          |
| -------------- | ------------- | -------------------------------------------------------------------- |
| `type`\*       | `selectField` | Type of the layout component.                                        |
| `options`\*    | `array`       | The options for the field.                                           |
| `value`\*      | `string`      | The value of the field. Example: `"username"`                        |
| `className`    | `string`      | The CSS class name(s) for the component.                             |
| `disabled`     | `boolean`     | Indicates whether the field is disabled. Default: `false`            |
| `editorEvents` | `object`      | Update layout component state based on editor events.                |
| `emptyState`   | `string`      | The empty state for the field.                                       |
| `id`           | `string`      | The unique identifier for the component.                             |
| `label`        | `string`      | The label for the field. Example: `"Username"`                       |
| `name`         | `string`      | The name attribute for the field. Example: `"username"`              |
| `onChange`     | `function`    | The function to call when the field value changes.                   |
| `required`     | `boolean`     | Indicates whether the field is required. Default: `false`            |
| `size`         | `string`      | The size of the field. Options: `"l"`, `"m"`, `"s"`, `"xs"`, `"x2s"` |
| `style`        | `object`      | The inline styles for the component.                                 |

#### ButtonGroupField Properties

| Property       | Type               | Description                                               |
| -------------- | ------------------ | --------------------------------------------------------- |
| `type`\*       | `buttonGroupField` | Type of the layout component.                             |
| `options`\*    | `array`            | The options for the field.                                |
| `value`\*      | `string`           | The value of the field. Example: `"username"`             |
| `className`    | `string`           | The CSS class name(s) for the component.                  |
| `disabled`     | `boolean`          | Indicates whether the field is disabled. Default: `false` |
| `editorEvents` | `object`           | Update layout component state based on editor events.     |
| `id`           | `string`           | The unique identifier for the component.                  |
| `label`        | `string`           | The label for the field. Example: `"Username"`            |
| `name`         | `string`           | The name attribute for the field. Example: `"username"`   |
| `onChange`     | `function`         | The function to call when the field value changes.        |
| `required`     | `boolean`          | Indicates whether the field is required. Default: `false` |
| `size`         | `string`           | The size of the field. Options: `"m"`, `"s"`, `"xs"`      |
| `style`        | `object`           | The inline styles for the component.                      |

#### CodeField Properties

| Property        | Type        | Description                                                                 |
| --------------- | ----------- | --------------------------------------------------------------------------- |
| `type`\*        | `codeField` | Type of the layout component.                                               |
| `language`\*    | `string`    | Indicates the language of the code field. Example: `"json"`                 |
| `value`\*       | `string`    | The value of the field. Example: `"username"`                               |
| `className`     | `string`    | The CSS class name(s) for the component.                                    |
| `disabled`      | `boolean`   | Indicates whether the field is disabled. Default: `false`                   |
| `editorEvents`  | `object`    | Update layout component state based on editor events.                       |
| `id`            | `string`    | The unique identifier for the component.                                    |
| `label`         | `string`    | The label for the field. Example: `"Username"`                              |
| `minHeight`     | `string`    | Indicates the minimum height of the field. Default: `170px`                 |
| `monacoOptions` | `object`    | Pass additional options to the Monaco editor. Default: `{}`                 |
| `name`          | `string`    | The name attribute for the field. Example: `"username"`                     |
| `onChange`      | `function`  | The function to call when the field value changes.                          |
| `readOnly`      | `boolean`   | Indicates whether the field is read-only. Default: `false`                  |
| `required`      | `boolean`   | Indicates whether the field is required. Default: `false`                   |
| `row`           | `boolean`   | Indicates if the field should be rendered in a row layout. Default: `false` |
| `size`          | `string`    | The size of the field. Options: `"m"`, `"s"`                                |
| `style`         | `object`    | The inline styles for the component.                                        |
