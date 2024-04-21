import 'dart:developer' as dev;

abstract class Logger {
  void log();
}

class ApiLogger implements Logger {
  String endpoint;
  String accessToken;
  String request;
  String response;

  ApiLogger(
      {required this.endpoint,
      required this.accessToken,
      required this.request,
      required this.response});

  @override
  void log() {
    dev.log("""
        ======================================\n
           API $endpoint \n
           JWT $accessToken \n
           REQ $request  \n 
           RES $response \n 
        ======================================\n
           """);
  }
  
}
