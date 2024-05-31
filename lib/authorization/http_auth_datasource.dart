import 'dart:convert';

import 'package:i9930_flutter_sdk/authorization/auth_datasource.dart';
import 'package:http/http.dart' as http;
import 'package:i9930_flutter_sdk/env/base_url.dart';
import 'package:i9930_flutter_sdk/env/env.dart';

class HttpAuthDataSource extends AuthDataSource {
  BaseUrl? url;
  String? endpoint;
  //Logger? logger;
  HttpAuthDataSource({this.url, this.endpoint});

  @override
  Future post({required Map requestFields, String? endpoint, String? auth}) async {
    http.Client client = http.Client();
    url ??= I9930Sdk.env!.url!;
    endpoint ??= (this.endpoint ?? "");
    http.Response response = await client.post(
        Uri.parse(url!.getBaseUrl() + endpoint),
        body: jsonEncode(requestFields),
        headers: <String, String>{
          'Content-Type': 'application/json',
          // 'Authorization':
          //      SharedPref.getAccessToken() ?? ""
        });
    var jsonResponse = jsonDecode(response.body);

    // logger ??= ApiLogger(
    //     accessToken: "",
    //     endpoint: endpoint,
    //     request: requestFields.toString(),
    //     response: jsonResponse.toString());

    // logger?.log();
    return jsonResponse;
  }
}
