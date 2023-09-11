import 'package:hotel/Details/data/models/DetailsModel.dart';
import 'package:hotel/MultiOffer/data/models/MultiOfferModel.dart';

abstract class DetailsStates {
}
class DetailsInitStates extends DetailsStates{}
class DetailsLoadingStates extends DetailsStates{}
class DetailsSuccessStates extends DetailsStates{
  DetailsModel modelDetails;

  DetailsSuccessStates(this.modelDetails);
}
class DetailsErrorStates extends DetailsStates{
  String msg;
  DetailsErrorStates(this.msg);
}
