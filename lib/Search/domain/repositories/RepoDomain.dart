import 'package:dartz/dartz.dart';
import 'package:hotel/Search/data/models/SearchModel.dart';

import '../../../Core/Error/Failure.dart';

abstract class RepoDomainSearch {
  Future<Either<Failures, SearchModel>> searchByLocation(String location);
}