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
  "displayName": "Cxense",
  "brand": {
    "id": "brand_dummy",
    "displayName": ""
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
    "name": "generalOptions",
    "displayName": "General Options"
  },
  {
    "type": "TEXT",
    "name": "siteId",
    "displayName": "Site ID",
    "simpleValueType": true,
    "notSetText": "The site ID is required.",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      },
      {
        "type": "STRING_LENGTH",
        "args": [
          19
        ]
      }
    ]
  },
  {
    "type": "CHECKBOX",
    "name": "pageView",
    "checkboxText": "Run a page view event?",
    "simpleValueType": true,
    "defaultValue": true
  },
  {
    "type": "CHECKBOX",
    "name": "thirdPartyIds",
    "checkboxText": "Use Third Party IDs?",
    "simpleValueType": true,
    "defaultValue": true
  },
  {
    "type": "CHECKBOX",
    "name": "tcf20",
    "checkboxText": "Use TCF 2.0 Consents?",
    "simpleValueType": true
  },
  {
    "type": "CHECKBOX",
    "name": "consent",
    "checkboxText": "Turn On Consent Feature?",
    "simpleValueType": true
  },
  {
    "type": "LABEL",
    "name": "userProvidedInformation",
    "displayName": "User-Provided Information For Page Views"
  },
  {
    "type": "PARAM_TABLE",
    "name": "customParameters",
    "displayName": "Custom Parameters",
    "paramTableColumns": [
      {
        "param": {
          "type": "TEXT",
          "name": "name",
          "displayName": "Name",
          "simpleValueType": true
        },
        "isUnique": false
      },
      {
        "param": {
          "type": "TEXT",
          "name": "value",
          "displayName": "Value",
          "simpleValueType": true
        },
        "isUnique": true
      }
    ]
  },
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
    ]
  },
  {
    "type": "SIMPLE_TABLE",
    "name": "segments",
    "displayName": "Segments",
    "simpleTableColumns": [
      {
        "defaultValue": "",
        "displayName": "Persisted Query ID",
        "name": "persistedQueryId",
        "type": "TEXT"
      },
      {
        "defaultValue": "",
        "displayName": "Segment callback",
        "name": "callback",
        "type": "TEXT"
      }
    ]
  },
  {
    "type": "SIMPLE_TABLE",
    "name": "cookieSyncs",
    "displayName": "Cookie Syncs",
    "simpleTableColumns": [
      {
        "defaultValue": "",
        "displayName": "Partner",
        "name": "partner",
        "type": "TEXT"
      },
      {
        "defaultValue": "",
        "displayName": "Customer ID",
        "name": "customerId",
        "type": "TEXT"
      },
      {
        "defaultValue": "",
        "displayName": "Parameters",
        "name": "params",
        "type": "TEXT"
      }
    ]
  },
  {
    "type": "LABEL",
    "name": "advanced",
    "displayName": "Advanced Configuration"
  },
  {
    "type": "TEXT",
    "name": "randomId",
    "displayName": "Random ID",
    "simpleValueType": true,
    "defaultValue": "{{Random Number}}"
  },
  {
    "type": "TEXT",
    "name": "compat",
    "displayName": "Tinypass Compatibility Parameters",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "cxjsUrl",
    "displayName": "Custom cx.js URL",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "REGEX",
        "args": [
          "/((([A-Za-z]{3,9}:(?:\\/\\/)?)(?:[\\-;:\u0026\u003d\\+\\$,\\w]+@)?[A-Za-z0-9\\.\\-]+|(?:www\\.|[\\-;:\u0026\u003d\\+\\$,\\w]+@)[A-Za-z0-9\\.\\-]+)((?:\\/[\\+~%\\/\\.\\w\\-_]*)?\\??(?:[\\-\\+\u003d\u0026;%@\\.\\w_]*)#?(?:[\\.\\!\\/\\\\\\w]*))?)/"
        ],
        "errorMessage": "Not a valid URL"
      }
    ],
    "canBeEmptyString": true
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
  cookieSyncs: cookieSyncs()
}, callQueue: [] };


if (queryPermission('access_globals', 'readwrite', 'cX')) {
  setInWindow("cX", cX, true);
}

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

Created on 5/4/2021, 10:41:13 AM


