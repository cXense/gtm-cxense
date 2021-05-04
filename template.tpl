___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Cxense by Piano",
  "brand": {
    "id": "brand_dummy",
    "displayName": "",
    "thumbnail": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAMAAABEpIrGAAAAIGNIUk0AAHomAACAhAAA+gAAAIDoAAB1MAAA6mAAADqYAAAXcJy6UTwAAABaUExURQAAABAYIBAYIBAYIBAYIBAYIBAYIBAYIBAYIBAYIBAYIBAYIBAYIBAYIBAYIBAYIBAYIBAYIBAYIBAYIBAYIBAYIBAYIBAYIBAYIBAYIBAYIBAYIBAYIP///xf/8MAAAAAcdFJOUwAACBQdFU6NutPeb834AUDC/ANf5u9BFsH9zByBKasIAAAAAWJLR0Qd6wNxkQAAAAlwSFlzAAG66gABuuoBwfE59QAAAAd0SU1FB+ELFwsrEiJOX3AAAABPelRYdFJhdyBwcm9maWxlIHR5cGUgaXB0YwAAeJzjyiwoSeZSAAMjCy5jCxMjE0uTFAMTIESANMNkAyOzVCDL2NTIxMzEHMQHy4BIoEouACiVDuMqIm0fAAAAs0lEQVQ4y5WTWRKDIBAFHVAWETdwn/ufM5iYiqVQY/qXrgfMkmV/AMB4nnMGED8thFS6LLWSorg54dhUFg9sZS4K1E3b4YmubeqTAb3zeMG7Hn75bsAbg/veAjB6jODHw4BpxijzBJ8As8SFxbwjYFoxwbpHAAibEqwIEQASk8hdYCotKBYErtOC5kHYyrRQbk8E8grykeQ3qUKRpaabRbabHhhy5OihpceeXhx69R4sb4oXI0VDcdpPfeEAAAAldEVYdGRhdGU6Y3JlYXRlADIwMTctMTEtMjNUMTE6NDM6MTgrMDE6MDAMXydKAAAAJXRFWHRkYXRlOm1vZGlmeQAyMDE3LTExLTIzVDExOjQzOjE4KzAxOjAwfQKf9gAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAAAAASUVORK5CYII\u003d"
  },
  "description": "Configure Cxense services for page view collection and other features.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "LABEL",
    "name": "docs",
    "displayName": "\u003ca href\u003d\"https://docs.piano.io\"\u003eDocumentation\u003c/a\u003e"
  },
  {
    "type": "LABEL",
    "name": "generalOptions",
    "displayName": "\u003cstrong\u003eGeneral options\u003c/strong\u003e"
  },
  {
    "type": "TEXT",
    "name": "siteId",
    "displayName": "Site ID",
    "simpleValueType": true,
    "notSetText": "The site ID is required.",
    "valueValidators": [
      {
        "type": "STRING_LENGTH",
        "args": [
          15,
          30
        ]
      },
      {
        "type": "NON_EMPTY"
      }
    ],
    "help": "Supply a site ID. This is a required field."
  },
  {
    "type": "CHECKBOX",
    "name": "pageView",
    "checkboxText": "Run a page view event?",
    "simpleValueType": true,
    "defaultValue": true,
    "help": "Execute a page view. It is recommended to do this for every page in normal cases. Turn this off if there is a specific need to not track page views."
  },
  {
    "type": "CHECKBOX",
    "name": "thirdPartyIds",
    "checkboxText": "Use third party IDs?",
    "simpleValueType": true,
    "defaultValue": true,
    "help": "Turn off if you do not need to do cross-site tracking. If turned off, no third-party IDs will be set on cxense.com and first-page views will be slightly faster."
  },
  {
    "type": "CHECKBOX",
    "name": "tcf20",
    "checkboxText": "Use TCF 2.0 consents?",
    "simpleValueType": true,
    "help": "If you have a TCF 2.0 compatible CMP, then cx.js can interact with it, with this option turned on. When this option is selected, the `Turn on consent feature?` option will be also turned on, regardless of what is set in that option."
  },
  {
    "type": "CHECKBOX",
    "name": "consent",
    "checkboxText": "Turn on consent feature?",
    "simpleValueType": true,
    "help": "Turn on GDPR features.",
    "enablingConditions": [
      {
        "paramName": "tcf20",
        "paramValue": true,
        "type": "NOT_EQUALS"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "featureConfiguration",
    "displayName": "Feature configuration",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "PARAM_TABLE",
        "name": "externalIds",
        "displayName": "External IDs",
        "paramTableColumns": [
          {
            "param": {
              "type": "TEXT",
              "name": "type",
              "displayName": "Type",
              "simpleValueType": true
            },
            "isUnique": false
          },
          {
            "param": {
              "type": "TEXT",
              "name": "id",
              "displayName": "ID",
              "simpleValueType": true
            },
            "isUnique": false
          }
        ],
        "help": "",
        "newRowButtonText": "New external ID",
        "editRowTitle": "Edit external ID",
        "newRowTitle": "New external ID"
      },
      {
        "type": "PARAM_TABLE",
        "name": "customParameters",
        "displayName": "Custom parameters",
        "paramTableColumns": [
          {
            "param": {
              "type": "TEXT",
              "name": "name",
              "displayName": "Name",
              "simpleValueType": true
            },
            "isUnique": true
          },
          {
            "param": {
              "type": "TEXT",
              "name": "value",
              "displayName": "Value",
              "simpleValueType": true
            },
            "isUnique": false
          }
        ],
        "editRowTitle": "Edit custom parameter",
        "newRowButtonText": "New custom parameter",
        "newRowTitle": "New custom parameter"
      },
      {
        "type": "PARAM_TABLE",
        "name": "segments",
        "displayName": "Segment ID lookups",
        "paramTableColumns": [
          {
            "param": {
              "type": "TEXT",
              "name": "persistedQueryId",
              "displayName": "Persisted query ID",
              "simpleValueType": true
            },
            "isUnique": true
          }
        ],
        "editRowTitle": "Edit segment ID lookup",
        "newRowButtonText": "New segment ID lookup",
        "newRowTitle": "New segment ID lookup"
      },
      {
        "type": "PARAM_TABLE",
        "name": "cookieSyncs",
        "displayName": "Cookie syncs",
        "paramTableColumns": [
          {
            "param": {
              "type": "TEXT",
              "name": "partner",
              "displayName": "Partner",
              "simpleValueType": true
            },
            "isUnique": true
          },
          {
            "param": {
              "type": "TEXT",
              "name": "customerId",
              "displayName": "Customer ID",
              "simpleValueType": true,
              "canBeEmptyString": false
            },
            "isUnique": false
          },
          {
            "param": {
              "type": "TEXT",
              "name": "params",
              "displayName": "Parameters",
              "simpleValueType": true,
              "canBeEmptyString": false,
              "help": "Supply JSON parameters for the related ad provider."
            },
            "isUnique": false
          }
        ],
        "editRowTitle": "Edit cookie sync",
        "newRowButtonText": "New cookie sync",
        "newRowTitle": "New cookie sync"
      },
      {
        "type": "GROUP",
        "name": "eventAttributes",
        "displayName": "Custom event attributes",
        "groupStyle": "ZIPPY_OPEN",
        "subParams": [
          {
            "type": "TEXT",
            "name": "origin",
            "displayName": "Origin",
            "simpleValueType": true,
            "help": "Supply an origin with your assigned prefix. Ex: abc-cce"
          },
          {
            "type": "TEXT",
            "name": "eventPersistedQueryId",
            "displayName": "Persisted query ID",
            "simpleValueType": true,
            "help": "Supply a persisted query ID. Not required.",
            "canBeEmptyString": false
          }
        ],
        "help": "Set event attributes for custom events."
      }
    ],
    "help": "Set custom parameters, external IDs, cookie syncs and segment ID lookups"
  },
  {
    "type": "GROUP",
    "name": "misc",
    "displayName": "Miscellaneous options",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "TEXT",
        "name": "randomId",
        "displayName": "Random ID",
        "simpleValueType": true,
        "help": "Only set this if you need a random identifier for page views earlier than when cx.js loads (for example: having it for early ad impressions before.) This will bind the page view and subsequent events early on."
      },
      {
        "type": "TEXT",
        "name": "compat",
        "displayName": "Tinypass compatibility mode",
        "simpleValueType": true,
        "help": "Set parameters as JSON to work with tinypass.js properly. For example: `{ c1x: { wait: 3000 } }`"
      },
      {
        "type": "CHECKBOX",
        "name": "activityEvents",
        "checkboxText": "Turn on activity events?",
        "simpleValueType": true,
        "defaultValue": false
      }
    ],
    "help": "Advanced options for controlling the cx.js script"
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const JSON = require('JSON');
const log = require('logToConsole');
const queryPermission = require('queryPermission');
const injectScript = require('injectScript');
const setInWindow = require('setInWindow');

