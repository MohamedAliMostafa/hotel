import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/Search/data/models/SearchModel.dart';
import 'package:hotel/Search/data/repositories/RepoDataSearch.dart';
import 'package:hotel/Search/domain/repositories/RepoDomain.dart';
import 'package:hotel/Search/domain/use_cases/Usecase.dart';
import 'package:hotel/Search/presentation/manager/States.dart';

import '../../data/data_sources/DtoSearch.dart';

class SearchCubit extends Cubit<SearchStates> {
  Dtosearch dtosearch;

  SearchCubit(this.dtosearch) : super(SearchInitStates());

  static SearchCubit get(context) => BlocProvider.of(context);


  var SearchControll=TextEditingController();

  List<Data>ListHotels=[];
   SearchHotel(String location) async {
     emit(SearchLoadingStates());
    RepoDomainSearch repoDomainSearch = RepoDataSearch(dtosearch);
    UseCase useCase = UseCase(repoDomainSearch);
    var res = await useCase.call(location);
    res.fold((l) => emit(SearchErrorStates(l.msg)), (r) {
      ListHotels=r.data!;
      emit(SearchSuccessStates(r));
    });
  }
}