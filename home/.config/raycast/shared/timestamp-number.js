#!/Users/benedictong/.asdf/installs/nodejs/18.1.0/bin/node

// Required parameters:
// @raycast.schemaVersion 1
// @raycast.title Timestamp as number
// @raycast.mode inline
// @raycast.refreshTime 1s
//
// Optional parameters:
// @raycast.icon ⏱
// @raycast.packageName Developer Utilities

const timestamp = new Date().getTime();
console.log(timestamp);
