# LightGallery Component Plugin

*Last Updated: August 12, 2025*
*Status: Current - GrapesJS SDK Reference Documentation*

## Overview

The LightGallery component plugin integrates the powerful lightGallery.js library into GrapesJS Studio SDK, providing a feature-rich, mobile-friendly gallery and lightbox solution. This plugin enables creation of beautiful image and video galleries with extensive customization options and smooth animations.

## Compatibility

- **Project Types**: `web`
- **Plan**: Startup plan
- **License**: Optional license key for use outside Studio SDK
- **LightGallery Version**: 2.x (latest)

## Features

- **Multiple Media Types**: Images, videos (YouTube, Vimeo, HTML5), iframes
- **Touch Gestures**: Pinch to zoom, double-tap, swipe navigation
- **Thumbnail Navigation**: Built-in thumbnail gallery
- **Zoom Functionality**: Deep zoom with mouse wheel and pinch gestures
- **Full Screen Mode**: Native fullscreen API support
- **Social Sharing**: Built-in share functionality
- **Download Option**: Allow users to download images
- **Responsive Images**: Support for srcset and picture elements
- **Animation Effects**: Multiple transition effects
- **Autoplay**: Slideshow with configurable timing

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
import { componentLightGallery } from '@grapesjs/studio-sdk-plugins';
import createStudioEditor from '@grapesjs/studio-sdk';

createStudioEditor({
  plugins: [
    componentLightGallery
  ],
  project: {
    type: 'web',
    default: {
      pages: [
        { name: 'Gallery', component: '<div>Gallery content here</div>' }
      ]
    }
  }
});
```

### React Integration

```javascript
import StudioEditor from '@grapesjs/studio-sdk/react';
import { componentLightGallery } from '@grapesjs/studio-sdk-plugins';

