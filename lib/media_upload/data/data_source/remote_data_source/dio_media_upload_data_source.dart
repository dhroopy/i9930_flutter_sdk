// ignore_for_file: depend_on_referenced_packages

import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';
import 'package:http_parser/http_parser.dart' show MediaType;
import '../../../../env/base_url.dart';
import '../../../../logger/logger.dart';
import 'media_upload_data_source.dart';

class DioMediaUploadRemoteDataSource extends MediaUploadRemoteDataSource {
  final BaseUrl url;
  final String endpoint;
  Logger? logger;
  DioMediaUploadRemoteDataSource({required this.url, required this.endpoint,  this.logger});
  @override
  Future post({required Map requestFields, String? endpoint}) async {
    debugPrint("Here in post dio");
    final dioRequest = dio.Dio();
    final baseUrl =
        url.getBaseUrl() + endpoint!;
    dioRequest.options.baseUrl = baseUrl;

    dynamic formData;
    if (requestFields["data"] != null) {
      formData = dio.FormData.fromMap(
          //(requestFields["data"] as Map<String, dynamic>)
          (requestFields["data"] as Map<dynamic, dynamic>)
              .cast<String, dynamic>());
    } else {
      formData = dio.FormData();
    }

    var file = await dio.MultipartFile.fromFile(
      requestFields["path"],
      filename: requestFields["path"].toString().split("/").last,
      contentType:
          MediaType("file", requestFields["path"].toString().split("/").last),
    );

    formData.files.add(MapEntry('file', file));

    dio.Response response = await dioRequest.post(baseUrl, data: formData);

    debugPrint("Here in post dio2 ${response.data} ");

    logger ??= ApiLogger(
        accessToken: "",
        endpoint: baseUrl,
        request: requestFields.toString(),
        response: response.data.toString());

    logger?.log();
    return response.data;
  }
}
