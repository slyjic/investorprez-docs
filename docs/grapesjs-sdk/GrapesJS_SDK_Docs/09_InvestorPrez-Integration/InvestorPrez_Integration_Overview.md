# InvestorPrez Integration Guide

*Last Updated: July 31, 2025*  
*Status: Current - v1.10.18*  
*Integration-Specific Documentation*

This guide provides comprehensive documentation for implementing GrapesJS Studio SDK specifically in the InvestorPrez React application with proper multi-presentation isolation.

## 🎯 InvestorPrez-Specific Requirements

InvestorPrez has unique requirements that differ from standard GrapesJS implementations:

1. **Multi-Presentation Isolation**: Each presentation must be completely isolated
2. **React Integration**: Specific React 18.3.1 compatibility requirements
3. **Custom Storage**: Disabled storage to prevent cross-presentation contamination
4. **Presentation-Specific Styling**: Global styles scoped to individual presentations
5. **Auto-Save Integration**: Custom debounced auto-save functionality

## 🔧 Critical Implementation Details

### 1. Project Isolation Pattern

Each presentation must have a **unique project ID** to ensure complete isolation:

```javascript
project: {
  id: `presentation-${presentationId}`, // Critical for isolation
  type: 'web',
  default: projectData
}
```

**Why This Matters:**
- Prevents style bleeding between presentations
- Ensures component state isolation
- Enables proper auto-save functionality
- Required for proper editor cleanup

### 2. Storage Management

**Always disable storage** to prevent cross-presentation contamination:

```javascript
storageManager: {
  type: 'none' // Prevents data leakage between presentations
}
```

**Why This is Critical:**
- InvestorPrez uses custom auto-save via API
- Browser storage would cause presentation data mixing
- Ensures each presentation loads fresh
- Prevents phantom content from previous presentations

### 3. Global Styles Configuration

Global styles must use **presentation-specific IDs**:

```javascript
globalStyles: {
  default: [
    {
      id: `${presentationId}_primaryColor`, // Unique per presentation
      property: 'color',
      field: 'color',
      defaultValue: '#667eea',
      selector: '.primary-color',
      label: 'Primary',
      category: { id: 'colours', label: 'Colours', open: true }
    },
    {
      id: `${presentationId}_secondaryColor`,
      property: 'color',
      field: 'color',
      defaultValue: '#f093fb',
      selector: '.secondary-color',
      label: 'Secondary',
      category: { id: 'colours', label: 'Colours', open: true }
    }
  ]
}
```

**InvestorPrez Color System:**
- **Colours**: Primary, Secondary, Accent colors
- **Body**: Font family, size, color, line height
- **Headings**: H1-H6 styling
- **Subheadings**: Secondary heading styles

### 4. React Component Lifecycle

Use **stable keys** per presentation to prevent unnecessary remounts:

```javascript
<StudioEditor 
  key={presentation.id} // Stable key - only changes when presentation changes
  options={{...}}
/>
```

**Critical React Requirements:**
- React version 18.3.1 (not 19+)
- Stable keys prevent editor reinitialization
- Proper useEffect dependencies
- Error boundaries for crash protection

## 🏗️ InvestorPrez Layout Configuration

Enable Style Catalogue with InvestorPrez-specific panel structure:

```javascript
layout: {
  default: {
    type: 'row',
    children: [
      { type: 'column', width: '240px', children: [{ type: 'panelBlocks' }] },
      { type: 'column', children: [{ type: 'canvas' }] },
      {
        type: 'column',
        width: '300px',
        children: [
          {
            type: 'panelSelectors',
            styleCatalog: true,    // Enable Style Catalogue
            stateSelector: true,
          },
          { type: 'panelStyles' }
        ]
      }
    ]
  }
}
```

## 🔄 Data Management Best Practices

### Project Data Structure

```javascript
const createProjectData = (presentation) => ({
  pages: JSON.parse(JSON.stringify(pages)), // Deep clone
  assets: [],
  styles: [],
  components: []
});
```

### Auto-Save Integration

```javascript
// InvestorPrez auto-save pattern
const debouncedSave = useMemo(
  () => debounce(async (editorData) => {
    await savePresentation(presentation.id, editorData);
  }, 2000),
  [presentation.id]
);

useEffect(() => {
  if (editor) {
    editor.on('storage:end', () => {
      const data = editor.getProjectData();
      debouncedSave(data);
    });
  }
}, [editor, debouncedSave]);
```

