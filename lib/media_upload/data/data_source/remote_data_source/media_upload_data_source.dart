abstract class MediaUploadRemoteDataSource {
  const MediaUploadRemoteDataSource();
  Future post(
      {required Map requestFields, String? endpoint});
}
