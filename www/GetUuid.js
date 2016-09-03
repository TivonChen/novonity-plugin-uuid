var argscheck = require('cordova/argscheck'),
  channel = require('cordova/channel'),
  utils = require('cordova/utils'),
  exec = require('cordova/exec'),
  cordova = require('cordova');

function Uuid() {
  this.uuid = null;
  var me = this;
  channel.onCordovaReady.subscribe(function () {
    me.getInfo(function (info) {
      me.uuid = info;
      channel.onCordovaInfoReady.fire();
    }, function (e) {
      utils.alert("[ERROR] Error initializing Cordova: " + e);
    });
  });
}

Uuid.prototype.getInfo = function (successCallback, errorCallback) {
  argscheck.checkArgs('fF', 'Uuid.getInfo', arguments);
  exec(successCallback, errorCallback, "GetUuid", "get", []);
};

module.exports = new Uuid(); 