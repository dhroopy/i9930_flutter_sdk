abstract class AcknowledgementResponse {
  int? statusCode;
  String? msg;
  String? id; //Can be used for different 

  AcknowledgementResponse({this.statusCode, this.msg, this.id});

  AcknowledgementResponse fromJson(Map<String, dynamic> json);
}
