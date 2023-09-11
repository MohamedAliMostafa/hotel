import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/MultiOffer/data/data_sources/DtoMultiOffer.dart';
import 'package:hotel/MultiOffer/data/repositories/MultiRepoData.dart';
import 'package:hotel/MultiOffer/domain/repositories/MultiReoDomain.dart';
import 'package:hotel/MultiOffer/domain/use_cases/UseCaseMulti.dart';
import 'package:hotel/MultiOffer/presentation/manager/states.dart';

import '../../data/models/HotelBookingModel.dart';
import '../../data/models/MultiOfferModel.dart';

class MultiOFFCubit extends Cubit<MultiOfferStates> {
  DtoMultiOffer dtoMultiOffer;

 MultiOFFCubit(this.dtoMultiOffer) : super(MultiOfferInitStates());

  static MultiOFFCubit get(context) => BlocProvider.of(context);


  List<DataOffer> dataOff=[];
  multiOff( List<String> hotelId)
  async {
    emit(MultiOfferLoadingStates());
    MutiRepoD mutiRepoD=MultiRepoData(dtoMultiOffer);
    UseCaseMultiOffer useCaseMultiOffer=UseCaseMultiOffer(mutiRepoD);
    var res= await useCaseMultiOffer.execute(hotelId);
    res.fold((l) => emit(MultiOfferErrorStates(l.msg)), (r) {
      dataOff=r.data!;

      emit(MultiOfferSuccessStates(r));
    });
  }




  List<BookingData>d=[];
  hotelB( String offerId)
  async {
    emit(HotelBookingLoadingStates());
    MutiRepoD mutiRepoD=MultiRepoData(dtoMultiOffer);
    UseCaseMultiOffer useCaseMultiOffer=UseCaseMultiOffer(mutiRepoD);
    var res= await useCaseMultiOffer.call(offerId);
    res.fold((l) => emit(HotelBookingErrorStates(l.msg)), (r) {
    d=r.data!;
      emit(HotelBookingSuccessStates(r));
    });
  }
}