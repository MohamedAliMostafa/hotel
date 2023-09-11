/// warnings : [{"code":538,"title":"INVALID IATA/ARC NUMBER"}]
/// data : [{"type":"hotel-booking","id":"MC_78485085","providerConfirmationId":"78485085","associatedRecords":[{"reference":"JYOFK3","originSystemCode":"GDS"}]}]

class HotelBookingModel {
  HotelBookingModel({
      this.warnings, 
      this.data,});

  HotelBookingModel.fromJson(dynamic json) {
    if (json['warnings'] != null) {
      warnings = [];
      json['warnings'].forEach((v) {
        warnings?.add(Warnings.fromJson(v));
      });
    }
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(BookingData.fromJson(v));
      });
    }
  }
  List<Warnings>? warnings;
  List<BookingData>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (warnings != null) {
      map['warnings'] = warnings?.map((v) => v.toJson()).toList();
    }
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// type : "hotel-booking"
/// id : "MC_78485085"
/// providerConfirmationId : "78485085"
/// associatedRecords : [{"reference":"JYOFK3","originSystemCode":"GDS"}]

class BookingData {
  BookingData({
      this.type, 
      this.id, 
      this.providerConfirmationId, 
      this.associatedRecords,});

  BookingData.fromJson(dynamic json) {
    type = json['type'];
    id = json['id'];
    providerConfirmationId = json['providerConfirmationId'];
    if (json['associatedRecords'] != null) {
      associatedRecords = [];
      json['associatedRecords'].forEach((v) {
        associatedRecords?.add(AssociatedRecords.fromJson(v));
      });
    }
  }
  String? type;
  String? id;
  String? providerConfirmationId;
  List<AssociatedRecords>? associatedRecords;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['id'] = id;
    map['providerConfirmationId'] = providerConfirmationId;
    if (associatedRecords != null) {
      map['associatedRecords'] = associatedRecords?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// reference : "JYOFK3"
/// originSystemCode : "GDS"

class AssociatedRecords {
  AssociatedRecords({
      this.reference, 
      this.originSystemCode,});

  AssociatedRecords.fromJson(dynamic json) {
    reference = json['reference'];
    originSystemCode = json['originSystemCode'];
  }
  String? reference;
  String? originSystemCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['reference'] = reference;
    map['originSystemCode'] = originSystemCode;
    return map;
  }

}

/// code : 538
/// title : "INVALID IATA/ARC NUMBER"

class Warnings {
  Warnings({
      this.code, 
      this.title,});

  Warnings.fromJson(dynamic json) {
    code = json['code'];
    title = json['title'];
  }
  int? code;
  String? title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['title'] = title;
    return map;
  }

}