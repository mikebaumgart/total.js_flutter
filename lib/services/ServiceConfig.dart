// service_config.dart


class ServiceConfig {
  static const Map<String, Map<String, String>> config = {
    "OpenLogger": {
      "EndPoint": "https://totaljs.com/openlogger",
      "ApiKey": "<your-openlogger-token>"
    },
    "OpenTemplates": {
      "EndPoint": "https://totaljs.com/opentemplates",
      "ApiKey": "<your-opentemplates-token>"
    },
    "OpenMail": {
      "EndPoint": "https://totaljs.com/openmail",
      "ApiKey": "<your-openmail-token>"
    }
  };
}


/*
// instead writing this
const String openLoggerUrl = 'https://log.unitedshare.app/';
const String openLoggerToken = '0qvdmox7nrica8ytt7fdu6o857fqot';

// we use this style
String openLoggerEndPoint = ServiceConfig.config["OpenLogger"]["EndPoint"];
String openLoggerApiKey = ServiceConfig.config["OpenLogger"]["ApiKey"];

// Wishlist ToDo
// TODO: Write GLOBAL Like Function
*/