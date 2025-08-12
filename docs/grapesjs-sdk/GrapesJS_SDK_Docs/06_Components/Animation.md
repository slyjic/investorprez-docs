# Animation

*Last Updated: August 12, 2025*
*Status: Current - GrapesJS SDK Reference Documentation*

Project types

`web`

Plan

Startup plan

This plugin adds scroll-triggered animation components using built-in or custom CSS animations. It supports grouping for staggered effects and provides editor controls to fine-tune playback timing.

![Animation plugin](/docs-sdk/assets/images/animation-plugin-f099c7cb5c88ffd5ca7794cbfcd0d7af.webp)

Install the Studio SDK plugins package:

- npm
- pnpm
- yarn
- CDN

  npm i @grapesjs/studio-sdk-plugins

  pnpm add @grapesjs/studio-sdk-plugins

  yarn add @grapesjs/studio-sdk-plugins

  // It's recommended to replace the `latest` tag with the specific latest version to avoid any potential breaking changes.// The loaded plugin is globally available via `globalThis.StudioSdkPlugins_animationComponent`."https://unpkg.com/@grapesjs/studio-sdk-plugins@latest/dist/animationComponent/index.umd.js"

Import and use the plugin in your project:

- React
- JS
- 🍇  Demo

  import StudioEditor from '@grapesjs/studio-sdk/react';import '@grapesjs/studio-sdk/style';import { animationComponent } from "@grapesjs/studio-sdk-plugins";// ...<StudioEditor options={{      // ...      plugins: [        animationComponent.init({          animations({ items }) {            return [              ...items, // Keep existing animations              // Add your custom animations here              {                id: 'customWiggle',                name: 'Custom Wiggle',                css: `                @keyframes customWiggle {                  0% { transform: rotate(0deg); }                  15% { transform: rotate(-5deg); }                  30% { transform: rotate(5deg); }                  45% { transform: rotate(-5deg); }                  60% { transform: rotate(3deg); }                  75% { transform: rotate(-2deg); }                  100% { transform: rotate(0deg); }                }`              }            ];          }        })      ],      project: {        default: {          pages: [            {              name: 'Animation Demo',              component: `                <style>                  body {                    font-family: sans-serif;                    padding: 0;                    margin: 0;                  }                  section {                    padding: 50px 20px;                    text-align: center;                    border-bottom: 1px solid #eee;                  }                  h1 {                    font-size: 2rem;                    margin-bottom: 20px;                  }                  .animated-box {                    background: #f3f4f6;                    padding: 20px;                    margin: 10px auto;                    max-width: 400px;                    border-radius: 8px;                    box-shadow: 0 1px 4px rgba(0,0,0,0.05);                  }                  .animation-grid {                    display: grid;                    grid-template-columns: repeat(5, 1fr);                  }                </style>                    <section style="min-height: 100vh">                  <h1>Animations</h1>                  <div class="animation-grid">                    <div data-gjs-type="animation" style="animation-name: flash" class="animated-box">flash</div>                    <div data-gjs-type="animation" style="animation-name: pulse" class="animated-box">pulse</div>                    <div data-gjs-type="animation" style="animation-name: shake" class="animated-box">shake</div>                    <div data-gjs-type="animation" style="animation-name: tada" class="animated-box">tada</div>                    <div data-gjs-type="animation" style="animation-name: heartBeat" class="animated-box">heartBeat</div>                    <div data-gjs-type="animation" style="animation-name: bounce" class="animated-box">bounce</div>                    <div data-gjs-type="animation" style="animation-name: bounceIn" class="animated-box">bounceIn</div>                    <div data-gjs-type="animation" style="animation-name: bounceInDown" class="animated-box">bounceInDown</div>                    <div data-gjs-type="animation" style="animation-name: bounceInLeft" class="animated-box">bounceInLeft</div>                    <div data-gjs-type="animation" style="animation-name: bounceInRight" class="animated-box">bounceInRight</div>                    <div data-gjs-type="animation" style="animation-name: bounceInUp" class="animated-box">bounceInUp</div>                    <div data-gjs-type="animation" style="animation-name: fadeIn" class="animated-box">fadeIn</div>                    <div data-gjs-type="animation" style="animation-name: fadeInDown" class="animated-box">fadeInDown</div>                    <div data-gjs-type="animation" style="animation-name: fadeInLeft" class="animated-box">fadeInLeft</div>                    <div data-gjs-type="animation" style="animation-name: fadeInRight" class="animated-box">fadeInRight</div>                    <div data-gjs-type="animation" style="animation-name: fadeInUp" class="animated-box">fadeInUp</div>                    <div data-gjs-type="animation" style="animation-name: flipInX" class="animated-box">flipInX</div>                    <div data-gjs-type="animation" style="animation-name: flipInY" class="animated-box">flipInY</div>                    <div data-gjs-type="animation" style="animation-name: rotateIn" class="animated-box">rotateIn</div>                    <div data-gjs-type="animation" style="animation-name: rotateInDownLeft" class="animated-box">rotateInDownLeft</div>                    <div data-gjs-type="animation" style="animation-name: rotateInDownRight" class="animated-box">rotateInDownRight</div>                    <div data-gjs-type="animation" style="animation-name: rotateInUpLeft" class="animated-box">rotateInUpLeft</div>                    <div data-gjs-type="animation" style="animation-name: rotateInUpRight" class="animated-box">rotateInUpRight</div>                    <div data-gjs-type="animation" style="animation-name: slideInDown" class="animated-box">slideInDown</div>                    <div data-gjs-type="animation" style="animation-name: slideInLeft" class="animated-box">slideInLeft</div>                    <div data-gjs-type="animation" style="animation-name: slideInRight" class="animated-box">slideInRight</div>                    <div data-gjs-type="animation" style="animation-name: slideInUp" class="animated-box">slideInUp</div>                    <div data-gjs-type="animation" style="animation-name: zoomIn" class="animated-box">zoomIn</div>                    <div data-gjs-type="animation" style="animation-name: zoomInDown" class="animated-box">zoomInDown</div>                    <div data-gjs-type="animation" style="animation-name: zoomInLeft" class="animated-box">zoomInLeft</div>                    <div data-gjs-type="animation" style="animation-name: zoomInRight" class="animated-box">zoomInRight</div>                    <div data-gjs-type="animation" style="animation-name: zoomInUp" class="animated-box">zoomInUp</div>                  </div>                </section>                    <section>                  <h1>Scroll-triggered</h1>                  <div data-gjs-type="animation" style="animation-name: slideInLeft" class="animated-box">SlideInLeft</div>                  <div data-gjs-type="animation" style="animation-name: zoomIn; animation-delay: 0.5s" class="animated-box">ZoomIn with delay</div>                </section>                    <section>                  <h1>Repeat on scroll</h1>                  <div data-gjs-type="animation" style="animation-name: slideInLeft; --animation-repeat: true" class="animated-box">SlideInLeft</div>                  <div data-gjs-type="animation" style="animation-name: zoomIn; --animation-repeat: true" class="animated-box">ZoomIn</div>                </section>                    <section>                  <h1>Grouped Animations (Staggered)</h1>                  <div data-gjs-type="animation-group">                    <div data-gjs-type="animation" style="animation-name: fadeInDown" class="animated-box">Item 1</div>                    <div data-gjs-type="animation" style="animation-name: fadeInLeft" class="animated-box">Item 2</div>                    <div data-gjs-type="animation" style="animation-name: fadeInUp" class="animated-box">Item 3</div>                  </div>                </section>                    <section>                  <h1>Grouped Animations (Repeat on scroll)</h1>                  <div data-gjs-type="animation-group" style="--animation-repeat: true">                    <div data-gjs-type="animation" style="animation-name: fadeIn" class="animated-box">Item 1</div>                    <div data-gjs-type="animation" style="animation-name: fadeIn" class="animated-box">Item 2</div>                    <div data-gjs-type="animation" style="animation-name: fadeIn" class="animated-box">Item 3</div>                  </div>                </section>                    <section>                  <h1>Custom Animations</h1>                  <div data-gjs-type="animation" style="animation-name: customWiggle; animation-duration: 1.5s" class="animated-box">                    Custom "wiggle" animation                  </div>                </section>                `            }          ]        }      }          }}/>

  import createStudioEditor from '@grapesjs/studio-sdk';import '@grapesjs/studio-sdk/style';import { animationComponent } from "@grapesjs/studio-sdk-plugins";// ...createStudioEditor({ // ... plugins: [ animationComponent.init({ animations({ items }) { return [ ...items, // Keep existing animations // Add your custom animations here { id: 'customWiggle', name: 'Custom Wiggle', css: ` @keyframes customWiggle { 0% { transform: rotate(0deg); } 15% { transform: rotate(-5deg); } 30% { transform: rotate(5deg); } 45% { transform: rotate(-5deg); } 60% { transform: rotate(3deg); } 75% { transform: rotate(-2deg); } 100% { transform: rotate(0deg); } }` } ]; } }) ], project: { default: { pages: [ { name: 'Animation Demo', component: ` <style> body { font-family: sans-serif; padding: 0; margin: 0; } section { padding: 50px 20px; text-align: center; border-bottom: 1px solid #eee; } h1 { font-size: 2rem; margin-bottom: 20px; } .animated-box { background: #f3f4f6; padding: 20px; margin: 10px auto; max-width: 400px; border-radius: 8px; box-shadow: 0 1px 4px rgba(0,0,0,0.05); } .animation-grid { display: grid; grid-template-columns: repeat(5, 1fr); } </style> <section style="min-height: 100vh"> <h1>Animations</h1> <div class="animation-grid"> <div data-gjs-type="animation" style="animation-name: flash" class="animated-box">flash</div> <div data-gjs-type="animation" style="animation-name: pulse" class="animated-box">pulse</div> <div data-gjs-type="animation" style="animation-name: shake" class="animated-box">shake</div> <div data-gjs-type="animation" style="animation-name: tada" class="animated-box">tada</div> <div data-gjs-type="animation" style="animation-name: heartBeat" class="animated-box">heartBeat</div> <div data-gjs-type="animation" style="animation-name: bounce" class="animated-box">bounce</div> <div data-gjs-type="animation" style="animation-name: bounceIn" class="animated-box">bounceIn</div> <div data-gjs-type="animation" style="animation-name: bounceInDown" class="animated-box">bounceInDown</div> <div data-gjs-type="animation" style="animation-name: bounceInLeft" class="animated-box">bounceInLeft</div> <div data-gjs-type="animation" style="animation-name: bounceInRight" class="animated-box">bounceInRight</div> <div data-gjs-type="animation" style="animation-name: bounceInUp" class="animated-box">bounceInUp</div> <div data-gjs-type="animation" style="animation-name: fadeIn" class="animated-box">fadeIn</div> <div data-gjs-type="animation" style="animation-name: fadeInDown" class="animated-box">fadeInDown</div> <div data-gjs-type="animation" style="animation-name: fadeInLeft" class="animated-box">fadeInLeft</div> <div data-gjs-type="animation" style="animation-name: fadeInRight" class="animated-box">fadeInRight</div> <div data-gjs-type="animation" style="animation-name: fadeInUp" class="animated-box">fadeInUp</div> <div data-gjs-type="animation" style="animation-name: flipInX" class="animated-box">flipInX</div> <div data-gjs-type="animation" style="animation-name: flipInY" class="animated-box">flipInY</div> <div data-gjs-type="animation" style="animation-name: rotateIn" class="animated-box">rotateIn</div> <div data-gjs-type="animation" style="animation-name: rotateInDownLeft" class="animated-box">rotateInDownLeft</div> <div data-gjs-type="animation" style="animation-name: rotateInDownRight" class="animated-box">rotateInDownRight</div> <div data-gjs-type="animation" style="animation-name: rotateInUpLeft" class="animated-box">rotateInUpLeft</div> <div data-gjs-type="animation" style="animation-name: rotateInUpRight" class="animated-box">rotateInUpRight</div> <div data-gjs-type="animation" style="animation-name: slideInDown" class="animated-box">slideInDown</div> <div data-gjs-type="animation" style="animation-name: slideInLeft" class="animated-box">slideInLeft</div> <div data-gjs-type="animation" style="animation-name: slideInRight" class="animated-box">slideInRight</div> <div data-gjs-type="animation" style="animation-name: slideInUp" class="animated-box">slideInUp</div> <div data-gjs-type="animation" style="animation-name: zoomIn" class="animated-box">zoomIn</div> <div data-gjs-type="animation" style="animation-name: zoomInDown" class="animated-box">zoomInDown</div> <div data-gjs-type="animation" style="animation-name: zoomInLeft" class="animated-box">zoomInLeft</div> <div data-gjs-type="animation" style="animation-name: zoomInRight" class="animated-box">zoomInRight</div> <div data-gjs-type="animation" style="animation-name: zoomInUp" class="animated-box">zoomInUp</div> </div> </section> <section> <h1>Scroll-triggered</h1> <div data-gjs-type="animation" style="animation-name: slideInLeft" class="animated-box">SlideInLeft</div> <div data-gjs-type="animation" style="animation-name: zoomIn; animation-delay: 0.5s" class="animated-box">ZoomIn with delay</div> </section> <section> <h1>Repeat on scroll</h1> <div data-gjs-type="animation" style="animation-name: slideInLeft; --animation-repeat: true" class="animated-box">SlideInLeft</div> <div data-gjs-type="animation" style="animation-name: zoomIn; --animation-repeat: true" class="animated-box">ZoomIn</div> </section> <section> <h1>Grouped Animations (Staggered)</h1> <div data-gjs-type="animation-group"> <div data-gjs-type="animation" style="animation-name: fadeInDown" class="animated-box">Item 1</div> <div data-gjs-type="animation" style="animation-name: fadeInLeft" class="animated-box">Item 2</div> <div data-gjs-type="animation" style="animation-name: fadeInUp" class="animated-box">Item 3</div> </div> </section> <section> <h1>Grouped Animations (Repeat on scroll)</h1> <div data-gjs-type="animation-group" style="--animation-repeat: true"> <div data-gjs-type="animation" style="animation-name: fadeIn" class="animated-box">Item 1</div> <div data-gjs-type="animation" style="animation-name: fadeIn" class="animated-box">Item 2</div> <div data-gjs-type="animation" style="animation-name: fadeIn" class="animated-box">Item 3</div> </div> </section> <section> <h1>Custom Animations</h1> <div data-gjs-type="animation" style="animation-name: customWiggle; animation-duration: 1.5s" class="animated-box"> Custom "wiggle" animation </div> </section> ` } ] } } })

