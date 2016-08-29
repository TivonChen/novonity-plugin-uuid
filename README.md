# novonity-plugin-uuid
Cordova plugin for get uuid

# Installation

`$ ionic plugin add novonity-plugin-uuid`

# How to use

Call the function below directly when using ionic1

`getUuid.get(function(uuid) {
  var myUuid = uuid;
})`

or in typescript when using ionic2

`Uuid.get().then(data => {
	var myUuid = data;
})`

See [Ionic-native development](https://github.com/driftyco/ionic-native/blob/master/DEVELOPER.md) for more information.

# Notice
This plugin add NSAppTransportSecurity and CFBundleDisplayName features in ios platform by default.
Please remove them if no use.