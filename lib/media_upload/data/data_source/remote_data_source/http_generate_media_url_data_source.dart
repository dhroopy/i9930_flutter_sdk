import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../../../env/base_url.dart';
import '../../../../logger/logger.dart';
import 'media_upload_data_source.dart';

class HttpGenerateMediaUrlDataSource extends MediaUploadRemoteDataSource {
  final BaseUrl url;
  final String endpoint;
  Logger? logger;
  HttpGenerateMediaUrlDataSource(
      {required this.url, required this.endpoint, this.logger});

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

    logger ??= ApiLogger(
        accessToken: "",
        endpoint: endpoint,
        request: requestFields.toString(),
        response: jsonResponse.toString());

    logger?.log();
    return jsonResponse;
  }
}
