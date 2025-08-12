# Swiper (Slider) Component Plugin

*Last Updated: August 12, 2025*
*Status: Current - GrapesJS SDK Reference Documentation*

## Overview

The Swiper component plugin integrates the powerful Swiper.js library into GrapesJS Studio SDK, providing advanced touch-enabled slider and carousel functionality. This plugin enables creation of modern, mobile-friendly sliders with extensive customization options.

## Compatibility

- **Project Types**: `web`
- **Plan**: Startup plan
- **License**: Optional license key for use outside Studio SDK
- **Swiper Version**: 11.x (latest)

## Features

- **Touch-Enabled**: Native-like touch gestures and swipe navigation
- **Responsive Breakpoints**: Different settings for various screen sizes
- **Multiple Layouts**: Horizontal, vertical, grid, and coverflow modes
- **Navigation Options**: Arrows, pagination, scrollbar, keyboard, mousewheel
- **Effects**: Slide, fade, cube, coverflow, flip, cards
- **Autoplay**: Configurable automatic slide progression
- **Loop Mode**: Infinite loop sliding
- **Virtual Slides**: Performance optimization for large datasets
- **Accessibility**: Full keyboard navigation and ARIA support

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
import { componentSwiper } from '@grapesjs/studio-sdk-plugins';
import createStudioEditor from '@grapesjs/studio-sdk';

createStudioEditor({
  plugins: [
    componentSwiper
  ],
  project: {
    type: 'web',
    default: {
      pages: [
        { name: 'Home', component: '<div>Swiper slider here</div>' }
      ]
    }
  }
});
```

### React Integration

```javascript
import StudioEditor from '@grapesjs/studio-sdk/react';
import { componentSwiper } from '@grapesjs/studio-sdk-plugins';

<StudioEditor
  options={{
    plugins: [componentSwiper],
    project: {
      type: 'web',
      default: {
        pages: [{
          name: 'Gallery',
          component: `
            <div data-gjs-type="swiper" class="swiper">
              <div data-gjs-type="swiper-wrapper" class="swiper-wrapper">
                <div data-gjs-type="swiper-slide" class="swiper-slide">
                  <img src="image1.jpg" alt="Slide 1">
                </div>
                <div data-gjs-type="swiper-slide" class="swiper-slide">
                  <img src="image2.jpg" alt="Slide 2">
                </div>
                <div data-gjs-type="swiper-slide" class="swiper-slide">
                  <img src="image3.jpg" alt="Slide 3">
                </div>
              </div>
              <div data-gjs-type="swiper-pagination" class="swiper-pagination"></div>
              <div data-gjs-type="swiper-button-next" class="swiper-button-next"></div>
              <div data-gjs-type="swiper-button-prev" class="swiper-button-prev"></div>
            </div>
          `
        }]
      }
    }
  }}
/>
```

## Plugin Options

| Option | Type | Description |
|--------|------|-------------|
| `licenseKey` | `string` | Optional license key for use outside Studio SDK |
| `block` | `object` | Block configuration or `false` to skip |
| `includeCSS` | `boolean` | Include Swiper CSS (default: `true`) |
| `defaultConfig` | `object` | Default Swiper configuration |
| `effectsEnabled` | `array` | Enabled slider effects |
| `modulesEnabled` | `array` | Enabled Swiper modules |

### Example with Options

```javascript
plugins: [
  componentSwiper.init({
    licenseKey: 'your-license-key',
    block: {
      category: 'Media',
      label: 'Slider',
      media: '<svg>...</svg>'
    },
    includeCSS: true,
    defaultConfig: {
      slidesPerView: 1,
      spaceBetween: 30,
      loop: true,
      autoplay: {
        delay: 3000,
        disableOnInteraction: false
      }
    },
    effectsEnabled: ['slide', 'fade', 'cube', 'coverflow'],
    modulesEnabled: ['Navigation', 'Pagination', 'Autoplay']
  })
]
```

## Component Structure

### 1. Swiper Container

Main slider container:

```html
<div data-gjs-type="swiper" 
     class="swiper"
     data-swiper-config='{"slidesPerView": 1, "loop": true}'>
  <!-- Swiper components -->
