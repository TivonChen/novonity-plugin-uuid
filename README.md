# novonity-plugin-uuid
Cordova plugin for get uuid

# Installation

```bash
$ ionic plugin add novonity-plugin-uuid
```

# How to use

Call the function below directly when using ionic1

```javascript
var myUuid = getUuid.uuid;
```

or in typescript when using ionic2

```typescript
import {Uuid} from 'ionic-native';
let myUuid = Uuid.getUuid.uuid;
```

 And the definition of Uuid as below:
 
 ```typescript
 @Plugin({
  plugin: 'novonity-plugin-uuid',
  pluginRef: 'getUuid',
  repo: 'https://github.com/TivonChen/novonity-plugin-uuid.git',
  platforms: ['Android', 'iOS']
})
export class Uuid {
  @CordovaProperty
  static get getUuid() { return window['getUuid']; }
}
```

See [Ionic-native development](https://github.com/driftyco/ionic-native/blob/master/DEVELOPER.md) for more information.

# Notice
This plugin add NSAppTransportSecurity and CFBundleDisplayName features in ios platform by default.
Please remove them if no use.