<StudioEditor
  options={{
    plugins: [componentLightGallery],
    project: {
      type: 'web',
      default: {
        pages: [{
          name: 'Photo Gallery',
          component: `
            <div data-gjs-type="lightgallery" id="gallery-1">
              <a data-gjs-type="lightgallery-item" 
                 href="image1-large.jpg"
                 data-sub-html="<h4>Image 1</h4><p>Description</p>">
                <img src="image1-thumb.jpg" alt="Image 1">
              </a>
              <a data-gjs-type="lightgallery-item" 
                 href="image2-large.jpg"
                 data-sub-html="<h4>Image 2</h4><p>Description</p>">
                <img src="image2-thumb.jpg" alt="Image 2">
              </a>
              <a data-gjs-type="lightgallery-item" 
                 href="https://www.youtube.com/watch?v=VIDEO_ID"
                 data-sub-html="<h4>Video Title</h4>">
                <img src="video-thumb.jpg" alt="Video">
              </a>
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
| `includeCSS` | `boolean` | Include LightGallery CSS (default: `true`) |
| `plugins` | `array` | LightGallery plugins to enable |
| `defaultSettings` | `object` | Default LightGallery settings |

### Example with Options

```javascript
plugins: [
  componentLightGallery.init({
    licenseKey: 'your-license-key',
    block: {
      category: 'Media',
      label: 'Gallery',
      media: '<svg>...</svg>'
    },
    includeCSS: true,
    plugins: ['lgZoom', 'lgThumbnail', 'lgFullscreen', 'lgShare', 'lgVideo'],
    defaultSettings: {
      speed: 500,
      download: true,
      counter: true,
      thumbnail: true,
      animateThumb: true,
      showThumbByDefault: true
    }
  })
]
```

## Component Structure

### 1. Gallery Container

Main gallery wrapper:

```html
<div data-gjs-type="lightgallery" 
     id="my-gallery"
     data-lg-settings='{"speed": 500, "thumbnail": true}'>
  <!-- Gallery items -->
</div>
```

### 2. Gallery Item

Individual gallery item:

```html
<a data-gjs-type="lightgallery-item" 
   href="full-size-image.jpg"
   data-src="full-size-image.jpg"
   data-sub-html="<h4>Title</h4><p>Description</p>"
   data-thumb="thumbnail.jpg">
  <img src="thumbnail.jpg" alt="Gallery Image">
</a>
```

### 3. Video Items

```html
<!-- YouTube Video -->
<a data-gjs-type="lightgallery-item" 
   data-src="https://www.youtube.com/watch?v=VIDEO_ID"
   data-poster="video-poster.jpg">
  <img src="video-thumb.jpg" alt="Video">
  <div class="play-button"></div>
</a>

<!-- Vimeo Video -->
<a data-gjs-type="lightgallery-item" 
   data-src="https://vimeo.com/VIDEO_ID"
   data-poster="video-poster.jpg">
  <img src="video-thumb.jpg" alt="Video">
</a>

<!-- HTML5 Video -->
<a data-gjs-type="lightgallery-item" 
   data-video='{"source": [{"src":"video.mp4", "type":"video/mp4"}], "attributes": {"preload": false, "controls": true}}'>
  <img src="video-thumb.jpg" alt="Video">
</a>
```

## Gallery Types

### 1. Image Gallery

```javascript
const imageGallery = {
  type: 'lightgallery',
  attributes: {
    id: 'image-gallery',
    'data-lg-settings': JSON.stringify({
      thumbnail: true,
      animateThumb: false,
      showThumbByDefault: false,
      download: true,
      counter: true,
      zoom: true
    })
  },
  components: images.map(image => ({
    type: 'lightgallery-item',
    attributes: {
      href: image.full,
      'data-thumb': image.thumb,
      'data-sub-html': `<h4>${image.title}</h4><p>${image.description}</p>`
    },
    components: [{
      tagName: 'img',
      attributes: {
        src: image.thumb,
        alt: image.title
      }
    }]
  }))
};
```

### 2. Mixed Media Gallery

```javascript
const mixedGallery = {
  type: 'lightgallery',
  attributes: {
    'data-lg-settings': JSON.stringify({
      dynamic: true,
      dynamicEl: [
        {
          src: 'image1.jpg',
          thumb: 'thumb1.jpg',
          subHtml: '<h4>Image</h4>'
        },
        {
          src: 'https://www.youtube.com/watch?v=VIDEO_ID',
          thumb: 'video-thumb.jpg',
          subHtml: '<h4>YouTube Video</h4>'
        },
        {
          html: '<div class="custom-html">Custom HTML Content</div>',
          thumb: 'custom-thumb.jpg'
        }
      ]
    })
  }
};
```

### 3. Product Gallery

```javascript
const productGallery = {
  type: 'lightgallery',
  attributes: {
    class: 'product-gallery',
    'data-lg-settings': JSON.stringify({
      zoom: true,
      actualSize: true,
      showZoomInOutIcons: true,
      actualSizeIcons: {
        zoomIn: 'lg-zoom-in',
        zoomOut: 'lg-zoom-out'
      }
    })
  },
  components: [
    {
      type: 'lightgallery-item',
      attributes: {
        href: 'product-hd.jpg',
        'data-src': 'product-hd.jpg',
        'data-responsive': JSON.stringify([
          {
            src: 'product-mobile.jpg',
            media: '(max-width: 480px)'
          },
          {
            src: 'product-tablet.jpg',
            media: '(max-width: 768px)'
          },
          {
            src: 'product-desktop.jpg',
            media: '(min-width: 769px)'
          }
        ])
      },
      components: [{
        tagName: 'img',
        attributes: { src: 'product-thumb.jpg' }
      }]
    }
  ]
};
```

## Advanced Features

### 1. Dynamic Gallery

```javascript
// Initialize empty gallery
const dynamicGallery = {
  type: 'lightgallery',
  attributes: {
    id: 'dynamic-gallery',
    'data-lg-settings': JSON.stringify({
      dynamic: true,
      dynamicEl: []
    })
  }
};

// Add items dynamically
editor.on('component:mount', (component) => {
  if (component.getId() === 'dynamic-gallery') {
    const gallery = window.lgData[component.getEl().id];
    
    // Add new items
    const newItems = [
      {
        src: 'new-image.jpg',
        thumb: 'new-thumb.jpg',
        subHtml: 'New Image'
      }
    ];
    
    gallery.refresh(newItems);
  }
});
```

### 2. Custom Thumbnails

```javascript
{
  thumbnail: true,
  thumbWidth: 100,
  thumbHeight: 80,
  thumbMargin: 5,
  appendThumbnailsTo: '.custom-thumbnails-container',
  thumbnailAnimation: false,
  showThumbByDefault: true
}
```

### 3. Captions and Metadata

```html
<a data-gjs-type="lightgallery-item"
   href="image.jpg"
   data-sub-html="#caption-1"
   data-pinterest-text="Pin it"
   data-tweet-text="Share on Twitter"
   data-facebook-share-url="https://example.com"
   data-twitter-share-url="https://example.com">
  <img src="thumb.jpg" alt="Image">
</a>

<div id="caption-1" style="display:none;">
  <h4>Image Title</h4>
  <p>Image description with <a href="#">links</a> and <strong>formatting</strong>.</p>
  <p>Photo by: John Doe</p>
</div>
```

## Styling

### Custom Themes

```css
/* Dark theme */
.lg-backdrop {
  background-color: rgba(0, 0, 0, 0.95);
}

.lg-toolbar {
  background-color: rgba(0, 0, 0, 0.7);
}

.lg-sub-html {
  background-color: rgba(0, 0, 0, 0.8);
  color: #fff;
}

/* Custom thumbnails */
.lg-thumb-outer {
  background-color: rgba(0, 0, 0, 0.9);
}

.lg-thumb-item {
  border: 2px solid transparent;
  border-radius: 4px;
  overflow: hidden;
}

.lg-thumb-item.active {
  border-color: #fff;
}

/* Custom controls */
.lg-next, .lg-prev {
  background-color: rgba(255, 255, 255, 0.1);
  color: #fff;
  font-size: 24px;
  border-radius: 50%;
}

.lg-next:hover, .lg-prev:hover {
  background-color: rgba(255, 255, 255, 0.2);
}
```

### Gallery Grid Styles

```css
/* Masonry layout */
.gallery-masonry {
  column-count: 3;
  column-gap: 1rem;
}

.gallery-masonry .lightgallery-item {
  display: inline-block;
  margin-bottom: 1rem;
  width: 100%;
}

/* Responsive grid */
@media (max-width: 768px) {
  .gallery-masonry {
    column-count: 2;
  }
}

@media (max-width: 480px) {
  .gallery-masonry {
    column-count: 1;
  }
}

/* Hover effects */
.lightgallery-item {
  position: relative;
  overflow: hidden;
  cursor: pointer;
}

.lightgallery-item::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.5);
  opacity: 0;
  transition: opacity 0.3s ease;
}

.lightgallery-item:hover::before {
  opacity: 1;
}
```

## JavaScript API

### Gallery Control

```javascript
// Get gallery instance
const galleryEl = document.getElementById('my-gallery');
const gallery = window.lgData[galleryEl.id];

// Open gallery
gallery.openGallery();

// Go to specific slide
gallery.goToSlide(2);

// Next/Previous
gallery.goToNextSlide();
gallery.goToPrevSlide();

// Close gallery
gallery.closeGallery();

// Destroy and reinitialize
gallery.destroy();
lightGallery(galleryEl, newSettings);
```

### Events

```javascript
// Gallery events
editor.on('lightgallery:init', (detail) => {
  console.log('Gallery initialized', detail);
});

editor.on('lightgallery:beforeOpen', (detail) => {
  console.log('Before gallery opens');
});

editor.on('lightgallery:afterOpen', (detail) => {
  console.log('After gallery opens');
});

editor.on('lightgallery:slideItemLoad', (detail) => {
  console.log('Slide loaded:', detail.index);
});

editor.on('lightgallery:beforeSlide', (detail) => {
  console.log('Before slide change:', detail.index);
});

editor.on('lightgallery:afterSlide', (detail) => {
  console.log('After slide change:', detail.index);
});
```

### Custom Plugins

```javascript
// Register custom plugin
lgPlugin.prototype.init = function() {
  // Plugin initialization
  this.core.LGel.on('lgAfterOpen.custom', () => {
    // Custom logic
  });
};

lgPlugin.prototype.destroy = function() {
  // Cleanup
};

// Use custom plugin
plugins: [
  componentLightGallery.init({
    customPlugins: [lgPlugin]
  })
]
```

## Configuration Options

### Core Settings

```javascript
{
  // Gallery mode
  mode: 'lg-slide', // lg-slide | lg-fade
  cssEasing: 'ease',
  speed: 600,
  
  // Controls
  controls: true,
  hideControlOnEnd: false,
  loop: true,
  counter: true,
  
  // Preload
  preload: 1,
  numberOfSlideItemsInDom: 10,
  
  // Behaviors
  showAfterLoad: true,
  selector: '',
  selectWithin: '',
  
  // Swipe & Drag
  enableSwipe: true,
  enableDrag: true,
  swipeThreshold: 50,
  
  // Zoom
  zoom: true,
  scale: 1,
  
  // Video
  videoMaxWidth: '855px',
  autoplayFirstVideo: true,
  youTubePlayerParams: {
    modestbranding: 1,
    showinfo: 0,
    controls: 1
  }
}
```

### Plugin Settings

```javascript
// Thumbnail settings
lgThumbnail: {
  thumbnail: true,
  animateThumb: false,
  currentPagerPosition: 'middle',
  alignThumbnails: 'middle',
  thumbWidth: 100,
  thumbHeight: '80px',
  thumbMargin: 5
}

// Zoom settings
lgZoom: {
  zoom: true,
  scale: 1,
  actualSize: true,
  showZoomInOutIcons: true,
  actualSizeIcons: {
    zoomIn: 'lg-zoom-in',
    zoomOut: 'lg-zoom-out'
  }
}

// Share settings
lgShare: {
  share: true,
  facebook: true,
  facebookDropdownText: 'Facebook',
  twitter: true,
  twitterDropdownText: 'Twitter',
  pinterest: true,
  pinterestDropdownText: 'Pinterest'
}
```

## Best Practices

### 1. **Performance Optimization**

```javascript
{
  // Lazy load images
  preload: 1,
  numberOfSlideItemsInDom: 5,
  
  // Optimize thumbnails
  thumbnail: true,
  animateThumb: false,
  loadYouTubeThumbnail: true,
  youTubeThumbSize: 'default',
  
  // Responsive images
  responsive: true,
  srcset: true
}
```

### 2. **Accessibility**

```javascript
{
  // Keyboard navigation
  keyPress: true,
  escKey: true,
  
  // ARIA labels
  ariaLabelledby: '',
  ariaDescribedby: '',
  
  // Focus management
  trapFocus: true,
  
  // Alt text
  galleryId: 'gallery-1' // For unique IDs
}
```

### 3. **Mobile Optimization**

```javascript
{
  // Touch settings
  enableSwipe: true,
  enableDrag: true,
  swipeThreshold: 50,
  
  // Mobile UI
  mobileSettings: {
    controls: false,
    showCloseIcon: true,
    download: false,
    rotate: false
  }
}
```

## Troubleshooting

### Common Issues

1. **Gallery not opening**
   - Check if LightGallery CSS is loaded
   - Verify selector matches elements
   - Check for JavaScript errors

2. **Videos not playing**
   - Verify video URLs are correct
   - Check video plugin is loaded
   - Test video format compatibility

3. **Thumbnails not showing**
   - Ensure thumbnail plugin is enabled
   - Check thumbnail image paths
   - Verify thumbnail container exists

### Debug Mode

```javascript
plugins: [
  componentLightGallery.init({
    debug: true,
    onBeforeOpen: () => {
      console.log('Gallery opening...');
    },
    onError: (error) => {
      console.error('Gallery error:', error);
    }
  })
]
```

## Integration with InvestorPrez

LightGallery enhances InvestorPrez presentations:

### Use Cases

1. **Product Showcases**
   - Product image galleries
   - Feature demonstrations
   - Before/after comparisons

2. **Team & Office**
   - Team member photos
   - Office tour gallery
   - Event photos

3. **Media Coverage**
   - Press clippings
   - Award ceremonies
   - Conference presentations

### Example Implementation

```javascript
// Investor presentation gallery
const investorGallery = {
  type: 'lightgallery',
  attributes: {
    class: 'investor-gallery',
    'data-lg-settings': JSON.stringify({
      thumbnail: true,
      download: false,
      share: false,
      autoplayFirstVideo: true,
      plugins: ['lgZoom', 'lgThumbnail', 'lgVideo']
    })
  },
  components: [
    {
      type: 'lightgallery-item',
      attributes: {
        href: 'company-overview.jpg',
        'data-sub-html': '<h4>Company Overview</h4><p>Founded in 2020, serving 50K+ customers</p>'
      },
      components: [{
        tagName: 'img',
        attributes: { 
          src: 'company-overview-thumb.jpg',
          alt: 'Company Overview'
        }
      }]
    },
    {
      type: 'lightgallery-item',
      attributes: {
        'data-src': 'https://youtube.com/watch?v=DEMO_VIDEO',
        'data-sub-html': '<h4>Product Demo</h4><p>See our solution in action</p>'
      },
      components: [{
        tagName: 'img',
        attributes: { 
          src: 'demo-thumb.jpg',
          alt: 'Product Demo'
        }
      }]
    }
  ]
};
```

## Related Documentation

- [Components Overview](../../03_Configuration/Components/Configuration_Components_Overview.md)
- [FsLightbox](./FsLightbox.md) - Alternative lightbox
- [Swiper](./Swiper.md) - Slider component
- [Animation](../Animation.md) - Animation effects

## Resources

- [LightGallery Documentation](https://www.lightgalleryjs.com/docs/)
- [LightGallery Demos](https://www.lightgalleryjs.com/demos/)
- [LightGallery API](https://www.lightgalleryjs.com/docs/methods/)