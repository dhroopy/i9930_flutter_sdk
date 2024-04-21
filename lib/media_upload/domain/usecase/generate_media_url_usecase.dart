import '../../../usecase.dart';
import '../../data/model/acknowledgement_response.dart';
import '../../data/model/generated_url_ack_response_model.dart';
import '../repository/media_upload_repository.dart';


class GenerateUrlUsecase extends Usecase<AcknowledgementResponse> {
  MediaUploadRepo repo;

  GenerateUrlUsecase(
      {required this.repo});

  @override
  Future<void> call(
      {
        required Map request,
        String? endpoint,
        Function(AcknowledgementResponse)? onSuccess,
      Function(int, String)? onFaliure,
      Function()? onAuthFailure,
      Function(Object)? onError}) async {
    await repo
        .generateMediaUrl(request: request, endpoint: endpoint)
        .then((response) {
      if (response is GeneratedUrlAcknowldgementResponse) {
        if (response.statusCode == 0) {
          //Success
          if (onSuccess != null) {
            onSuccess(response);
          }
        } else if (response.statusCode == 403) {
          //unAuthenticated
          if (onAuthFailure != null) {
            onAuthFailure();
          }
        } else {
          //Failure
          if (onFaliure != null) {
            onFaliure(response.statusCode!, response.msg!);
          }
        }
      }
    }).onError((error, stackTrace) {
      //onError
      if (onError != null) {
        onError(error!);
      }
    });
  }

  Future<String?> generateUrl({required Map request}) async {
    String? link;
    await call(
        request: request,
        //endpoint:
        onSuccess: (response) {
          if (response is GeneratedUrlAcknowldgementResponse) {
            link = response.result;
          }
        },
        onAuthFailure: () {},
        onFaliure: (statusCode, msg) {},
        onError: (error) {});
    return link;
  }
}
