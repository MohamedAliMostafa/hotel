import 'package:dio/dio.dart';

class Failures
{
  String msg;

  Failures(this.msg);
  @override
  String toString() {

    return msg;
  }
}
class ServerError extends Failures {
  ServerError(super.msg);


  factory ServerError.fromDio(DioException dioException){
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerError("Connection time out Api server");
      case DioExceptionType.sendTimeout:
        return ServerError("send time out with server");
      case DioExceptionType.receiveTimeout:
        return ServerError("receive time out with server");
      case DioExceptionType.badCertificate:
        return ServerError.fromResponse(
            dioException.response!.statusCode??0,
            dioException.response!.data);
      case DioExceptionType.badResponse:
        return ServerError.fromResponse(
            dioException.response!.statusCode ?? 0,
            dioException.response!.data);

      case DioExceptionType.cancel:
        return ServerError("Requset api cancel ");

      case DioExceptionType.connectionError:
        return ServerError(" no Inetrnet  Connection ");
      case DioExceptionType.unknown:
        return ServerError(" no Inetrnet  Connection ");
      default:
        return ServerError("OOPS there Error,please try again");
    }
  }
  factory ServerError.fromResponse(int  statusCode ,dynamic resp )
  {
    if(statusCode==400 || statusCode== 401 || statusCode==403)
    {
      return ServerError(resp["message"]);
    }
    else {
      return ServerError("please try again");
    }

  }
}


class LocalError extends Failures
{
  LocalError(super.msg);

}