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
declare var getUuid: any;
let myUuid = getUuid.uuid;
```

# Notice
This plugin add NSAppTransportSecurity and CFBundleDisplayName features in ios platform by default.
Please remove them if no use.
