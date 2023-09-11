import 'package:hotel/MultiOffer/data/models/HotelBookingModel.dart';

import '../../data/models/MultiOfferModel.dart';

abstract class MultiOfferStates {
}
class MultiOfferInitStates extends MultiOfferStates{}
class MultiOfferLoadingStates extends MultiOfferStates{}
class MultiOfferSuccessStates extends MultiOfferStates{
  MultiOfferModel modelMultiOffer;

  MultiOfferSuccessStates(this.modelMultiOffer);
}
class MultiOfferErrorStates extends MultiOfferStates{
  String msg;
  MultiOfferErrorStates(this.msg);
}
class HotelBookingLoadingStates extends MultiOfferStates{}
class HotelBookingSuccessStates extends MultiOfferStates{
  HotelBookingModel hotelBookingModel;

  HotelBookingSuccessStates(this.hotelBookingModel);
}
class HotelBookingErrorStates extends MultiOfferStates{
  String msg;
  HotelBookingErrorStates(this.msg);
}