function cookieSyncs() {
  if (typeof data.cookieSyncs === "undefined") return undefined;
  
  return data.cookieSyncs.map(sync => {
    if (sync.params == "") { return sync.partner; }
    
    sync.params = JSON.parse(sync.params);
    return sync;
  });
}

function externalIds() {
  if (typeof data.externalIds === "undefined") return undefined;
  
  return data.externalIds.map(idType => 
                              ({type: idType.type, id: '' + idType.id}));
}

var cX = { options: {
  siteId: data.siteId,
  pageView: data.pageView,
  customParameters: data.customParameters,
  externalIds: externalIds(),
  cookieSyncs: cookieSyncs(),
  customEventAttributes: { origin: data.origin, persistedQueryId: data.eventPersistedQueryId },
  activityEvents: data.activityEvents
}, callQueue: [] };

if (data.compat) {
   cX.options.compat = JSON.parse(data.compat);
}


if (queryPermission('access_globals', 'readwrite', 'cX')) {
  setInWindow("cX", cX, true);
}

log(data);
const url = "https://cdn.cxense.com/cx.js";
injectScript(url, data.gtmOnSuccess, data.gtmOnFailure, url);


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://cdn.cxense.com/cx.js"
              },
              {
                "type": 1,
                "string": "https://cdn.cxense.com/cx.cce.js"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "cX"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 5/4/2021, 3:06:24 PM


