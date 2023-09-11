import 'package:dartz/dartz.dart';
import 'package:hotel/Details/domain/repositories/DetailsReoDomain.dart';

import '../../../Core/Error/Failure.dart';
import '../../data/models/DetailsModel.dart';
import '../../../MultiOffer/data/models/MultiOfferModel.dart';

class UseCaseDetails
{
  DetailsRepoDomain detailsRepoDomain;

  UseCaseDetails(this.detailsRepoDomain);

  Future<Either<Failures, DetailsModel>> call( List<String> hotelId)=>detailsRepoDomain.showDetails(hotelId);

}