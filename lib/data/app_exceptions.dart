

class AppExceptions implements Exception{
  final _message;
  final _ptefix;

  AppExceptions([this._message,this._ptefix]);
  String toString(){
    return '$_message$_ptefix';
  }

}


class InternetException extends AppExceptions{
  InternetException([String?message]):super(message,'No internet');
}

class Requesttimeout extends AppExceptions{
  Requesttimeout([String?message]):super(message,'Request Time out');
}

class ServerException extends AppExceptions{
  ServerException([String?message]):super(message,'Internal server error');
}