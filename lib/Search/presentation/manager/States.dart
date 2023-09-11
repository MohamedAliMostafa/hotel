import 'package:hotel/Search/data/models/SearchModel.dart';

abstract class SearchStates {
}
class SearchInitStates extends SearchStates{}
class SearchLoadingStates extends SearchStates{}
class SearchSuccessStates extends SearchStates{
  SearchModel modelSearch;

  SearchSuccessStates(this.modelSearch);
}
class SearchErrorStates extends SearchStates{
  String msg;
  SearchErrorStates(this.msg);
}