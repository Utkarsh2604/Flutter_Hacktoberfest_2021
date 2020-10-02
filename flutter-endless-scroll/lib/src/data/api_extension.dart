class ApiExtension implements Exception {
  final _message;
  final _prefix;

  ApiExtension([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends ApiExtension {
  FetchDataException([String message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends ApiExtension {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends ApiExtension {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends ApiExtension {
  InvalidInputException([String message]) : super(message, "Invalid Input: ");
}
