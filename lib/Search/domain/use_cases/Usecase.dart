import 'package:dartz/dartz.dart';
import 'package:hotel/Search/data/models/SearchModel.dart';
import 'package:hotel/Search/domain/repositories/RepoDomain.dart';

import '../../../Core/Error/Failure.dart';

class UseCase
{
  RepoDomainSearch repoDomainSearch;

  UseCase(this.repoDomainSearch);
  Future<Either<Failures,SearchModel>> call(String loc)=>repoDomainSearch.searchByLocation(loc);
}