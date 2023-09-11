import 'package:dartz/dartz.dart';
import 'package:hotel/MultiOffer/data/models/HotelBookingModel.dart';

import '../../../Core/Error/Failure.dart';
import '../../data/models/MultiOfferModel.dart';

abstract class MutiRepoD
{
Future<Either<Failures, MultiOfferModel>> multiOffer( List<String> hotelId);
Future<Either<Failures, HotelBookingModel>> hotelBooking( String   offerId);
}