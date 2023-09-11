import 'package:dartz/dartz.dart';
import 'package:hotel/Details/data/models/DetailsModel.dart';
import 'package:hotel/MultiOffer/data/models/MultiOfferModel.dart';

import '../../../Core/Error/Failure.dart';

abstract class DetailsRepoDomain
{
  Future<Either<Failures, DetailsModel>> showDetails( List<String> hotelId);

}