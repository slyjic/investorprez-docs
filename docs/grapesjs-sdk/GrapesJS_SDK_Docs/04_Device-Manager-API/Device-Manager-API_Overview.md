# Device Manager API

*Last Updated: August 12, 2025*
*Status: Current - GrapesJS SDK Reference Documentation*

The Device Manager allows you to manage different device breakpoints for responsive design in your GrapesJS editor. You can customize device configurations, add new devices, and switch between them to preview your content across different screen sizes.

## Table of Contents

- [Configuration](#configuration)
- [API Usage](#api-usage)
- [Available Events](#available-events)
- [Methods](#methods)
  - [add](#add)
  - [get](#get)
  - [getDevices](#getdevices)
  - [remove](#remove)
  - [select](#select)
  - [getSelected](#getselected)

## Configuration

You can customize the initial state of the module from the editor initialization, by passing the following Configuration Object:

```javascript
const editor = grapesjs.init({
  deviceManager: {
    // options
  }
})
```

## API Usage

Once the editor is instantiated you can use its API. Before using these methods you should get the module from the instance:

```javascript
const deviceManager = editor.Devices;
```

## Available Events

- `device:add` - Added new device. The Device is passed as an argument to the callback
- `device:remove` - Device removed. The Device is passed as an argument to the callback
- `device:select` - New device selected. The newly selected Device and the previous one, are passed as arguments to the callback
- `device:update` - Device updated. The updated Device and the object containing changes are passed as arguments to the callback
- `device` - Catch-all event for all the events mentioned above. An object containing all the available data about the triggered event is passed as an argument to the callback

## Methods

### add

Add new device

**Parameters:**
- `props` (Object) - Device properties
- `options` (Record<string, any>) - Optional configuration (default: {})

**Examples:**
```javascript
const device1 = deviceManager.add({
  // Without an explicit ID, the `name` will be taken. In case of missing `name`, a random ID will be created.
  id: 'tablet',
  name: 'Tablet',
  width: '900px', // This width will be applied on the canvas frame and for the CSS media
});

const device2 = deviceManager.add({
  id: 'tablet2',
  name: 'Tablet 2',
  width: '800px', // This width will be applied on the canvas frame
  widthMedia: '810px', // This width that will be used for the CSS media
  height: '600px', // Height will be applied on the canvas frame
});
```

**Returns:** Device - Added device

### get

Return device by ID

**Parameters:**
- `id` (String) - ID of the device

**Examples:**
```javascript
const device = deviceManager.get('Tablet');
console.log(JSON.stringify(device));
// {name: 'Tablet', width: '900px'}
```

**Returns:** Device | null

### getDevices

Return all devices

**Examples:**
```javascript
const devices = deviceManager.getDevices();
console.log(JSON.stringify(devices));
// [{name: 'Desktop', width: ''}, ...]
```

**Returns:** Array<Device>

### remove

Remove device

**Parameters:**
- `device` (String | Device) - Device or device id
- `opts` (optional, default: {})

**Examples:**
```javascript
const removed = deviceManager.remove('device-id');
// or by passing the Device
const device = deviceManager.get('device-id');
deviceManager.remove(device);
```

**Returns:** Device - Removed device

### select

Change the selected device. This will update the frame in the canvas

**Parameters:**
- `device` (String | Device) - Device or device id
- `opts` (optional, default: {})

**Examples:**
```javascript
deviceManager.select('some-id');
// or by passing the device
const device = deviceManager.get('some-id');
deviceManager.select(device);
```

### getSelected

Get the selected device

**Examples:**
```javascript
const selected = deviceManager.getSelected();
```

**Returns:** Device

---

## Related Documentation

- **[Layout Configuration](../03_Configuration/Layout/Configuration_Layout_Overview.md)** - Configure editor layout and interface
- **[Project Configuration](../03_Configuration/Configuration_Projects.md)** - Overall project setup
- **[Global Styles](../03_Configuration/Configuration_Global-Styles.md)** - Responsive styling across devices