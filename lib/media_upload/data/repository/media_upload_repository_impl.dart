import '../../domain/repository/media_upload_repository.dart';
import '../data_source/remote_data_source/media_upload_data_source.dart';
import '../model/acknowledgement_response.dart';
import '../model/generated_url_ack_response_model.dart';
import '../model/upload_response_model.dart';

class MediaUploadRepoImpl extends MediaUploadRepo {
  MediaUploadRemoteDataSource dataSource;
  MediaUploadRepoImpl({required this.dataSource});

  @override
  Future<UploadMediaResponse> uploadMedia(
      {required Map requestFields, required String? endpoint}) async {
    return UploadMediaModel().fromJson(await dataSource.post(
        requestFields: requestFields, endpoint: endpoint));
  }

  @override
  Future<AcknowledgementResponse> generateMediaUrl(
      {required Map request, required String? endpoint}) async {
    return GeneratedUrlAcknowldgementResponse().fromJson(await dataSource.post(
        requestFields: request,
        endpoint: endpoint));
  }
}
