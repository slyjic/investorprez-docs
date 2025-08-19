# Global Styles

_Last Updated: August 12, 2025_
_Status: Current - GrapesJS SDK Reference Documentation_

Studio SDK offers a Global Styles panel, enabling you to define common styles that apply across all elements in your project. This panel simplifies the process of setting up and maintaining consistent styling, making it easy for end users to edit and manage global styles.

## Table of Contents

- [Initialization](#initialization)
- [Properties](#properties)
- [Updating Global Styles](#updating-global-styles)
- [I18n](#i18n)
- [Advanced Usage](#advanced-usage)
- [Usage in Email Projects](#usage-in-email-projects)

## Initialization

To enable global styles, configure the `globalStyles.default` option. Each item in this array represents a style rule that applies across the project.

Here's a simple example of setting up global styles:

```jsx
import StudioEditor from "@grapesjs/studio-sdk/react";
import "@grapesjs/studio-sdk/style";

// ...
<StudioEditor
  options={{
    // ...
    plugins: [
      (editor) =>
        editor.onReady(() => {
          // let's show the global style panel on start
          editor.runCommand("studio:layoutToggle", {
            id: "gs",
            layout: "panelGlobalStyles",
            header: { label: "Global Styles" },
            placer: { type: "absolute", position: "right" },
          });
        }),
    ],
    project: {
      default: {
        pages: [
          { name: "Home", component: "<h1>Home page</h1>" },
          { name: "About", component: "<h1>About page</h1>" },
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
        {
          id: "h1Size",
          property: "font-size",
          field: {
            type: "number",
            min: 0.1,
            max: 10,
            step: 0.1,
            units: ["rem"],
          },
          defaultValue: "2rem",
          selector: "h1",
          label: "H1 size",
        },
      ],
    },
  }}
/>;
```

In this example, we've defined two global styles: the color and font size for h1 elements. Updating these styles in the panel will automatically apply the changes to all h1 elements across your project. You can see the effect by navigating through a different page.

## Properties

### Global Style Properties

Below are the available properties for the global style object.

| Property       | Type                    | Description                                                                                |
| -------------- | ----------------------- | ------------------------------------------------------------------------------------------ |
| `id`\*         | `string`                | A unique identifier for the style rule. Example: `"myRuleId"`                              |
| `property`\*   | `string`                | The CSS property name (e.g., 'color', 'font-size', 'margin', etc.). Example: `"font-size"` |
| `selector`\*   | `string`                | The CSS selector to which this style will be applied. Example: `"h1"`                      |
| `label`        | `string`                | The label for the style rule (used in the editor UI). Example: `"H1 size"`                 |
| `field`        | `GlobalStyleFieldProps` | The field to render in the editor UI.                                                      |
| `defaultValue` | `string \| number`      | Default value to use on the CSS property.                                                  |
| `value`        | `string \| number`      | The value to be applied to the CSS property.                                               |
| `category`     | `object`                | Put the style rule in a category. Example: `{ "id": "h1Styles", "label": "H1 Styles" }`    |

### Field Properties

Below are the properties available for individual global style fields.

#### Text Field

| Property       | Type     | Description                                                                                                                                                                |
| -------------- | -------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `type`\*       | `text`   | Simple text field type.                                                                                                                                                    |
| `defaultValue` | `string` | Default value to use on the field. Unlike the `defaultValue` of the global style property, this won't affect the global style itself and will only serve as a placeholder. |

#### Color Field

| Property       | Type     | Description                        |
| -------------- | -------- | ---------------------------------- |
| `type`\*       | `color`  | Field type for colors properties.  |
| `defaultValue` | `string` | Default value to use on the field. |

#### Number Field

| Property       | Type     | Description                                |
| -------------- | -------- | ------------------------------------------ |
| `type`\*       | `number` | Field type for numeric properties.         |
| `defaultValue` | `string` | Default value to use on the field.         |
| `min`          | `number` | Minimum value allowed.                     |
| `max`          | `number` | Maximum value allowed.                     |
| `step`         | `number` | Step value.                                |
| `units`        | `array`  | Units to display. Example: `["px", "rem"]` |

#### Select Field

| Property       | Type     | Description                                                                            |
| -------------- | -------- | -------------------------------------------------------------------------------------- |
| `type`\*       | `select` | Select field type.                                                                     |
| `defaultValue` | `string` | Default value to use on the field.                                                     |
| `options`      | `array`  | Options to display in the field. Example: `[{ "id": "option1", "label": "Option 1" }]` |

#### Select Font Field

| Property       | Type         | Description                                                                                      |
| -------------- | ------------ | ------------------------------------------------------------------------------------------------ |
| `type`\*       | `selectFont` | Select field type for fonts.                                                                     |
| `defaultValue` | `string`     | Default value to use on the field.                                                               |
| `options`      | `array`      | Prepend custom options to the font select. Example: `[{ "id": "option0", "label": "Option 0" }]` |

#### Radio Field

| Property       | Type     | Description                                                                            |
| -------------- | -------- | -------------------------------------------------------------------------------------- |
| `type`\*       | `radio`  | Similar to the select field type but render options as buttons.                        |
| `defaultValue` | `string` | Default value to use on the field.                                                     |
| `options`      | `array`  | Options to display in the field. Example: `[{ "id": "option1", "label": "Option 1" }]` |

## Updating Global Styles

Global styles are powerful and highly flexible, but be mindful when adjusting the configuration once it's set, as updates made by end-users in the Global Styles panel will impact element styles across the project. Think of it as creating an internal design system—a well-defined configuration supports consistency, enables reusable templates, and makes future maintenance easier.

Below, you'll find examples demonstrating the effects of adding, updating, and deleting global styles in the configuration. These will illustrate how each action impacts the project's element styles.

### Adding a New Style

When adding a new rule with a new id to the global styles, it integrates seamlessly without impacting existing styles. However, if you set a defaultValue, be aware that it may override the default value of the specified CSS property, potentially affecting elements styled by that rule.

```jsx
import StudioEditor from "@grapesjs/studio-sdk/react";
import "@grapesjs/studio-sdk/style";

// ...
<StudioEditor
  options={{
    // ...
    plugins: [
      (editor) =>
        editor.onReady(() => {
          editor.runCommand("studio:layoutToggle", {
            id: "gs",
            layout: "panelGlobalStyles",
            header: { label: "Global Styles" },
            placer: { type: "absolute", position: "right" },
          });
        }),
    ],
    project: {
      // loading by default a project containing already h1Color (blue) and h1Size (3rem)
      default: {
        styles: [
          {
            selectors: [],
            selectorsAdd: "h1",
            style: {
              color: {
                type: "data-variable",
                defaultValue: "red",
                path: "globalStyles.h1Color.value",
              },
              "font-size": {
                type: "data-variable",
                defaultValue: "2rem",
                path: "globalStyles.h1Size.value",
              },
            },
            groups: ["globalStyles:h1Color", "globalStyles:h1Size"],
          },
        ],
        pages: [
          {
            name: "Home",
            component: "<h1>Home page Update</h1><p>Home page text</p>",
          },
        ],
        dataSources: [
          {
            id: "globalStyles",
            records: [
              {
                value: "blue",
                id: "h1Color",
                property: "color",
                field: "color",
                defaultValue: "red",
                selector: "h1",
                label: "H1 color",
                _internal: true,
              },
              {
                value: "3rem",
                id: "h1Size",
                property: "font-size",
                field: {
                  type: "number",
                  min: 0.1,
                  max: 10,
                  step: 0.1,
                  units: ["rem"],
                },
                defaultValue: "2rem",
                selector: "h1",
                label: "H1 size",
                _internal: true,
              },
            ],
          },
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
        // Adding a new rule
        {
          id: "h1Weight",
          property: "font-weight",
          field: {
            type: "select",
            options: [
              { id: "500", label: "Normal" },
              { id: "600", label: "Bold" },
            ],
          },
          defaultValue: "", // skip default value to avoid any kind of override
          selector: "h1",
          label: "H1 weight",
        },
        {
          id: "h1Size",
          property: "font-size",
          field: {
            type: "number",
            min: 0.1,
            max: 10,
            step: 0.1,
            units: ["rem"],
          },
          defaultValue: "2rem",
          selector: "h1",
          label: "H1 size",
        },
      ],
    },
  }}
/>;
```

### Updating Existing Style

When updating an existing global style, only specific properties can be modified to minimize disruptions to current styles. For example, properties like `label` and `field` can be updated, but changes to `property`, `defaultValue`, or `selector` are skipped to avoid breaking existing style rules.

### Removing Existing Style

Removing a rule from the global styles configuration will prevent it from appearing in the Global Styles panel, but it won't delete the style from the project. This ensures that any styles previously applied remain intact, avoiding unexpected changes to the project's appearance.

## I18n

The labels of the Global Styles panel can be translated into different languages based on the id assigned to each global style rule. The configuration in i18n takes precedence over labels defined directly in the global styles configuration.

```jsx
import StudioEditor from "@grapesjs/studio-sdk/react";
import "@grapesjs/studio-sdk/style";

// ...
<StudioEditor
  options={{
    // ...
    project: {
      default: {
        pages: [{ name: "Home", component: "<h1>Home page</h1>" }],
      },
    },
    globalStyles: {
      default: [
        {
          id: "h1Color",
          property: "color",
          category: { id: "h1Styles", label: "H1 styles", open: true },
          field: "color",
          defaultValue: "red",
          selector: "h1",
          label: "H1 color (Up)",
        },
        {
          id: "h1Size",
          property: "font-size",
          field: {
            type: "select",
            options: [
              { id: "2rem", label: "Normal" },
              { id: "3rem", label: "Big" },
            ],
          },
          category: { id: "h1Styles" },
          defaultValue: "2rem",
          selector: "h1",
          label: "H1 size",
        },
      ],
    },
    i18n: {
      locales: {
        en: {
          globalStyleManager: {
            notFound: "No global styles found",
            fields: {
              // The key is the global style id
              h1Color: {
                label: "H1 color (EN)",
              },
              h1Size: {
                label: "H1 size (EN)",
                options: {
                  "2rem": "Normal (EN)",
                  "3rem": "Big (EN)",
                },
              },
            },
            categories: {
              // category id
              h1Styles: {
                label: "H1 styles (EN)",
              },
            },
          },
        },
      },
    },
  }}
/>;
```

## Advanced Usage

In this section, we'll explore a more comprehensive example of global styles configuration, including grouping styles with categories, using CSS variables for dynamic theming, and integrating styles with an external CSS library. These features offer enhanced flexibility and control over your design system.

```jsx
import StudioEditor from "@grapesjs/studio-sdk/react";
import "@grapesjs/studio-sdk/style";

// ...
<StudioEditor
  options={{
    // ...
    globalStyles: {
      default: [
        // Variables
        {
          id: "varPrimary",
          property: "--bs-primary", // connect to a CSS variable
          field: "color",
          selector: ":root",
          label: "Primary color",
          defaultValue: "#0d6efd",
          category: { id: "vars", label: "Variables", open: true },
        },
        {
          id: "varSecondary",
          property: "--bs-secondary",
          field: "color",
          selector: ":root",
          label: "Secondary color",
          defaultValue: "#eff0f1",
          category: { id: "vars" },
        },
        // Body
        {
          id: "bodyBg",
          property: "background-color",
          field: "color",
          selector: "body",
          label: "Body background",
          defaultValue: "white",
          category: { id: "body", label: "Body styles" },
        },
        {
          id: "bodyColor",
          property: "color",
          field: "color",
          selector: "body",
          label: "Body color",
          defaultValue: "#484c51",
          category: { id: "body" },
        },
        // H1
        {
          id: "h1Color",
          property: "color",
          field: "color",
          selector: "h1",
          label: "H1 color",
          defaultValue: "inherit",
          category: { id: "h1", label: "H1" },
        },
        {
          id: "h1Size",
          property: "font-size",
          field: {
            type: "number",
            min: 0.1,
            max: 10,
            step: 0.1,
            units: ["rem"],
          },
          defaultValue: "2rem",
          selector: "h1",
          label: "H1 size",
          category: { id: "h1" },
        },
        // Button
        {
          id: "btnColor",
          property: "background-color",
          field: "color",
          selector: ".btn-primary",
          label: "Primary button color",
          category: { id: "buttons", label: "Buttons" },
        },
        {
          id: "btnRadius",
          property: "border-radius",
          field: {
            type: "select",
            options: [
              { id: "0", label: "None" },
              { id: "", label: "Default" },
              { id: "1rem", label: "Large" },
              { id: "10rem", label: "Full" },
            ],
          },
          selector: ".btn",
          label: "Button radius",
          category: { id: "buttons" },
        },
      ],
    },
  }}
/>;
```

## Usage in Email Projects

Global Styles can also be used in email projects with the same configuration approach as web, allowing you to style MJML components or specific selectors.

The main difference is that, in addition to using classic selectors like `.some-link-wrapper > a`, you can also apply global styles directly to MJML tags, such as `mj-section`, `mj-button`, or `mj-text`.

> **⚠️ Warning**  
> You can also continue using HTML selectors in email templates, but note that MJML components are often compiled into inline styles, so targeting the MJML tags directly gives more predictable results.

```jsx
import StudioEditor from "@grapesjs/studio-sdk/react";
import "@grapesjs/studio-sdk/style";

// ...
<StudioEditor
  options={{
    // ...
    project: {
      type: "email",
      default: {
        pages: [
          {
            component: `<mjml>
              <mj-head>
                <mj-attributes>
                  <mj-text />
                  <mj-section background-color="#eee" />
                  <mj-button background-color="#cf549e" />
                </mj-attributes>
              </mj-head>
              <mj-body>
                <mj-section>
                  <mj-column background-color="#ddd">
                    <mj-text>Some text and a <a href="##">link</a></mj-text>
                    <mj-button>Button</mj-button>
                  </mj-column>
                </mj-section>
              </mj-body>
            </mjml>`,
          },
        ],
      },
    },
    globalStyles: {
      default: [
        // ALL
        {
          id: "all-color",
          field: { type: "color", defaultValue: "#000000" },
          label: "Color",
          property: "color",
          selector: "mj-all",
          category: { id: "all", label: "All", open: true },
        },
        {
          id: "all-font-size",
          field: {
            type: "number",
            min: 0,
            step: 1,
            units: ["px"],
            defaultValue: "13px",
          },
          label: "Font size",
          property: "font-size",
          selector: "mj-all",
          category: { id: "all" },
        },
        // Sections
        {
          id: "section-bg",
          field: { type: "color", defaultValue: "initial" },
          label: "Background",
          property: "background-color",
          selector: "mj-section",
          category: { id: "sections", label: "Sections", open: true },
        },
        // Text
        {
          id: "text-color",
          field: { type: "color", defaultValue: "#000000" },
          label: "Color",
          property: "color",
          selector: "mj-text",
          category: { id: "text", label: "Text", open: true },
        },
        // Links
        {
          id: "link-color",
          field: { type: "color", defaultValue: "#000000" },
          label: "Color",
          property: "color",
          selector: "a",
          category: { id: "links", label: "Links", open: true },
        },
        // Buttons
        {
          id: "button-bg",
          field: { row: true, type: "color", defaultValue: "#414141" },
          label: "Background",
          property: "background-color",
          selector: "mj-button",
          category: { id: "buttons", label: "Buttons", open: true },
        },
        {
          id: "button-border-radius",
          field: {
            type: "number",
            min: 0,
            units: ["px"],
            defaultValue: "3px",
          },
          label: "Border radius",
          property: "border-radius",
          selector: "mj-button",
          category: { id: "buttons" },
        },
      ],
    },
  }}
/>;
```
