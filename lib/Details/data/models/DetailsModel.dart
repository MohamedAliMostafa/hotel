/// data : [{"type":"hotelSentiment","numberOfReviews":218,"numberOfRatings":278,"hotelId":"ADNYCCTB","overallRating":93,"sentiments":{"sleepQuality":87,"service":98,"facilities":90,"roomComforts":92,"valueForMoney":87,"catering":89,"location":98,"pointsOfInterest":91,"staff":100}},{"type":"hotelSentiment","numberOfReviews":2667,"numberOfRatings":2666,"hotelId":"TELONMFS","overallRating":81,"sentiments":{"sleepQuality":78,"service":80,"facilities":75,"roomComforts":87,"valueForMoney":75,"catering":81,"location":89,"internet":72,"pointsOfInterest":81,"staff":89}}]
/// meta : {"count":1,"links":{"self":"https://test.api.amadeus.com/v2/e-reputation/hotel-sentiments?hotelIds=ADNYCCTB,TELONMFS,XXXYYY01"}}
/// warnings : [{"code":913,"title":"PROPERTIES NOT FOUND","detail":"Some of the requested properties were not found in our database.","source":{"parameter":"hotelIds","pointer":"XXXYYY01"}}]

class DetailsModel {
  DetailsModel({
      this.data, 
      this.meta, 
      this.warnings,});

  DetailsModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DetailsData.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    if (json['warnings'] != null) {
      warnings = [];
      json['warnings'].forEach((v) {
        warnings?.add(Warnings.fromJson(v));
      });
    }
  }
  List<DetailsData>? data;
  Meta? meta;
  List<Warnings>? warnings;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      map['meta'] = meta?.toJson();
    }
    if (warnings != null) {
      map['warnings'] = warnings?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// code : 913
/// title : "PROPERTIES NOT FOUND"
/// detail : "Some of the requested properties were not found in our database."
/// source : {"parameter":"hotelIds","pointer":"XXXYYY01"}

class Warnings {
  Warnings({
      this.code, 
      this.title, 
      this.detail, 
      this.source,});

  Warnings.fromJson(dynamic json) {
    code = json['code'];
    title = json['title'];
    detail = json['detail'];
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
  }
  int? code;
  String? title;
  String? detail;
  Source? source;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['title'] = title;
    map['detail'] = detail;
    if (source != null) {
      map['source'] = source?.toJson();
    }
    return map;
  }

}

/// parameter : "hotelIds"
/// pointer : "XXXYYY01"

class Source {
  Source({
      this.parameter, 
      this.pointer,});

  Source.fromJson(dynamic json) {
    parameter = json['parameter'];
    pointer = json['pointer'];
  }
  String? parameter;
  String? pointer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['parameter'] = parameter;
    map['pointer'] = pointer;
    return map;
  }

}

/// count : 1
/// links : {"self":"https://test.api.amadeus.com/v2/e-reputation/hotel-sentiments?hotelIds=ADNYCCTB,TELONMFS,XXXYYY01"}

class Meta {
  Meta({
      this.count, 
      this.links,});

  Meta.fromJson(dynamic json) {
    count = json['count'];
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
  }
  int? count;
  Links? links;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    if (links != null) {
      map['links'] = links?.toJson();
    }
    return map;
  }

}

/// self : "https://test.api.amadeus.com/v2/e-reputation/hotel-sentiments?hotelIds=ADNYCCTB,TELONMFS,XXXYYY01"

class Links {
  Links({
      this.self,});

  Links.fromJson(dynamic json) {
    self = json['self'];
  }
  String? self;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['self'] = self;
    return map;
  }

}

/// type : "hotelSentiment"
/// numberOfReviews : 218
/// numberOfRatings : 278
/// hotelId : "ADNYCCTB"
/// overallRating : 93
/// sentiments : {"sleepQuality":87,"service":98,"facilities":90,"roomComforts":92,"valueForMoney":87,"catering":89,"location":98,"pointsOfInterest":91,"staff":100}

class DetailsData {
  DetailsData({
      this.type, 
      this.numberOfReviews, 
      this.numberOfRatings, 
      this.hotelId, 
      this.overallRating, 
      this.sentiments,});

  DetailsData.fromJson(dynamic json) {
    type = json['type'];
    numberOfReviews = json['numberOfReviews'];
    numberOfRatings = json['numberOfRatings'];
    hotelId = json['hotelId'];
    overallRating = json['overallRating'];
    sentiments = json['sentiments'] != null ? Sentiments.fromJson(json['sentiments']) : null;
  }
  String? type;
  int? numberOfReviews;
  int? numberOfRatings;
  String? hotelId;
  int? overallRating;
  Sentiments? sentiments;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['numberOfReviews'] = numberOfReviews;
    map['numberOfRatings'] = numberOfRatings;
    map['hotelId'] = hotelId;
    map['overallRating'] = overallRating;
    if (sentiments != null) {
      map['sentiments'] = sentiments?.toJson();
    }
    return map;
  }

}

/// sleepQuality : 87
/// service : 98
/// facilities : 90
/// roomComforts : 92
/// valueForMoney : 87
/// catering : 89
/// location : 98
/// pointsOfInterest : 91
/// staff : 100

class Sentiments {
  Sentiments({
      this.sleepQuality, 
      this.service, 
      this.facilities, 
      this.roomComforts, 
      this.valueForMoney, 
      this.catering, 
      this.location, 
      this.pointsOfInterest, 
      this.staff,});

  Sentiments.fromJson(dynamic json) {
    sleepQuality = json['sleepQuality'];
    service = json['service'];
    facilities = json['facilities'];
    roomComforts = json['roomComforts'];
    valueForMoney = json['valueForMoney'];
    catering = json['catering'];
    location = json['location'];
    pointsOfInterest = json['pointsOfInterest'];
    staff = json['staff'];
  }
  int? sleepQuality;
  int? service;
  int? facilities;
  int? roomComforts;
  int? valueForMoney;
  int? catering;
  int? location;
  int? pointsOfInterest;
  int? staff;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sleepQuality'] = sleepQuality;
    map['service'] = service;
    map['facilities'] = facilities;
    map['roomComforts'] = roomComforts;
    map['valueForMoney'] = valueForMoney;
    map['catering'] = catering;
    map['location'] = location;
    map['pointsOfInterest'] = pointsOfInterest;
    map['staff'] = staff;
    return map;
  }

}