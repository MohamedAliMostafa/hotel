import 'package:dartz/dartz.dart';
import 'package:hotel/MultiOffer/data/models/HotelBookingModel.dart';

import '../../../Core/Error/Failure.dart';
import '../../data/models/MultiOfferModel.dart';
import '../repositories/MultiReoDomain.dart';

class UseCaseMultiOffer
{
  MutiRepoD mutiRepoD;

  UseCaseMultiOffer(this.mutiRepoD);


  Future<Either<Failures, MultiOfferModel>> execute( List<String> hotelId)=>mutiRepoD.multiOffer(hotelId);
  Future<Either<Failures, HotelBookingModel>> call( String offerId)=>mutiRepoD.hotelBooking(offerId);

}