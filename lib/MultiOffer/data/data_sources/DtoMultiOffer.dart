import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../Core/API/BaseURL.dart';
import '../../../Core/API/EndPoint.dart';
import '../../../Core/API/token/Token.dart';
import '../../../Core/Error/Failure.dart';
import '../models/HotelBookingModel.dart';
import '../models/MultiOfferModel.dart';

abstract class DtoMultiOffer
{
  Future<Either<Failures, MultiOfferModel>> multiOffer( List<String> hotelId);
  Future<Either<Failures, HotelBookingModel>> hotelBooking( String   offerId);
}
class RemoteMultiOff implements DtoMultiOffer
{
  @override
  Future<Either<Failures, MultiOfferModel>> multiOffer(List<String> hotelId) async {
    Dio dio = Dio();
    try {
      String? accessToken = Amadeus.token == null ? await Amadeus.generateAccessToken() : Amadeus.token.toString();
      var ListNewID=checkString(hotelId);
      var objToJson=jsonEncode(ListNewID);
      var jsontoString=jsonDecode(objToJson);
      var resp = await dio.get("$baseUrl$endPointMultiOffer", queryParameters: {
        "hotelIds": jsontoString,
      },options: Options(
          headers: {
            "Authorization":"Bearer $accessToken"
          }
      ));
      MultiOfferModel multiOfferModel = MultiOfferModel.fromJson(resp.data);
      print(resp.data);
      return Right(multiOfferModel);
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


  List<String>  checkString (List<String> hotelId)
  {
    List<String>  ListChar8=[];
    var str2 = hotelId;
    for(int i=0;i<str2.length;i++)
    {
      int count=0;
      str2[i].runes.forEach((c) {
        String.fromCharCode(c);
        count++;
      });
      if(count==8)
      {
        ListChar8.add(str2[i]);
        count==0;
      }
      else
      {
        count==0;
      }
    }
    return ListChar8;

  }

  @override
  Future<Either<Failures, HotelBookingModel>> hotelBooking(String offerId) async {
    Dio dio = Dio();
    try {
      String? accessToken = Amadeus.token == null ? await Amadeus.generateAccessToken() : Amadeus.token.toString();
      var resp = await dio.post("$baseUrl$endPointHotelBoo",data: {
        "data": {
          "offerId": offerId,
          "guests": [
            {
              "name": {
                "title": "MR",
                "firstName": "BOB",
                "lastName": "SMITH"
              },
              "contact": {
                "phone": "+33679278416",
                "email": "bob.smith@email.com"
              }
            }
          ],
          "payments": [
            {
              "method": "creditCard",
              "card": {
                "vendorCode": "VI",
                "cardNumber": "4111111111111111",
                "expiryDate": "2026-01"
              }
            }
          ]
        }

      } ,options: Options(
          headers: {
            "Authorization":"Bearer $accessToken"
          }
      ));
      HotelBookingModel multiOfferModel = HotelBookingModel.fromJson(resp.data);
      print(resp.data);
      return Right(multiOfferModel);
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