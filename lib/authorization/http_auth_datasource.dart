import 'dart:convert';

import 'package:i9930_flutter_sdk/authorization/auth_datasource.dart';
import 'package:http/http.dart' as http;

import '../env/base_url.dart';

class HttpAuthDataSource extends AuthDataSource {
  final BaseUrl url;
  final String endpoint;
  //Logger? logger;
  HttpAuthDataSource(
      {required this.url, required this.endpoint/*, this.logger*/});

  @override
  Future post({required Map requestFields, String? endpoint}) async {
    http.Client client = http.Client();
    http.Response response = await client.post(
        Uri.parse(url.getBaseUrl() + endpoint!),
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
