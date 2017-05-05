var exec = require('cordova/exec');

var umengclick = {

    clickEvent:function(eventId,eventName) {
        exec(null, null, "UMengClick", "clickEvent", [{"eventId":eventId,"eventName":eventName}]);
    }
};

module.exports = umengclick;

