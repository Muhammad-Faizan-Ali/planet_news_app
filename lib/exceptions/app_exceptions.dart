class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._prefix, this._message]);

  @override
  String toString() {
    return '$_prefix$_message';
  }
}

class NoInternetException extends AppException {
  NoInternetException({required String message})
      : super('No Internet: ', message);
}

class SlowInternetException extends AppException {
  SlowInternetException({required String message})
      : super('Slow Internet: ', message);
}

class FetchDataException extends AppException {
  FetchDataException({required String message})
      : super('Error During Communication: ', message);
}

class BadRequestException extends AppException {
  BadRequestException({required String message})
      : super('Invalid Request: ', message);
}

class UnauthorisedException extends AppException {
  UnauthorisedException({required String message})
      : super('Unauthorised Request: ', message);
}

class InvalidInputException extends AppException {
  InvalidInputException({required String message})
      : super('Invalid Input: ', message);
}