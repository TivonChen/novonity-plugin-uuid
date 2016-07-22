var argscheck = require('cordova/argscheck'),
  cordova = require('cordova'),
    exec = require('cordova/exec');

var GetUuid = function() {

};

GetUuid.prototype.getuuid = function(successCallback, errorCallback) {
  argscheck.checkArgs('fF', 'GetUuid.getuuid', arguments);
  exec(successCallback, errorCallback, "GetUuid", "getuuid", []);
};

var getUuid = new GetUuid();

module.exports = getUuid;
