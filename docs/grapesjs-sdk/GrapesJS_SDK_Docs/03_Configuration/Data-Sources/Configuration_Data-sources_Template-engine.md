# Template Engines

*Last Updated: August 12, 2025*
*Status: Current - GrapesJS SDK Reference Documentation*

Studio SDK supports custom template engine integration for managing dynamic content within your projects. This means you can use your preferred templating syntax for data binding, conditionals, and loops, while Studio takes care of the visual editing and component structure.

## Table of Contents

- [How It Works](#how-it-works)
- [Importer](#importer)
  - [Native Parsers](#native-parsers)
  - [Importer Demo](#importer-demo)
- [Exporter](#exporter)
  - [Exporter Demo](#exporter-demo)

## How It Works

To integrate a template engine, you need to implement two components:

- **Importer** - Parses the input string (e.g., HTML with embedded template syntax) and converts recognized expressions into Studio's data-aware components—such as Variables, Conditions, and Collections.
- **Exporter** - Defines how data components are translated back into your template engine's syntax for output (e.g., when generating code or exporting files).

Studio comes with built-in support for common engines like Handlebars and EJS, but you can register your own to support virtually any templating system.

## Importer

The Importer is responsible for parsing an input string (such as HTML with embedded template syntax) and transforming it into a format Studio can understand. Specifically, it converts template expressions into Data Components.

You register an importer using the `studio:dataSourceSetImporter` command:

```javascript
editor.runCommand('studio:dataSourceSetImporter', {
  /**
   * Parses the input string and replaces template syntax with data components in HTML.
   * @param input The raw HTML/template string.
   * @returns A string with template syntax replaced by data component structures.
   */
  import(input: string) {
    return fromTemplateEngineToGrapesJS(input);
  }
});
```

### Native Parsers

For accurate and reliable results, it is **strongly recommended** to use the official parser or compiler for your chosen template engine.

Template engines often have complex syntax, including nesting, escaping, comments, and custom directives, which are best handled by their own parsing tools.

Here's a list of popular template engines along with their dedicated JavaScript parsers/compilers:

| Template Engine | NPM Package |
|-----------------|-------------|
| **Handlebars** | [`handlebars`](https://www.npmjs.com/package/handlebars) |
| **EJS** | [`ejs`](https://www.npmjs.com/package/ejs) |
| **Liquid** | [`liquidjs`](https://www.npmjs.com/package/liquidjs) |
| **Nunjucks** | [`nunjucks`](https://www.npmjs.com/package/nunjucks) |
| **Mustache** | [`mustache`](https://www.npmjs.com/package/mustache) |
| **Pug** | [`pug`](https://www.npmjs.com/package/pug) |
| **Eta** | [`eta`](https://www.npmjs.com/package/eta) |
| **Twig (JS port)** | [`twig`](https://www.npmjs.com/package/twig) |
| **Dot.js** | [`dot`](https://www.npmjs.com/package/dot) |

Most of these libraries expose an AST or compile method. When writing an Importer, you can:

- Use the parser to tokenize the template.
- Walk through the AST or output.
- Replace expressions (`{{ variable }}`, `{% if %}`) with Studio data components.

### Importer Demo

While using a proper parser is the preferred method, the following example demonstrates a basic importer using simple, hardcoded string replacements. This example is only for illustrative purposes.

The goal is to replace known snippets of template syntax with the full HTML GrapesJS needs to recognize them as Data Components.

```jsx
import StudioEditor from '@grapesjs/studio-sdk/react';
import '@grapesjs/studio-sdk/style';

// ...
<StudioEditor
  options={{
    // ...
    dataSources: {
      globalData: {
        user: { firstName: 'Alice', isCustomer: true },
        products: [
          { name: 'Laptop Pro X15', price: 1200.0 },
          { name: 'Wireless Mouse M2', price: 25.99 }
        ]
      },
    },
    project: {
      default: {
        pages: [
          {
            component: `
              <h1>Variable</h1>
              <div>Hello {{ globalData.user.data.firstName }}</div>
              
              <h1>Condition</h1>
              <div>{{#if globalData.user.data.isCustomer }}<p>You are a customer</p>{{/if}}</div>
              
              <h1>Collection</h1>
              {{#each globalData.products.data }}
                <div>
                  <h4>{{this.name}}</h4>
                  <p>Price: {{this.price}}</p>
                </div>
              {{/each}}
            `
          },
        ]
      },
    },
    plugins: [
      editor => {
        editor.runCommand('studio:dataSourceSetImporter', {
          import: (input: string) => {
            let output = input;
            
            // replacing a simple data bind with DataVariable component
            output = output.replace(
              '{{ globalData.user.data.firstName }}',
              `<data-variable data-gjs-data-resolver='{"path":"globalData.user.data.firstName"}'></data-variable>`
            );
            
            // replacing a simple condition with DataCondition component
            const conditionBlockContent = '<p>You are a customer</p>';
            output = output.replace(
              `{{#if globalData.user.data.isCustomer }}${conditionBlockContent}{{/if}}`,
              `<data-condition
                data-gjs-data-resolver='{"condition": { "logicalOperator": "and", "statements": [ { "left": { "type": "data-variable", "path": "globalData.user.data.isCustomer" }, "operator": "isTruthy" } ] }}'>
                  ${conditionBlockContent}
              </data-condition>`
            );
            
            // replacing a simple collection with DataCollection component
            const collectionItemTemplate = `<div><h4>{{this.name}}</h4> <p>Price: {{this.price}}</p></div>`;
            output = output.replace(
              `{{#each globalData.products.data }}${collectionItemTemplate}{{/each}}`,
              `<div
                data-gjs-type="data-collection"
                data-gjs-data-resolver='{ "collectionId": "products", "dataSource":{ "type":"data-variable", "path":"globalData.products.data" }}'>
                <div data-gjs-type="data-collection-item">
                  <h4><data-variable data-gjs-data-resolver='{"collectionId": "products", "variableType": "currentItem", "path": "name" }'></data-variable></h4>
                  <p>Price: <data-variable data-gjs-data-resolver='{"collectionId": "products", "variableType": "currentItem", "path": "price" }'></data-variable></p>
                </div>
              </div>`
            );
            
            return output;
          }
        });
      },
    ]
  }}
/>
```

## Exporter

The exporter tells Studio how to represent its Data Components using your template engine's syntax. You register an exporter using the `studio:dataSourceSetExporter` command.

The command expects an object where each function is responsible for generating the syntax for a specific part of a Data Component.

### Exporter Demo

Here's a full example of how a simple set of Data Components might be exported using the syntax of a templating engine like Handlebars:

```jsx
import StudioEditor from '@grapesjs/studio-sdk/react';
import '@grapesjs/studio-sdk/style';

// ...
<StudioEditor
  options={{
    // ...
    dataSources: {
      globalData: {
        user: { firstName: 'Alice', isCustomer: true },
        products: [
          { name: 'Laptop Pro X15', price: 1200.0 },
          { name: 'Wireless Mouse M2', price: 25.99 }
        ]
      },
    },
    project: {
      default: {
        pages: [
          {
            component: `
              <h1>Variable</h1>
              <data-variable data-gjs-data-resolver='{"path": "globalData.user.data.firstName" }'></data-variable>
              
              <h1>Condition</h1>
              <div> Hey,
                <data-condition data-gjs-data-resolver='{"condition": {"logicalOperator": "and", "statements": [{"left": { "type":"data-variable", "path":"globalData.user.data.isCustomer" }, "operator": "equals", "right": true}] }}'>
                  <data-condition-true-content>welcome back, valued customer!</data-condition-true-content>
                  <data-condition-false-content>please register to see more!</data-condition-false-content>
                </data-condition>
              </div>
              
              <h1>Collection</h1>
              <ul data-gjs-type="data-collection"
                data-gjs-data-resolver='{"collectionId": "myCollectionId", "dataSource": {"type":"data-variable", "path":"globalData.products.data" } }'>
                <li data-gjs-type="data-collection-item">
                  <b>Product Name</b>: <data-variable data-gjs-data-resolver='{"collectionId": "myCollectionId", "variableType": "currentItem", "path": "name" }'></data-variable>
                  - <b>Price</b>: <data-variable data-gjs-data-resolver='{"collectionId": "myCollectionId", "variableType": "currentItem", "path": "price" }'></data-variable>
                </li>
              </ul>
            `
          },
        ]
      },
    },
    plugins: [
      editor => {
        editor.runCommand('studio:dataSourceSetExporter', {
          // Generates the syntax for a DataVariable.
          getVariableSyntax(props) {
            const cmpDataVariable = props.component;
            const dataResolver = cmpDataVariable.getDataResolver();
            const path = dataResolver?.path;
            return path ? `{{ ${path} }}` : '';
          },
          
          // Generates the starting syntax for a DataCondition.
          getConditionalStartSyntax(props) {
            const cmpDataCondition = props.component;
            const dataResolver = cmpDataCondition.getDataResolver();
            const condition = dataResolver?.condition;
            return condition ? `{{#if ${condition.statements?.[0]?.left?.path} }}` : '';
          },
          
          // Generates the 'else' part of a DataCondition's syntax.
          getConditionElseSyntax() {
            return '{{else}}';
          },
          
          // Generates the ending syntax for a Data Condition.
          getConditionalEndSyntax() {
            return '{{/if}}';
          },
          
          // Generates the starting syntax for a Data Collection.
          getCollectionStartSyntax(props) {
            const cmpDataCollection = props.component;
            const dataResolver = cmpDataCollection.getDataResolver();
            const path = dataResolver?.dataSource?.path;
            return path ? `{{#each ${path} }}` : '';
          },
          
          // Generates the ending syntax for a Data Collection.
          getCollectionEndSyntax() {
            return '{{/each}}';
          }
        });
      },
    ]
  }}
/>
```

---

## Related Documentation

- **[Data Sources Overview](./Configuration_Data-Sources_Overview.md)** - Complete data sources configuration
- **[Global Data](./Configuration_Data-Sources_Overview.md#global-data)** - Setting up global data sources
- **[Dynamic Content](./Configuration_Data-Sources_Overview.md#dynamic-content)** - Working with dynamic content components