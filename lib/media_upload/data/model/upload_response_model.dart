import '../../domain/entity/result_entity.dart';

abstract class UploadMediaResponse {
  UploadMediaResponse fromJson(Map<String, dynamic> json);
}

class UploadMediaModel extends UploadMediaResponse {
  int? status;
  String? msg;
  ResultEntity? result;
  int? fileType;

  UploadMediaModel({this.status, this.msg, this.result, this.fileType});

  @override
  UploadMediaResponse fromJson(Map<String, dynamic> json) {
    return UploadMediaModel(
      status: json["status"],
      msg: json["msg"],
      result: json["result"] == null ? null : Result.fromJson(json["result"]),
    );
  }
}
