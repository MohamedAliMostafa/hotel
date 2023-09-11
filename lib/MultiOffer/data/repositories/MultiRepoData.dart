import 'package:dartz/dartz.dart';
import 'package:hotel/MultiOffer/data/data_sources/DtoMultiOffer.dart';
import 'package:hotel/MultiOffer/data/models/HotelBookingModel.dart';
import 'package:hotel/MultiOffer/domain/repositories/MultiReoDomain.dart';

import '../../../Core/Error/Failure.dart';
import '../models/MultiOfferModel.dart';

class MultiRepoData implements MutiRepoD
{
  DtoMultiOffer dtoMultiOffer;

  MultiRepoData(this.dtoMultiOffer);

  Future<Either<Failures, MultiOfferModel>> multiOffer(List<String> hotelId) =>dtoMultiOffer.multiOffer(hotelId);

  @override
  Future<Either<Failures, HotelBookingModel>> hotelBooking(String offerId) =>dtoMultiOffer.hotelBooking(offerId);
}