</div>
```

### 2. Swiper Wrapper

Slides container:

```html
<div data-gjs-type="swiper-wrapper" class="swiper-wrapper">
  <!-- Slides here -->
</div>
```

### 3. Swiper Slide

Individual slide:

```html
<div data-gjs-type="swiper-slide" class="swiper-slide">
  <!-- Slide content -->
</div>
```

### 4. Navigation Elements

```html
<!-- Pagination -->
<div data-gjs-type="swiper-pagination" class="swiper-pagination"></div>

<!-- Navigation arrows -->
<div data-gjs-type="swiper-button-next" class="swiper-button-next"></div>
<div data-gjs-type="swiper-button-prev" class="swiper-button-prev"></div>

<!-- Scrollbar -->
<div data-gjs-type="swiper-scrollbar" class="swiper-scrollbar"></div>
```

## Configuration Examples

### 1. Basic Image Slider

```javascript
const imageSlider = {
  type: 'swiper',
  attributes: {
    class: 'image-slider',
    'data-swiper-config': JSON.stringify({
      slidesPerView: 1,
      spaceBetween: 0,
      loop: true,
      pagination: {
        el: '.swiper-pagination',
        clickable: true
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev'
      }
    })
  },
  components: [
    {
      type: 'swiper-wrapper',
      components: [
        {
          type: 'swiper-slide',
          components: [{
            tagName: 'img',
            attributes: { src: 'slide1.jpg', alt: 'Slide 1' }
          }]
        },
        {
          type: 'swiper-slide',
          components: [{
            tagName: 'img',
            attributes: { src: 'slide2.jpg', alt: 'Slide 2' }
          }]
        }
      ]
    },
    { type: 'swiper-pagination' },
    { type: 'swiper-button-next' },
    { type: 'swiper-button-prev' }
  ]
};
```

### 2. Testimonial Carousel

```javascript
const testimonialCarousel = {
  type: 'swiper',
  attributes: {
    class: 'testimonial-carousel',
    'data-swiper-config': JSON.stringify({
      slidesPerView: 1,
      spaceBetween: 30,
      autoplay: {
        delay: 5000,
        disableOnInteraction: false
      },
      pagination: {
        el: '.swiper-pagination',
        type: 'bullets'
      },
      breakpoints: {
        640: { slidesPerView: 2 },
        1024: { slidesPerView: 3 }
      }
    })
  },
  components: [
    {
      type: 'swiper-wrapper',
      components: testimonials.map(testimonial => ({
        type: 'swiper-slide',
        components: [
          {
            tagName: 'div',
            attributes: { class: 'testimonial-card' },
            components: [
              { tagName: 'p', content: testimonial.quote },
              { tagName: 'h4', content: testimonial.author },
              { tagName: 'span', content: testimonial.role }
            ]
          }
        ]
      }))
    },
    { type: 'swiper-pagination' }
  ]
};
```

### 3. Product Gallery

```javascript
const productGallery = {
  type: 'swiper',
  attributes: {
    class: 'product-gallery',
    'data-swiper-config': JSON.stringify({
      slidesPerView: 1,
      spaceBetween: 10,
      thumbs: {
        swiper: '.gallery-thumbs'
      },
      zoom: true
    })
  },
  components: [
    {
      type: 'swiper-wrapper',
      components: products.map(product => ({
        type: 'swiper-slide',
        components: [{
          tagName: 'div',
          attributes: { class: 'swiper-zoom-container' },
          components: [{
            tagName: 'img',
            attributes: { src: product.image, alt: product.name }
          }]
        }]
      }))
    }
  ]
};
```

## Effects

### Available Effects

```javascript
// Fade effect
{
  effect: 'fade',
  fadeEffect: {
    crossFade: true
  }
}

// Cube effect
{
  effect: 'cube',
  cubeEffect: {
    shadow: true,
    slideShadows: true
  }
}

// Coverflow effect
{
  effect: 'coverflow',
  coverflowEffect: {
    rotate: 50,
    stretch: 0,
    depth: 100,
    modifier: 1,
    slideShadows: true
  }
}

// Flip effect
{
  effect: 'flip',
  flipEffect: {
    slideShadows: true,
    limitRotation: true
  }
}

