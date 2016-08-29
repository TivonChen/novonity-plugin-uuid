# novonity-plugin-uuid
Cordova plugin for get uuid

# Installation

`$ ionic plugin add novonity-plugin-uuid`

# How to use

call the function below directly

`getUuid.get(function(uuid) {
  var myUuid = uuid;
})`

or in typescript

`Uuid.get().then(data => {
	var myUuid = data;
})`

See [Ionic-native development](https://github.com/driftyco/ionic-native/blob/master/DEVELOPER.md) for more information.
