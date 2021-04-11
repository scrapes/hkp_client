library hkp_client;

import 'package:http/http.dart' as http;

class HkpClient {
  /// API URL
  String __url;

  /// Constructor
  HkpClient(String url) {
    this.__url = url;

    //remove last slash from Url
    if (__url[__url.length - 1] == r'/') {
      __url = __url.substring(0, __url.length - 1);
    }
  }

  /// Helper Function
  Future<String> __getResponseBody(http.Response response) async {
    if (response.statusCode == 200) {
      return response.body;
    }
    throw Error;
  }

  /// get Key from Server
  /// can be Fingerprint, ID, Email
  Future<String> getKey(String info,
      {Map<String, String> query = const {'op': 'get', 'options': 'options'}}) {
    Map<String, String> queryMap = {
      'search': info.replaceAll(new RegExp(r"\s+\b|\b\s"), '')
    };
    queryMap.addAll(query);
    Uri requesturl = Uri.parse(__url);
    if (requesturl.scheme == "http") {
      requesturl = Uri.http(requesturl.host, "/pks/lookup", queryMap);
    } else {
      requesturl = Uri.https(requesturl.host, "/pks/lookup", queryMap);
    }

    return http.get(requesturl).then(__getResponseBody);
  }

  /// Add key to Server
  /// Key must be armoured
  Future<String> addKey(String armouredKey) {
    armouredKey = Uri.encodeFull(armouredKey);
    Uri requesturl = Uri.parse(__url + '/pks/add');
    return http.post(requesturl,
        body: {"keytext": armouredKey}).then((res) => res.body);
  }
}
