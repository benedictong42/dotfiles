#!/usr/local/opt/node@14/bin/node

// Required parameters:
// @raycast.schemaVersion 1
// @raycast.title Decode timestamp to date
// @raycast.mode fullOutput
//
// Optional parameters:
// @raycast.icon 🗓️
// @raycast.packageName Developer Utilities
// @raycast.argument1 { "type": "text", "placeholder": "timestamp" }
// @raycast.argument2 { "type": "text", "placeholder": "tz", "optional": true }

const [timestamp, timeZone] = process.argv.slice(2);

try {
  const date = new Date(timestamp);
  const dateString = date.toLocaleString("en-US", {
    timeZone: timeZone || "Australia/Melbourne",
    dateStyle: "full",
    timeStyle: "long",
  });
  console.log(dateString);
} catch (error) {
  console.log(error.message);
  process.exit(1);
}