## 🚨 Common InvestorPrez Issues and Solutions

### Issue 1: Repeated Initialization Cycles
**Symptoms**: Editor keeps remounting/unmounting
**Cause**: Unstable React keys or improper useEffect dependencies
**Solution**: Use stable keys and proper dependency arrays

```javascript
// ❌ Wrong - causes reinitialization
<StudioEditor key={Math.random()} />

// ✅ Correct - stable key
<StudioEditor key={presentation.id} />
```

### Issue 2: Content/Styles Carrying Over Between Presentations
**Symptoms**: Previous presentation content appears in new presentations
**Cause**: Shared storage or non-unique project IDs
**Solution**: Disable storage and use unique project IDs

```javascript
// ✅ Correct configuration
storageManager: { type: 'none' },
project: { id: `presentation-${presentationId}` }
```

### Issue 3: Style Catalogue Crashes
**Symptoms**: Editor crashes when opening style catalogue
**Cause**: React 19 compatibility issues
**Solution**: Use React 18.3.1 and proper layout configuration

### Issue 4: Auto-Save Conflicts
**Symptoms**: Save conflicts or data loss
**Cause**: Multiple save operations firing simultaneously
**Solution**: Proper debouncing and conflict resolution

## 📋 InvestorPrez Implementation Checklist

### Required Configuration
- [ ] React version 18.3.1 (not 19+)
- [ ] Unique project ID per presentation (`presentation-${presentationId}`)
- [ ] Storage type set to 'none'
- [ ] Global styles with presentation-specific IDs
- [ ] Stable React keys for StudioEditor component
- [ ] Proper useEffect dependencies
- [ ] Deep cloning of project data
- [ ] Style Catalogue enabled in layout
- [ ] Auto-save with debouncing (2000ms)
- [ ] Error boundaries for crash protection

### InvestorPrez Features
- [ ] Custom blocks integration
- [ ] Typography presets system
- [ ] Color system integration
- [ ] Asset upload integration
- [ ] Publishing workflow integration
- [ ] Comment system integration (v1.10.x)

## 🔍 Troubleshooting InvestorPrez Integration

### Debug Steps
1. Check React version compatibility (`npm list react`)
2. Verify project IDs are unique (check console logs)
3. Ensure storage is disabled (no localStorage entries)
4. Validate global style IDs include presentation ID
5. Check for console errors during editor initialization
6. Monitor component mounting/unmounting patterns

### Common Error Messages

**"'run' called with illegal receiver"**
- **Cause**: React 19 compatibility issue
- **Solution**: Downgrade to React 18.3.1

**"StorageManager.clear is not a function"**
- **Cause**: Storage configuration issue
- **Solution**: Set `storageManager: { type: 'none' }`

**Repeated mounting/unmounting in console**
- **Cause**: Unstable React keys
- **Solution**: Use stable key pattern `key={presentation.id}`

**Auto-save conflicts**
- **Cause**: Multiple save operations
- **Solution**: Implement proper debouncing and conflict resolution

## 🔗 Integration with InvestorPrez Features

### Typography System
```javascript
// Integration with InvestorPrez typography presets
const typographyPresets = {
  professional: { /* preset config */ },
  modern: { /* preset config */ },
  creative: { /* preset config */ }
};
```

### Asset Management
```javascript
// Integration with Vercel Blob storage
const assetUpload = async (file) => {
  const response = await uploadToVercelBlob(file);
  return response.url;
};
```

### Comment System (v1.10.x)
```javascript
// Integration with slide-specific commenting
const commentIntegration = {
  onCommentAdd: (slideId, comment) => {
    // Handle comment addition
  },
  onCommentResolve: (commentId) => {
    // Handle comment resolution
  }
};
```

## 📚 Related Documentation

- [Configuration Overview](../03_Configuration/Configuration_Overview.md)
- [React Renderer](../07_Custom-Renderer/React-renderer.md)
- [Global Styles](../03_Configuration/Configuration_Global-Styles.md)
- [Project Types](../02_Project-Types/Project-Types_Web.md)

---

*This integration guide is specific to InvestorPrez implementation patterns and requirements. For general GrapesJS SDK documentation, refer to the main documentation sections.*