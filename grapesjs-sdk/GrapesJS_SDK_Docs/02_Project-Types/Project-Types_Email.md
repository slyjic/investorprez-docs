# Email

_Last Updated: August 12, 2025_
_Status: Current - GrapesJS SDK Reference Documentation_

Studio SDK lets you create various projects, including email templates for building newsletters using MJML.

![Projects Email](/docs-sdk/assets/images/studio-editor-email-8deb36da5e80e75b66383ab121de9f70.png)

- React
- JS
- 🍇  Demo

  import StudioEditor from '@grapesjs/studio-sdk/react';import '@grapesjs/studio-sdk/style';// ...<StudioEditor options={{    // ...    project: {    type: 'email',    // The default project to use for new projects    default: {        pages: [          { component: '<mjml><mj-body><mj-section><mj-column><mj-text>My email</mj-text></mj-column></mj-section></mj-body></mjml>' },        ]    },    }  }}/>

  import createStudioEditor from '@grapesjs/studio-sdk';import '@grapesjs/studio-sdk/style';// ...createStudioEditor({ // ... project: { type: 'email', // The default project to use for new projects default: { pages: [ { component: '<mjml><mj-body><mj-section><mj-column><mj-text>My email</mj-text></mj-column></mj-section></mj-body></mjml>' }, ] }, }})

Code

.code-block-hy42t code { max-height: 600px; }
