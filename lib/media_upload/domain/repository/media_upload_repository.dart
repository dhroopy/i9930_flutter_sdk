import '../../data/model/acknowledgement_response.dart';
import '../../data/model/upload_response_model.dart';

abstract class MediaUploadRepo {
  Future<UploadMediaResponse> uploadMedia({required Map requestFields, required String? endpoint});
  Future<AcknowledgementResponse> generateMediaUrl({required Map request, required String? endpoint});
}
