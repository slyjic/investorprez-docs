# FsLightbox (Image Viewer) Component Plugin

*Last Updated: August 12, 2025*
*Status: Current - GrapesJS SDK Reference Documentation*

## Overview

The FsLightbox component plugin integrates the lightweight Fullscreen Lightbox library into GrapesJS Studio SDK. This plugin provides a simple yet powerful image viewer with minimal setup, perfect for projects that need a fast, efficient lightbox solution without heavy dependencies.

## Compatibility

- **Project Types**: `web`
- **Plan**: Startup plan  
- **License**: Optional license key for use outside Studio SDK
- **Library Size**: ~30KB (minified)

## Features

- **Ultra-Lightweight**: Minimal footprint with no dependencies
- **Multiple Media Types**: Images, videos, YouTube, Vimeo, HTML content
- **Touch Support**: Swipe gestures on mobile devices
- **Keyboard Navigation**: Arrow keys, ESC to close
- **Fullscreen Mode**: True fullscreen viewing experience
- **Fast Loading**: Optimized for performance
- **Simple API**: Easy to implement and customize
- **Responsive**: Works on all devices
- **No jQuery**: Pure vanilla JavaScript

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
import { componentFsLightbox } from '@grapesjs/studio-sdk-plugins';
import createStudioEditor from '@grapesjs/studio-sdk';

createStudioEditor({
  plugins: [
    componentFsLightbox
  ],
  project: {
    type: 'web',
    default: {
      pages: [
        { name: 'Gallery', component: '<div>Lightbox content here</div>' }
      ]
    }
  }
});
```

### React Integration

```javascript
import StudioEditor from '@grapesjs/studio-sdk/react';
import { componentFsLightbox } from '@grapesjs/studio-sdk-plugins';

