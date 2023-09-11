
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hotel/Core/API/token/TokenModel.dart';
import 'package:http/http.dart';



class Amadeus {
  static  String? token;
 static Future<String?> generateAccessToken() async {
    // fetch client id and client secret key from .env file
    String clientId = "Aywzz1fi9KH2ADEOEaED5o95tahRlOPy";
    String clientSecret = "GIVl1CT4MrpmEznr";
    // Amadeus authorization endpoint
    Uri authorizationUri = Uri.parse(
        "https://test.api.amadeus.com/v1/security/oauth2/token");

    try {
     var  response = await post(authorizationUri,
          headers: {"Content-type": "application/x-www-form-urlencoded"},
          body:{
            "grant_type":"client_credentials",
            "client_id":clientId,
            "client_secret":clientSecret
          });
     TokenModel tokenModel=TokenModel.fromJson(jsonDecode(response.body));
     var data = tokenModel;
     print(data);
     token = data.accessToken!;
     return token;
    } catch (e) {
      print("error generating token --> $e");
      return "Unable to generate access token due to error $e";
    }


  }
}