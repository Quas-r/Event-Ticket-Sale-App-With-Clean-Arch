abstract class ServerError{
  final int code;
  final String error;
  ServerError(this.code, this.error);
}

class ServerErrorImpl extends ServerError{

  ServerErrorImpl(super.code, super.error);
}