<StudioEditor
  options={{
    plugins: [componentFsLightbox],
    project: {
      type: 'web',
      default: {
        pages: [{
          name: 'Image Gallery',
          component: `
            <div class="gallery">
              <a data-gjs-type="fslightbox" 
                 data-fslightbox="gallery"
                 href="image1-full.jpg">
                <img src="image1-thumb.jpg" alt="Image 1">
              </a>
              <a data-gjs-type="fslightbox" 
                 data-fslightbox="gallery"
                 href="image2-full.jpg">
                <img src="image2-thumb.jpg" alt="Image 2">
              </a>
              <a data-gjs-type="fslightbox" 
                 data-fslightbox="gallery"
                 href="https://www.youtube.com/watch?v=VIDEO_ID">
                <img src="video-thumb.jpg" alt="Video">
                <div class="play-icon">▶</div>
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
| `includeCSS` | `boolean` | Include default styles (default: `true`) |
| `defaultType` | `string` | Default lightbox type (`'image'`, `'video'`) |
| `autoInit` | `boolean` | Auto-initialize on page load (default: `true`) |

### Example with Options

```javascript
plugins: [
  componentFsLightbox.init({
    licenseKey: 'your-license-key',
    block: {
      category: 'Media',
      label: 'Lightbox',
      media: '<svg>...</svg>'
    },
    includeCSS: true,
    defaultType: 'image',
    autoInit: true
  })
]
```

## Component Types

### 1. Single Image

```html
<a data-gjs-type="fslightbox" 
   href="large-image.jpg">
  <img src="thumbnail.jpg" alt="Click to enlarge">
</a>
```

### 2. Gallery Group

```html
<!-- Images in same gallery -->
<a data-gjs-type="fslightbox" 
   data-fslightbox="gallery-1"
   href="image1.jpg">
  <img src="thumb1.jpg" alt="Image 1">
</a>

<a data-gjs-type="fslightbox" 
   data-fslightbox="gallery-1"
   href="image2.jpg">
  <img src="thumb2.jpg" alt="Image 2">
</a>
```

### 3. Video Content

```html
<!-- YouTube -->
<a data-gjs-type="fslightbox" 
   data-fslightbox="video-gallery"
   data-type="youtube"
   href="https://www.youtube.com/watch?v=VIDEO_ID">
  Open YouTube Video
</a>

<!-- Vimeo -->
<a data-gjs-type="fslightbox" 
   data-fslightbox="video-gallery"
   data-type="vimeo"
   href="https://vimeo.com/VIDEO_ID">
  Open Vimeo Video
</a>

<!-- HTML5 Video -->
<a data-gjs-type="fslightbox" 
   data-fslightbox="video-gallery"
   data-type="video"
   href="video.mp4">
  Open Video
</a>
```

### 4. Inline Content

```html
<!-- Inline HTML -->
<a data-gjs-type="fslightbox" 
   data-fslightbox="content"
   data-type="inline"
   data-src="#hidden-content">
  Show Content
</a>

<div id="hidden-content" style="display:none;">
  <h2>Hidden Content</h2>
  <p>This content is shown in the lightbox.</p>
</div>
```

## Configuration Examples

### 1. Basic Image Gallery

```javascript
const imageGallery = {
  tagName: 'div',
  attributes: { class: 'image-gallery' },
  components: images.map((image, index) => ({
    type: 'fslightbox',
    attributes: {
      href: image.full,
      'data-fslightbox': 'main-gallery',
      'data-caption': image.caption
    },
    components: [{
      tagName: 'img',
      attributes: {
        src: image.thumb,
        alt: image.alt,
        loading: 'lazy'
      }
    }]
  }))
};
```

### 2. Mixed Media Gallery

```javascript
const mixedGallery = {
  tagName: 'div',
  attributes: { class: 'mixed-gallery' },
  components: [
    // Image
    {
      type: 'fslightbox',
      attributes: {
        href: 'photo.jpg',
        'data-fslightbox': 'mixed',
        'data-type': 'image'
      },
      components: [{ tagName: 'span', content: 'View Photo' }]
    },
    // YouTube Video
    {
      type: 'fslightbox',
      attributes: {
        href: 'https://www.youtube.com/watch?v=ABC123',
        'data-fslightbox': 'mixed',
        'data-type': 'youtube'
      },
      components: [{ tagName: 'span', content: 'Watch Video' }]
    },
    // Inline Content
    {
      type: 'fslightbox',
      attributes: {
        'data-src': '#info-content',
        'data-fslightbox': 'mixed',
        'data-type': 'inline'
      },
      components: [{ tagName: 'span', content: 'More Info' }]
    }
  ]
};
```

### 3. Product Images

```javascript
const productGallery = {
  tagName: 'div',
  attributes: { class: 'product-images' },
  components: [
    // Main image
    {
      type: 'fslightbox',
      attributes: {
        href: 'product-main.jpg',
        'data-fslightbox': 'product',
        class: 'main-image'
      },
      components: [{
        tagName: 'img',
        attributes: {
          src: 'product-main-thumb.jpg',
          alt: 'Product Main View'
        }
      }]
    },
    // Thumbnail strip
    {
      tagName: 'div',
      attributes: { class: 'thumbnails' },
      components: productImages.map(img => ({
        type: 'fslightbox',
        attributes: {
          href: img.full,
          'data-fslightbox': 'product',
          class: 'thumbnail'
        },
        components: [{
          tagName: 'img',
          attributes: {
            src: img.thumb,
            alt: img.alt
          }
        }]
      }))
    }
  ]
};
```

## Styling

### Default Styles

```css
/* Lightbox triggers */
[data-fslightbox] {
  cursor: pointer;
  transition: opacity 0.3s ease;
}

[data-fslightbox]:hover {
  opacity: 0.8;
}

/* Gallery grid */
.fslightbox-gallery {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
  gap: 1rem;
}

.fslightbox-gallery img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  border-radius: 4px;
}

/* Video indicators */
.video-thumbnail {
  position: relative;
}

.video-thumbnail .play-icon {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 60px;
  height: 60px;
  background: rgba(0, 0, 0, 0.7);
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  color: white;
  font-size: 24px;
}

/* Loading spinner */
.fslightbox-loader {
  display: block;
  width: 40px;
  height: 40px;
  border: 4px solid #f3f3f3;
  border-top: 4px solid #333;
  border-radius: 50%;
  animation: spin 1s linear infinite;
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
```

### Custom Themes

```css
/* Dark theme */
.fslightbox-container {
  background: rgba(0, 0, 0, 0.95) !important;
}

.fslightbox-toolbar {
  background: transparent !important;
}

/* Minimal theme */
.minimal-lightbox .fslightbox-toolbar {
  opacity: 0;
  transition: opacity 0.3s;
}

.minimal-lightbox:hover .fslightbox-toolbar {
  opacity: 1;
}

/* Custom navigation */
.fslightbox-slide-btn {
  width: 50px !important;
  height: 50px !important;
  background: rgba(255, 255, 255, 0.1) !important;
  border-radius: 50% !important;
}

.fslightbox-slide-btn:hover {
  background: rgba(255, 255, 255, 0.2) !important;
}
```

## JavaScript API

### Initialization

```javascript
// Manual initialization
const lightbox = new FsLightbox();
lightbox.init();

// With configuration
const customLightbox = new FsLightbox({
  showCounter: true,
  backgroundColor: 'rgba(0, 0, 0, 0.9)',
  slideDistance: 0.5
});
```

### Programmatic Control

```javascript
// Open lightbox
editor.runCommand('fslightbox:open', {
  sources: ['image1.jpg', 'image2.jpg'],
  startAt: 0
});

// Open specific gallery
editor.runCommand('fslightbox:openGallery', {
  gallery: 'product-images',
  startAt: 2
});

// Refresh lightbox instances
editor.runCommand('fslightbox:refresh');
```

### Events

```javascript
// Lightbox opened
document.addEventListener('fslightbox:open', (e) => {
  console.log('Lightbox opened', e.detail);
});

// Slide changed
document.addEventListener('fslightbox:change', (e) => {
  console.log('Current slide:', e.detail.currentIndex);
});

// Lightbox closed
document.addEventListener('fslightbox:close', (e) => {
  console.log('Lightbox closed');
});
```

### Custom Integration

```javascript
// Add custom source types
FsLightbox.registerType('custom', {
  open: (source, element) => {
    // Custom open logic
  },
  load: (source) => {
    // Custom load logic
    return customContent;
  }
});

// Add to specific elements
editor.on('component:mount', (component) => {
  if (component.get('type') === 'fslightbox') {
    const el = component.getEl();
    
    // Add custom behavior
    el.addEventListener('click', (e) => {
      // Custom pre-open logic
      if (shouldPreventOpen()) {
        e.preventDefault();
      }
    });
  }
});
```

## Advanced Features

### 1. Lazy Loading

```html
<a data-gjs-type="fslightbox"
   data-fslightbox="lazy-gallery"
   href="large-image.jpg"
   data-sizes="(max-width: 600px) 480px, 800px"
   data-srcset="image-480w.jpg 480w,
                image-800w.jpg 800w,
                image-1200w.jpg 1200w">
  <img src="placeholder.jpg" 
       data-src="thumbnail.jpg"
       alt="Lazy loaded image"
       loading="lazy">
</a>
```

### 2. Custom Captions

```html
<a data-gjs-type="fslightbox"
   data-fslightbox="captioned"
   href="image.jpg"
   data-caption="<h3>Image Title</h3><p>Image description here</p>">
  <img src="thumb.jpg" alt="Image">
</a>

<!-- Or reference external caption -->
<a data-gjs-type="fslightbox"
   data-fslightbox="captioned"
   href="image.jpg"
   data-caption-id="caption-1">
  <img src="thumb.jpg" alt="Image">
</a>

<div id="caption-1" style="display:none;">
  <h3>External Caption</h3>
  <p>This caption is defined elsewhere in the DOM.</p>
</div>
```

### 3. Slideshow Configuration

```javascript
// Auto-play slideshow
const slideshowConfig = {
  type: 'fslightbox',
  attributes: {
    'data-fslightbox': 'slideshow',
    'data-slideshow-time': '3000',
    'data-transition': 'fade'
  }
};

// Initialize with slideshow
editor.on('fslightbox:open', (e) => {
  if (e.detail.gallery === 'slideshow') {
    e.detail.instance.startSlideshow();
  }
});
```

## Performance Optimization

### 1. **Preloading Strategy**

```javascript
// Preload adjacent images
const preloadConfig = {
  preload: 1, // Number of images to preload
  preloadSources: true,
  placeholderSrc: 'data:image/svg+xml,...' // SVG placeholder
};
```

### 2. **Image Optimization**

```html
<!-- Responsive images -->
<a data-gjs-type="fslightbox"
   href="image-2000w.jpg"
   data-responsive-images='[
     {"src": "image-400w.jpg", "width": 400},
     {"src": "image-800w.jpg", "width": 800},
     {"src": "image-1200w.jpg", "width": 1200},
     {"src": "image-2000w.jpg", "width": 2000}
   ]'>
  <img src="thumb.jpg" alt="Responsive image">
</a>
```

### 3. **Memory Management**

```javascript
// Clean up on component unmount
editor.on('component:remove', (component) => {
  if (component.get('type') === 'fslightbox') {
    // Destroy lightbox instance
    const instance = component.get('lightbox-instance');
    if (instance) {
      instance.destroy();
    }
  }
});
```

## Troubleshooting

### Common Issues

1. **Lightbox not opening**
   - Check if FsLightbox script is loaded
   - Verify href attribute is present
   - Check for JavaScript errors

2. **Videos not playing**
   - Ensure correct data-type attribute
   - Verify video URLs are valid
   - Check CORS policies

3. **Gallery grouping issues**
   - Ensure data-fslightbox values match
   - Check for typos in gallery names
   - Verify no duplicate IDs

### Debug Mode

```javascript
plugins: [
  componentFsLightbox.init({
    debug: true,
    onError: (error, source) => {
      console.error('Lightbox error:', error, source);
    }
  })
]
```

## Comparison with LightGallery

| Feature | FsLightbox | LightGallery |
|---------|------------|--------------|
| Size | ~30KB | ~150KB |
| Dependencies | None | Multiple |
| Touch Support | ✅ | ✅ |
| Video Support | ✅ | ✅ |
| Thumbnails | ❌ | ✅ |
| Zoom | ❌ | ✅ |
| Social Share | ❌ | ✅ |
| Plugins | ❌ | ✅ |
| Performance | Excellent | Good |
| Setup Complexity | Simple | Moderate |

## Integration with InvestorPrez

FsLightbox provides a lightweight solution for InvestorPrez:

### Use Cases

1. **Quick Image Viewing**
   - Team photos
   - Product screenshots
   - Office images

2. **Demo Videos**
   - Product demos
   - Pitch videos
   - Testimonials

3. **Document Preview**
   - Inline document viewing
   - Chart enlargement
   - Infographic display

### Example Implementation

```javascript
// Investor deck lightbox
const investorLightbox = {
  tagName: 'div',
  attributes: { class: 'investor-materials' },
  components: [
    {
      type: 'fslightbox',
      attributes: {
        href: 'pitch-deck-slide1.jpg',
        'data-fslightbox': 'pitch-deck',
        'data-caption': 'Company Overview'
      },
      components: [{
        tagName: 'button',
        attributes: { class: 'view-deck-btn' },
        content: 'View Pitch Deck'
      }]
    },
    {
      type: 'fslightbox',
      attributes: {
        href: 'https://youtube.com/watch?v=PITCH_VIDEO',
        'data-fslightbox': 'pitch-deck',
        'data-type': 'youtube',
        'data-caption': '2-Minute Pitch'
      },
      components: [{
        tagName: 'button',
        attributes: { class: 'watch-pitch-btn' },
        content: 'Watch 2-min Pitch'
      }]
    }
  ]
};
```

## Best Practices

### 1. **Accessibility**

```html
<!-- Proper ARIA labels -->
<a data-gjs-type="fslightbox"
   href="image.jpg"
   aria-label="View larger image"
   role="button">
  <img src="thumb.jpg" 
       alt="Descriptive alt text">
</a>
```

### 2. **SEO Friendly**

```html
<!-- Include proper metadata -->
<a data-gjs-type="fslightbox"
   href="image.jpg"
   title="Image Title"
   data-description="Full image description">
  <img src="thumb.jpg" 
       alt="Alt text"
       title="Hover text">
</a>
```

### 3. **Progressive Enhancement**

```html
<!-- Fallback for no JavaScript -->
<a data-gjs-type="fslightbox"
   href="image.jpg"
   target="_blank"
   rel="noopener">
  <img src="thumb.jpg" alt="Click to view">
  <noscript>
    <style>
      [data-fslightbox] { 
        /* Ensure links work without JS */
        pointer-events: auto !important;
      }
    </style>
  </noscript>
</a>
```

## Related Documentation

- [LightGallery](./LightGallery.md) - Full-featured alternative
- [Components Overview](../../03_Configuration/Components/Configuration_Components_Overview.md)
- [Animation](../Animation.md) - Animation effects

## Resources

- [FsLightbox Documentation](https://fslightbox.com/javascript)
- [FsLightbox Examples](https://fslightbox.com/javascript/examples)
- [Performance Best Practices](https://web.dev/fast/)