# GrapesJS Device Manager

_Last Updated: August 12, 2025_  
_Status: Current - GrapesJS SDK Reference Documentation_

## [#](#devices) Devices

You can customize the initial state of the module from the editor initialization, by passing the following [Configuration Object (opens new window)](https://github.com/GrapesJS/grapesjs/blob/master/src/device_manager/config/config.ts)

    const editor = grapesjs.init({
     deviceManager: {
       // options
     }
    })

Once the editor is instantiated you can use its API. Before using these methods you should get the module from the instance

    const deviceManager = editor.Devices;

## [#](#available-events) Available Events

- `device:add` - Added new device. The [Device](/docs/api/device.html) is passed as an argument to the callback
- `device:remove` - Device removed. The [Device](/docs/api/device.html) is passed as an argument to the callback
- `device:select` - New device selected. The newly selected [Device](/docs/api/device.html) and the previous one, are passed as arguments to the callback
- `device:update` - Device updated. The updated [Device](/docs/api/device.html) and the object containing changes are passed as arguments to the callback
- `device` - Catch-all event for all the events mentioned above. An object containing all the available data about the triggered event is passed as an argument to the callback

## [#](#methods) Methods

- [add](#add)
- [get](#get)
- [getDevices](#getdevices)
- [remove](#remove)
- [select](#select)
- [getSelected](#getselected)

## [#](#add) add

Add new device

### [#](#parameters) Parameters

- `props` **[Object (opens new window)](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Object)** Device properties
- `options` **Record<[string (opens new window)](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/String), any>** (optional, default `{}`)

### [#](#examples) Examples

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

Returns **[Device](/docs/api/device.html)** Added device

## [#](#get) get

Return device by ID

### [#](#parameters-2) Parameters

- `id` **[String (opens new window)](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/String)** ID of the device

### [#](#examples-2) Examples

    const device = deviceManager.get('Tablet');
    console.log(JSON.stringify(device));
    // {name: 'Tablet', width: '900px'}

Returns **([Device](/docs/api/device.html) | null)**

## [#](#remove) remove

Remove device

### [#](#parameters-3) Parameters

- `device` **([String (opens new window)](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/String) | [Device](/docs/api/device.html))** Device or device id
- `opts` (optional, default `{}`)

### [#](#examples-3) Examples

    const removed = deviceManager.remove('device-id');
    // or by passing the Device
    const device = deviceManager.get('device-id');
    deviceManager.remove(device);

Returns **[Device](/docs/api/device.html)** Removed device

## [#](#getdevices) getDevices

Return all devices

### [#](#examples-4) Examples

    const devices = deviceManager.getDevices();
    console.log(JSON.stringify(devices));
    // [{name: 'Desktop', width: ''}, ...]

Returns **[Array (opens new window)](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Array)<[Device](/docs/api/device.html)\>**

## [#](#select) select

Change the selected device. This will update the frame in the canvas

### [#](#parameters-4) Parameters

- `device` **([String (opens new window)](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/String) | [Device](/docs/api/device.html))** Device or device id
- `opts` (optional, default `{}`)

### [#](#examples-5) Examples

    deviceManager.select('some-id');
    // or by passing the page
    const device = deviceManager.get('some-id');
    deviceManager.select(device);

## [#](#getselected) getSelected

Get the selected device

### [#](#examples-6) Examples

    const selected = deviceManager.getSelected();

Returns **[Device](/docs/api/device.html)**
