import '../../../usecase.dart';
import '../../../validator/validator.dart';
import '../../data/model/upload_response_model.dart';
import '../entity/attachment_entity.dart';
import '../entity/result_entity.dart';
import '../repository/media_upload_repository.dart';
import 'generate_media_url_usecase.dart';

class UploadMediaUsecase extends Usecase<UploadMediaResponse> {
  MediaUploadRepo repo;
  GenerateUrlUsecase? generateUrlUsecase;

  UploadMediaUsecase({required this.repo, this.generateUrlUsecase});

  @override
  Future call(
      {required Map request,
      String? endpoint,
      Function(UploadMediaResponse?)? onSuccess,
      Function(int, String)? onFaliure,
      Function()? onAuthFailure,
      Function(Object)? onError}) async {
    await repo
        .uploadMedia(requestFields: request, endpoint: endpoint)
        .then((response) async {
      if (response is UploadMediaModel) {
        if (response.status == 0) {
          //Success
          if (onSuccess != null) {
            if (generateUrlUsecase != null) {
              String? link = await generateUrlUsecase?.generateUrl(
                  request: {'url': (response.result as Result).s3FilePath});
              onSuccess(StringValidator(text: link).isValid()
                  ? Attachment(
                      type: request["fileType"],
                      link: link.toString(),
                      s3Path: (response.result as Result).s3FilePath,
                      orgName: (response.result as Result)
                          .orignalFileName
                          .toString())
                  : null);
            } else {
              onSuccess(response);
            }
          }
        } else if (response.status == 403) {
          //unAuthenticated
          if (onAuthFailure != null) {
            onAuthFailure();
          }
        } else {
          //Failure
          if (onFaliure != null) {
            onFaliure(response.status!, response.msg!);
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
}
