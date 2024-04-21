abstract class Usecase<T> {
  Future<void> call({
    required Map request,
    String? endpoint,
    Function(T?)? onSuccess,
    Function(int, String)? onFaliure,
    Function()? onAuthFailure,
    Function(Object)? onError
  });
}
