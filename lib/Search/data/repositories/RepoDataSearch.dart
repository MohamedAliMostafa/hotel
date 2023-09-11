import 'package:dartz/dartz.dart';
import 'package:hotel/Core/Error/Failure.dart';
import 'package:hotel/Search/data/data_sources/DtoSearch.dart';
import 'package:hotel/Search/data/models/SearchModel.dart';
import 'package:hotel/Search/domain/repositories/RepoDomain.dart';

class RepoDataSearch implements RepoDomainSearch
{
  Dtosearch dtosearch;

  RepoDataSearch(this.dtosearch);

  @override
  Future<Either<Failures, SearchModel>> searchByLocation(String location) =>dtosearch.searchByLocation(location);

}