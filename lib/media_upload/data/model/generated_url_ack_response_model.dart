import 'acknowledgement_response.dart';

class GeneratedUrlAcknowldgementResponse extends AcknowledgementResponse {
  int? status;
  String? result;

  GeneratedUrlAcknowldgementResponse({
    int? status,
    super.msg,
    this.result,
  }) : super(statusCode: status);

  @override
  AcknowledgementResponse fromJson(Map<String, dynamic> json) {
    return GeneratedUrlAcknowldgementResponse(
        status: json["status"], msg: json["msg"], result: json["result"]);
  }
}
