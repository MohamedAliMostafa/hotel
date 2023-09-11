import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hotel/Core/API/EndPoint.dart';
import 'package:hotel/Core/API/token/Token.dart';
import '../../../Core/API/BaseURL.dart';
import '../../../Core/Error/Failure.dart';
import '../models/DetailsModel.dart';

abstract class DtoDetails
{
  Future<Either<Failures, DetailsModel>> showDetails( List<String> hotelId);

}
class RemoteDetails implements DtoDetails
{
  @override
  Future<Either<Failures, DetailsModel>> showDetails(List<String> hotelId) async {
    Dio dio = Dio();
    try {
      String? accessToken = Amadeus.token == null ? await Amadeus.generateAccessToken() : Amadeus.token.toString();
      List<String> NewID=[];
      for(int i=0;i<hotelId.length;i++)
        {
          if(i<3)
            {
              NewID.add(hotelId[i]);
            }
          else
            {
              break;
            }
        }                               // max 3
      NewID.map((e) => e.split(',')).toList();  // comma separated

      var objToJson=jsonEncode(NewID);
      var jsontoString=jsonDecode(objToJson);
      var resp = await dio.get("$baseUrl$endPointDetails", queryParameters: {
        "hotelIds": jsontoString,
      },options: Options(
          headers: {
            "Authorization":"Bearer $accessToken"
          }
      ));
      DetailsModel detailsModel = DetailsModel.fromJson(resp.data);
      print(resp.data);
      return Right(detailsModel);
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