import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../../data/model/upload_response_model.dart';

abstract class AttachmentEntity extends UploadMediaResponse {
  @override
  AttachmentEntity fromJson(Map<String, dynamic> json);
}

class Attachment extends AttachmentEntity {
  String? ext;
  String? base64String;
  File? file;
  XFile? xFile;
  String? link;
  //1 = image 2 files 3 link
  int? type;
  String? s3Path;
  String? orgName;

  Attachment(
      {this.ext,
      this.base64String,
      this.file,
      this.s3Path,
      this.xFile,
      this.type,
      this.orgName,
      this.link});

  @override
  AttachmentEntity fromJson(Map<String, dynamic> json) {
    return Attachment(
        type: json["type"], s3Path: json["image"], orgName: json["name"] ?? "");
  }
}