Code

.code-block-ngdtl2 code { max-height: 600px; }

### Plugin options[​](#plugin-options "Direct link to Plugin options")

Property

Type

Description

licenseKey

string

The license key for the plugin. This is optional, only required if the plugin is used outside of Studio SDK.

**Example**

    "your-license-key"

block

[Block](https://grapesjs.com/docs/api/block.html)

Additional Block properties of the animation component. Pass \`false\` to avoid adding the block.

**Example**

    {  "category": "Extra",  "label": "My label"}

blockGroup

[Block](https://grapesjs.com/docs/api/block.html)

Additional Block properties of the animation group component. Pass \`false\` to avoid adding the block.

**Example**

    {  "category": "Extra",  "label": "My label"}

animations

function

Extend or update animation list.

**Example**

    animations: ({ items }) => { return [   // Remove bounce animations   ...items.filter(item => !item.id.startsWith('bounce')),   // Add custom animation   {     id: 'animationId',     name: 'Custom animation',     css: '@keyframes animationId { 0% { opacity: 0; } 100% { opacity: 1; } }',   } ]}

animationStyle

object

Initial style object of the animation component.

**Example**

    {  "animation-duration": "0.5s"}

animationGroupStyle

object

Initial style object of the animation group component.

**Example**

    {  "--stagger-delay": "0.5s"}
