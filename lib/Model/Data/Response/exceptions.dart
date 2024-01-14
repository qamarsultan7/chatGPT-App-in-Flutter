class AppExeptions implements Exception {
  final _message;
  final _prefix;
  AppExeptions(this._message, this._prefix);
  @override
  String toString() {
    return '$_prefix' '$_message';
  }
}

class FetchDataExceptions extends AppExeptions {
  FetchDataExceptions([String? message])
      : super(message, 'Error During Communication');
}

class BadrequestException extends AppExeptions {
  BadrequestException([String? message]) : super(message, 'Invalid Request');
}

class UnauthorizedExceptions extends AppExeptions {
  UnauthorizedExceptions([String? message])
      : super(message, 'UnauThorized Request');
}

class Invalidinput extends AppExeptions {
  Invalidinput([String? message]) : super(message, 'Invalid Input');
}