// Cards effect
{
  effect: 'cards',
  cardsEffect: {
    perSlideOffset: 8,
    perSlideRotate: 2
  }
}
```

## Responsive Configuration

### Breakpoints Example

```javascript
const responsiveSlider = {
  type: 'swiper',
  attributes: {
    'data-swiper-config': JSON.stringify({
      slidesPerView: 1,
      spaceBetween: 10,
      breakpoints: {
        // when window width is >= 320px
        320: {
          slidesPerView: 1,
          spaceBetween: 20
        },
        // when window width is >= 480px
        480: {
          slidesPerView: 2,
          spaceBetween: 30
        },
        // when window width is >= 640px
        640: {
          slidesPerView: 3,
          spaceBetween: 40
        },
        // when window width is >= 1024px
        1024: {
          slidesPerView: 4,
          spaceBetween: 50
        }
      }
    })
  }
};
```

## Advanced Features

### 1. Virtual Slides

For performance with many slides:

```javascript
{
  virtual: {
    enabled: true,
    slides: generateSlideContent(), // Array of slide content
    renderSlide: function(content, index) {
      return `<div class="swiper-slide">${content}</div>`;
    }
  }
}
```

### 2. Lazy Loading

```html
<div data-gjs-type="swiper-slide">
  <img data-src="large-image.jpg" 
       class="swiper-lazy"
       alt="Lazy loaded image">
  <div class="swiper-lazy-preloader"></div>
</div>
```

Configuration:
```javascript
{
  lazy: {
    enabled: true,
    loadPrevNext: true,
    loadOnTransitionStart: true
  }
}
```

### 3. Synchronized Sliders

```javascript
// Main slider
const mainSlider = {
  type: 'swiper',
  attributes: {
    id: 'main-slider',
    'data-swiper-config': JSON.stringify({
      thumbs: {
        swiper: '#thumb-slider'
      }
    })
  }
};

// Thumbnail slider
const thumbSlider = {
  type: 'swiper',
  attributes: {
    id: 'thumb-slider',
    'data-swiper-config': JSON.stringify({
      slidesPerView: 4,
      spaceBetween: 10,
      watchSlidesProgress: true
    })
  }
};
```

## Styling

### Custom Styles

```css
/* Custom navigation arrows */
.swiper-button-next,
.swiper-button-prev {
  color: #fff;
  background: rgba(0, 0, 0, 0.5);
  width: 50px;
  height: 50px;
  border-radius: 50%;
}

.swiper-button-next:after,
.swiper-button-prev:after {
  font-size: 20px;
}

/* Custom pagination */
.swiper-pagination-bullet {
  width: 12px;
  height: 12px;
  background: #fff;
  opacity: 0.5;
}

.swiper-pagination-bullet-active {
  opacity: 1;
  background: #007aff;
}

/* Slide styles */
.swiper-slide {
  display: flex;
  justify-content: center;
  align-items: center;
  background: #f5f5f5;
}

/* Full height slider */
.fullscreen-slider {
  height: 100vh;
}

.fullscreen-slider .swiper-slide {
  height: 100vh;
}
```

## JavaScript API

### Accessing Swiper Instance

```javascript
// Get Swiper instance
editor.on('component:mount', (component) => {
  if (component.get('type') === 'swiper') {
    const swiperEl = component.getEl();
    const swiper = swiperEl.swiper;
    
    // Use Swiper API
    swiper.slideNext();
    swiper.slidePrev();
    swiper.slideTo(2);
  }
});
```

### Custom Commands

```javascript
// Next slide
editor.runCommand('swiper:next', { id: 'my-slider' });

// Previous slide
editor.runCommand('swiper:prev', { id: 'my-slider' });

// Go to specific slide
editor.runCommand('swiper:goto', { id: 'my-slider', index: 3 });

// Start autoplay
editor.runCommand('swiper:play', { id: 'my-slider' });

// Stop autoplay
editor.runCommand('swiper:stop', { id: 'my-slider' });
```

### Events

```javascript
// Slide change
editor.on('swiper:slideChange', (swiper, component) => {
  console.log('Active slide:', swiper.activeIndex);
});

// Reach beginning/end
editor.on('swiper:reachBeginning', (swiper, component) => {
  console.log('Reached first slide');
});

