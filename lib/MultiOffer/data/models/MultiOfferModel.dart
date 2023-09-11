/// data : [{"type":"hotel-offers","hotel":{"type":"hotel","hotelId":"MCLONGHM","chainCode":"MC","dupeId":"700031300","name":"JW Marriott Grosvenor House London","cityCode":"LON","latitude":51.50988,"longitude":-0.15509},"available":true,"offers":[{"id":"YP2ALH6XQ0","checkInDate":"2023-09-08","checkOutDate":"2023-09-09","rateCode":"S9R","rateFamilyEstimated":{"code":"SRS","type":"C"},"room":{"type":"XMI","typeEstimated":{"category":"DELUXE_ROOM","beds":1,"bedType":"QUEEN"},"description":{"text":"Marriott Senior Discount, 62 years and older valid ID required\nDeluxe Queen Room, 1 Queen(s),\n20sqm/215sqft-29sqm/312sqft, Wireless","lang":"EN"}},"guests":{"adults":1},"price":{"currency":"GBP","base":"580.00","total":"580.00","variations":{"average":{"base":"580.00"},"changes":[{"startDate":"2023-09-08","endDate":"2023-09-09","total":"580.00"}]}},"policies":{"cancellations":[{"amount":"580.00","deadline":"2023-09-07T23:59:00+01:00"}]},"self":"https://test.api.amadeus.com/v3/shopping/hotel-offers/YP2ALH6XQ0"}],"self":"https://test.api.amadeus.com/v3/shopping/hotel-offers?hotelIds=MCLONGHM"}]

class MultiOfferModel {
  MultiOfferModel({
      this.data,});

  MultiOfferModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataOffer.fromJson(v));
      });
    }
  }
  List<DataOffer>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// type : "hotel-offers"
/// hotel : {"type":"hotel","hotelId":"MCLONGHM","chainCode":"MC","dupeId":"700031300","name":"JW Marriott Grosvenor House London","cityCode":"LON","latitude":51.50988,"longitude":-0.15509}
/// available : true
/// offers : [{"id":"YP2ALH6XQ0","checkInDate":"2023-09-08","checkOutDate":"2023-09-09","rateCode":"S9R","rateFamilyEstimated":{"code":"SRS","type":"C"},"room":{"type":"XMI","typeEstimated":{"category":"DELUXE_ROOM","beds":1,"bedType":"QUEEN"},"description":{"text":"Marriott Senior Discount, 62 years and older valid ID required\nDeluxe Queen Room, 1 Queen(s),\n20sqm/215sqft-29sqm/312sqft, Wireless","lang":"EN"}},"guests":{"adults":1},"price":{"currency":"GBP","base":"580.00","total":"580.00","variations":{"average":{"base":"580.00"},"changes":[{"startDate":"2023-09-08","endDate":"2023-09-09","total":"580.00"}]}},"policies":{"cancellations":[{"amount":"580.00","deadline":"2023-09-07T23:59:00+01:00"}]},"self":"https://test.api.amadeus.com/v3/shopping/hotel-offers/YP2ALH6XQ0"}]
/// self : "https://test.api.amadeus.com/v3/shopping/hotel-offers?hotelIds=MCLONGHM"

class DataOffer {
  DataOffer({
      this.type, 
      this.hotel, 
      this.available, 
      this.offers, 
      this.self,});

  DataOffer.fromJson(dynamic json) {
    type = json['type'];
    hotel = json['hotel'] != null ? Hotel.fromJson(json['hotel']) : null;
    available = json['available'];
    if (json['offers'] != null) {
      offers = [];
      json['offers'].forEach((v) {
        offers?.add(Offers.fromJson(v));
      });
    }
    self = json['self'];
  }
  String? type;
  Hotel? hotel;
  bool? available;
  List<Offers>? offers;
  String? self;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    if (hotel != null) {
      map['hotel'] = hotel?.toJson();
    }
    map['available'] = available;
    if (offers != null) {
      map['offers'] = offers?.map((v) => v.toJson()).toList();
    }
    map['self'] = self;
    return map;
  }

}

