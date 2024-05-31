abstract class AuthDataSource {
  const AuthDataSource();
  Future post(
      {required Map requestFields, String? endpoint, String? auth});
}
