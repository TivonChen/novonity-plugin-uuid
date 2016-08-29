var exec = require('cordova/exec');

module.exports = {

  get: function(success, fail) {
    exec(success, fail, 'GetUuid', 'get', []);
  }

};