editor.on('swiper:reachEnd', (swiper, component) => {
  console.log('Reached last slide');
});
```

## Best Practices

### 1. **Performance Optimization**

```javascript
{
  // Preload nearby slides
  preloadImages: true,
  watchSlidesProgress: true,
  
  // Lazy loading for images
  lazy: {
    enabled: true,
    loadPrevNext: true
  },
  
  // Virtual slides for large datasets
  virtual: {
    enabled: true,
    cache: true
  }
}
```

### 2. **Accessibility**

```javascript
{
  a11y: {
    enabled: true,
    prevSlideMessage: 'Previous slide',
    nextSlideMessage: 'Next slide',
    firstSlideMessage: 'This is the first slide',
    lastSlideMessage: 'This is the last slide',
    paginationBulletMessage: 'Go to slide {{index}}',
    notificationClass: 'swiper-notification'
  },
  keyboard: {
    enabled: true,
    onlyInViewport: true
  }
}
```

### 3. **Mobile Optimization**

```javascript
{
  // Touch settings
  touchRatio: 1,
  touchAngle: 45,
  grabCursor: true,
  
  // Disable on small screens
  breakpoints: {
    320: {
      enabled: true,
      slidesPerView: 1
    }
  },
  
  // Free mode for natural scrolling
  freeMode: {
    enabled: true,
    sticky: true
  }
}
```

## Troubleshooting

### Common Issues

1. **Slider not initializing**
   - Ensure container has defined dimensions
   - Check for JavaScript errors
   - Verify Swiper CSS is loaded

2. **Navigation not working**
   - Check element selectors in config
   - Ensure navigation elements exist
   - Verify z-index of navigation elements

3. **Responsive breakpoints not applying**
   - Check breakpoint values
   - Ensure proper syntax in config
   - Test in actual device sizes

### Debug Mode

```javascript
plugins: [
  componentSwiper.init({
    debug: true,
    onInit: (swiper) => {
      console.log('Swiper initialized:', swiper);
    }
  })
]
```

## Integration with InvestorPrez

Swiper enhances InvestorPrez presentations with:

### Use Cases

1. **Company Showcase**
   - Team member carousel
   - Product gallery
   - Client testimonials
   - Press mentions

2. **Financial Visualizations**
   - Chart progression
   - Timeline slider
   - Milestone showcase

3. **Interactive Presentations**
   - Slide-based pitch deck
   - Before/after comparisons
   - Feature demonstrations

### Example Implementation

```javascript
// Investment highlights slider
const investmentSlider = {
  type: 'swiper',
  attributes: {
    class: 'investment-highlights',
    'data-swiper-config': JSON.stringify({
      effect: 'coverflow',
      grabCursor: true,
      centeredSlides: true,
      slidesPerView: 'auto',
      coverflowEffect: {
        rotate: 50,
        stretch: 0,
        depth: 100,
        modifier: 1,
        slideShadows: true
      },
      autoplay: {
        delay: 4000,
        disableOnInteraction: false
      }
    })
  },
  components: [
    {
      type: 'swiper-wrapper',
      components: [
        {
          type: 'swiper-slide',
          components: [{
            tagName: 'div',
            attributes: { class: 'highlight-card' },
            components: [
              { tagName: 'h3', content: '300% Growth' },
              { tagName: 'p', content: 'Year-over-year revenue increase' }
            ]
          }]
        },
        {
          type: 'swiper-slide',
          components: [{
            tagName: 'div',
            attributes: { class: 'highlight-card' },
            components: [
              { tagName: 'h3', content: '50K+ Users' },
              { tagName: 'p', content: 'Active monthly users' }
            ]
          }]
        }
      ]
    },
    { type: 'swiper-pagination' }
  ]
};
```

## Related Documentation

- [Components Overview](../../03_Configuration/Components/Configuration_Components_Overview.md)
- [Animation](../Animation.md) - Animation effects
- [LightGallery](./LightGallery.md) - Image gallery
- [FsLightbox](./FsLightbox.md) - Lightbox viewer

## Resources

- [Swiper.js Documentation](https://swiperjs.com/)
- [Swiper API Reference](https://swiperjs.com/swiper-api)
- [Swiper Demos](https://swiperjs.com/demos)