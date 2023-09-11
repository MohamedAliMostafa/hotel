import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/Details/data/data_sources/DtoDetails.dart';
import 'package:hotel/Details/data/repositories/RepoData.dart';
import 'package:hotel/Details/domain/repositories/DetailsReoDomain.dart';
import 'package:hotel/Details/domain/use_cases/UseCaseDetails.dart';
import 'package:hotel/Details/presentation/manager/StatesDetails.dart';

import '../../data/models/DetailsModel.dart';
import '../../../MultiOffer/data/models/MultiOfferModel.dart';

class DetailsCubit extends Cubit<DetailsStates>
{
  DtoDetails dtoDetails;
  DetailsCubit(this.dtoDetails) : super(DetailsInitStates());

  static DetailsCubit get(context) => BlocProvider.of(context);

List<DetailsData>ListDetails=[];
  List<Warnings> ListWarn=[];
  showDetails( List<String> hotelId)
  async {
    emit(DetailsLoadingStates());
    DetailsRepoDomain detailsRepoDomain=RepoDataDetails(dtoDetails);
    UseCaseDetails useCaseDetails=UseCaseDetails(detailsRepoDomain);
    var res= await useCaseDetails.call(hotelId);
    res.fold((l) => emit(DetailsErrorStates(l.msg)), (r) {
     try{
          ListDetails=r.data!;
        }
      catch(e){
        ListWarn=r.warnings!;
      }
      emit(DetailsSuccessStates(r));
    });
  }




}