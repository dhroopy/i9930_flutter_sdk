abstract class ResultEntity {}

class Result extends ResultEntity {
  String? location;
  String? path;
  String? bucket;
  String? s3FileName;
  String? s3FilePath;
  String? orignalFileName;
  String? ext;

  Result({
    this.location,
    this.path,
    this.bucket,
    this.s3FileName,
    this.s3FilePath,
    this.orignalFileName,
    this.ext,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        location: json["location"],
        path: json["path"],
        bucket: json["Bucket"],
        s3FileName: json["S3_file_name"],
        s3FilePath: json["S3_file_path"],
        orignalFileName: json["orignal_file_name"],
        ext: json["extension"],
      );

  Map<String, dynamic> toJson() => {
        "location": location,
        "path": path,
        "Bucket": bucket,
        "S3_file_name": s3FileName,
        "S3_file_path": s3FilePath,
        "orignal_file_name": orignalFileName,
        "extension": ext,
      };
}
