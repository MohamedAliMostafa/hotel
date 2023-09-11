import 'package:dartz/dartz.dart';
import 'package:hotel/Core/Error/Failure.dart';
import 'package:hotel/Details/data/data_sources/DtoDetails.dart';
import 'package:hotel/Details/data/models/DetailsModel.dart';
import 'package:hotel/MultiOffer/data/models/MultiOfferModel.dart';
import 'package:hotel/Details/domain/repositories/DetailsReoDomain.dart';

class RepoDataDetails implements DetailsRepoDomain
{
  DtoDetails details;

  RepoDataDetails(this.details);

  @override
  Future<Either<Failures, DetailsModel>> showDetails( List<String> hotelId) =>details.showDetails(hotelId);


}