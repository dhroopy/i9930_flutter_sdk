abstract class Response<T> {
  int? statusCode;
  String? msg;
  T? data;

  Response({this.statusCode, this.msg, this.data});

  //Response<T> fromJson(Map<String, dynamic> json);
}
