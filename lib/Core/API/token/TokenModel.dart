class TokenModel {
  TokenModel({

      this.accessToken,
 });

  TokenModel.fromJson(dynamic json) {

    accessToken = json['access_token'].toString();

  }

  String? accessToken;

}