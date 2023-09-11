import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hotel/Core/API/BaseURL.dart';
import 'package:hotel/Core/API/EndPoint.dart';
import 'package:hotel/Core/API/token/Token.dart';

import '../../../Core/Error/Failure.dart';
import '../models/SearchModel.dart';

abstract class Dtosearch
{
  Future<Either<Failures, SearchModel>> searchByLocation(String location);
}
class RemoteData implements Dtosearch
{
  @override
  Future<Either<Failures, SearchModel>> searchByLocation(String location) async {
    Dio dio = Dio();
    try {

      String? accessToken = Amadeus.token == null ? await Amadeus.generateAccessToken() : Amadeus.token.toString();
      var resp = await dio.get("$baseUrl$endPointSearch", queryParameters: {
        "keyword": location,
        "subType": "HOTEL_LEISURE",
        "subType":"HOTEL_GDS"
      },options: Options(
        headers: {
          "Authorization":"Bearer $accessToken",

        }
      ));
      SearchModel? modelLog;
      if(resp.statusCode==200)
        {
           modelLog = SearchModel.fromJson(resp.data);

        }
      else if(resp.statusCode==401)
        {
          String? refreshToken = await Amadeus.generateAccessToken() ;
          var resp = await dio.get("$baseUrl$endPointSearch", queryParameters: {
            "keyword": location,
            "subType": "HOTEL_LEISURE",
            "subType":"HOTEL_GDS"
          },options: Options(
              headers: {
                "Authorization":"Bearer $refreshToken",

              }
          ));
           modelLog = SearchModel.fromJson(resp.data);

        }
      return Right(modelLog!);


    }
    catch (e) {
      print(e.toString());
      if(e is DioException) {
        return left(ServerError.fromDio(e));
      }
      else{
        return left(ServerError(e.toString()));
      }
    }
    }


}