/// id : "YP2ALH6XQ0"
/// checkInDate : "2023-09-08"
/// checkOutDate : "2023-09-09"
/// rateCode : "S9R"
/// rateFamilyEstimated : {"code":"SRS","type":"C"}
/// room : {"type":"XMI","typeEstimated":{"category":"DELUXE_ROOM","beds":1,"bedType":"QUEEN"},"description":{"text":"Marriott Senior Discount, 62 years and older valid ID required\nDeluxe Queen Room, 1 Queen(s),\n20sqm/215sqft-29sqm/312sqft, Wireless","lang":"EN"}}
/// guests : {"adults":1}
/// price : {"currency":"GBP","base":"580.00","total":"580.00","variations":{"average":{"base":"580.00"},"changes":[{"startDate":"2023-09-08","endDate":"2023-09-09","total":"580.00"}]}}
/// policies : {"cancellations":[{"amount":"580.00","deadline":"2023-09-07T23:59:00+01:00"}]}
/// self : "https://test.api.amadeus.com/v3/shopping/hotel-offers/YP2ALH6XQ0"

class Offers {
  Offers({
      this.id, 
      this.checkInDate, 
      this.checkOutDate, 
      this.rateCode, 
      this.rateFamilyEstimated, 
      this.room, 
      this.guests, 
      this.price, 
      this.policies, 
      this.self,});

  Offers.fromJson(dynamic json) {
    id = json['id'];
    checkInDate = json['checkInDate'];
    checkOutDate = json['checkOutDate'];
    rateCode = json['rateCode'];
    rateFamilyEstimated = json['rateFamilyEstimated'] != null ? RateFamilyEstimated.fromJson(json['rateFamilyEstimated']) : null;
    room = json['room'] != null ? Room.fromJson(json['room']) : null;
    guests = json['guests'] != null ? Guests.fromJson(json['guests']) : null;
    price = json['price'] != null ? Price.fromJson(json['price']) : null;
    policies = json['policies'] != null ? Policies.fromJson(json['policies']) : null;
    self = json['self'];
  }
  String? id;
  String? checkInDate;
  String? checkOutDate;
  String? rateCode;
  RateFamilyEstimated? rateFamilyEstimated;
  Room? room;
  Guests? guests;
  Price? price;
  Policies? policies;
  String? self;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['checkInDate'] = checkInDate;
    map['checkOutDate'] = checkOutDate;
    map['rateCode'] = rateCode;
    if (rateFamilyEstimated != null) {
      map['rateFamilyEstimated'] = rateFamilyEstimated?.toJson();
    }
    if (room != null) {
      map['room'] = room?.toJson();
    }
    if (guests != null) {
      map['guests'] = guests?.toJson();
    }
    if (price != null) {
      map['price'] = price?.toJson();
    }
    if (policies != null) {
      map['policies'] = policies?.toJson();
    }
    map['self'] = self;
    return map;
  }

}

/// cancellations : [{"amount":"580.00","deadline":"2023-09-07T23:59:00+01:00"}]

class Policies {
  Policies({
      this.cancellations,});

  Policies.fromJson(dynamic json) {
    if (json['cancellations'] != null) {
      cancellations = [];
      json['cancellations'].forEach((v) {
        cancellations?.add(Cancellations.fromJson(v));
      });
    }
  }
  List<Cancellations>? cancellations;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (cancellations != null) {
      map['cancellations'] = cancellations?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// amount : "580.00"
/// deadline : "2023-09-07T23:59:00+01:00"

class Cancellations {
  Cancellations({
      this.amount, 
      this.deadline,});

  Cancellations.fromJson(dynamic json) {
    amount = json['amount'];
    deadline = json['deadline'];
  }
  String? amount;
  String? deadline;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['amount'] = amount;
    map['deadline'] = deadline;
    return map;
  }

}

/// currency : "GBP"
/// base : "580.00"
/// total : "580.00"
/// variations : {"average":{"base":"580.00"},"changes":[{"startDate":"2023-09-08","endDate":"2023-09-09","total":"580.00"}]}

class Price {
  Price({
      this.currency, 
      this.base, 
      this.total, 
      this.variations,});

  Price.fromJson(dynamic json) {
    currency = json['currency'];
    base = json['base'];
    total = json['total'];
    variations = json['variations'] != null ? Variations.fromJson(json['variations']) : null;
  }
  String? currency;
  String? base;
  String? total;
  Variations? variations;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currency'] = currency;
    map['base'] = base;
    map['total'] = total;
    if (variations != null) {
      map['variations'] = variations?.toJson();
    }
    return map;
  }

}

/// average : {"base":"580.00"}
/// changes : [{"startDate":"2023-09-08","endDate":"2023-09-09","total":"580.00"}]

class Variations {
  Variations({
      this.average, 
      this.changes,});

  Variations.fromJson(dynamic json) {
    average = json['average'] != null ? Average.fromJson(json['average']) : null;
    if (json['changes'] != null) {
      changes = [];
      json['changes'].forEach((v) {
        changes?.add(Changes.fromJson(v));
      });
    }
  }
  Average? average;
  List<Changes>? changes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (average != null) {
      map['average'] = average?.toJson();
    }
    if (changes != null) {
      map['changes'] = changes?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// startDate : "2023-09-08"
/// endDate : "2023-09-09"
/// total : "580.00"

class Changes {
  Changes({
      this.startDate, 
      this.endDate, 
      this.total,});

  Changes.fromJson(dynamic json) {
    startDate = json['startDate'];
    endDate = json['endDate'];
    total = json['total'];
  }
  String? startDate;
  String? endDate;
  String? total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['startDate'] = startDate;
    map['endDate'] = endDate;
    map['total'] = total;
    return map;
  }

}

/// base : "580.00"

class Average {
  Average({
      this.base,});

  Average.fromJson(dynamic json) {
    base = json['base'];
  }
  String? base;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['base'] = base;
    return map;
  }

}

/// adults : 1

class Guests {
  Guests({
      this.adults,});

  Guests.fromJson(dynamic json) {
    adults = json['adults'];
  }
  int? adults;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adults'] = adults;
    return map;
  }

}

/// type : "XMI"
/// typeEstimated : {"category":"DELUXE_ROOM","beds":1,"bedType":"QUEEN"}
/// description : {"text":"Marriott Senior Discount, 62 years and older valid ID required\nDeluxe Queen Room, 1 Queen(s),\n20sqm/215sqft-29sqm/312sqft, Wireless","lang":"EN"}

class Room {
  Room({
      this.type, 
      this.typeEstimated, 
      this.description,});

  Room.fromJson(dynamic json) {
    type = json['type'];
    typeEstimated = json['typeEstimated'] != null ? TypeEstimated.fromJson(json['typeEstimated']) : null;
    description = json['description'] != null ? Description.fromJson(json['description']) : null;
  }
  String? type;
  TypeEstimated? typeEstimated;
  Description? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    if (typeEstimated != null) {
      map['typeEstimated'] = typeEstimated?.toJson();
    }
    if (description != null) {
      map['description'] = description?.toJson();
    }
    return map;
  }

}

/// text : "Marriott Senior Discount, 62 years and older valid ID required\nDeluxe Queen Room, 1 Queen(s),\n20sqm/215sqft-29sqm/312sqft, Wireless"
/// lang : "EN"

class Description {
  Description({
      this.text, 
      this.lang,});

  Description.fromJson(dynamic json) {
    text = json['text'];
    lang = json['lang'];
  }
  String? text;
  String? lang;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = text;
    map['lang'] = lang;
    return map;
  }

}

/// category : "DELUXE_ROOM"
/// beds : 1
/// bedType : "QUEEN"

class TypeEstimated {
  TypeEstimated({
      this.category, 
      this.beds, 
      this.bedType,});

  TypeEstimated.fromJson(dynamic json) {
    category = json['category'];
    beds = json['beds'];
    bedType = json['bedType'];
  }
  String? category;
  int? beds;
  String? bedType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category'] = category;
    map['beds'] = beds;
    map['bedType'] = bedType;
    return map;
  }

}

/// code : "SRS"
/// type : "C"

class RateFamilyEstimated {
  RateFamilyEstimated({
      this.code, 
      this.type,});

  RateFamilyEstimated.fromJson(dynamic json) {
    code = json['code'];
    type = json['type'];
  }
  String? code;
  String? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['type'] = type;
    return map;
  }

}

/// type : "hotel"
/// hotelId : "MCLONGHM"
/// chainCode : "MC"
/// dupeId : "700031300"
/// name : "JW Marriott Grosvenor House London"
/// cityCode : "LON"
/// latitude : 51.50988
/// longitude : -0.15509

class Hotel {
  Hotel({
      this.type, 
      this.hotelId, 
      this.chainCode, 
      this.dupeId, 
      this.name, 
      this.cityCode, 
      this.latitude, 
      this.longitude,});

  Hotel.fromJson(dynamic json) {
    type = json['type'];
    hotelId = json['hotelId'];
    chainCode = json['chainCode'];
    dupeId = json['dupeId'];
    name = json['name'];
    cityCode = json['cityCode'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }
  String? type;
  String? hotelId;
  String? chainCode;
  String? dupeId;
  String? name;
  String? cityCode;
  double? latitude;
  double? longitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['hotelId'] = hotelId;
    map['chainCode'] = chainCode;
    map['dupeId'] = dupeId;
    map['name'] = name;
    map['cityCode'] = cityCode;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    return map;
  }

}