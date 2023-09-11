import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/MultiOffer/data/data_sources/DtoMultiOffer.dart';
import 'package:hotel/MultiOffer/presentation/manager/Cubit.dart';
import 'package:hotel/MultiOffer/presentation/manager/states.dart';


class HotelBooking extends StatefulWidget {
static const String RouteName="booking";

  @override
  State<HotelBooking> createState() => _HotelBookingState();
}

class _HotelBookingState extends State<HotelBooking> {
  @override
  Widget build(BuildContext context) {
   // var args= ModalRoute.of(context)!.settings.arguments as List<DataOffer> ;
    late String offerID;
    return BlocProvider<MultiOFFCubit>(
        create: (context) =>
        MultiOFFCubit(RemoteMultiOff())..multiOff(["MCLONGHM"]),   // limited data collections  :See list of valid hotel chains. Test with major cities like LON or NYC.

        child: BlocConsumer<MultiOFFCubit, MultiOfferStates>(
          listener: (context, state) {
            if (state is MultiOfferLoadingStates) {
              showDialog<void>(
                context: context,
                builder: (BuildContext dialogContext) {
                  return const Center(child: CircularProgressIndicator());
                },
              );
            } else if (state is MultiOfferErrorStates) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Error"),
                    content: Text(state.msg),
                  );
                },
              );
            }
            if (state is HotelBookingLoadingStates) {

            } else if (state is HotelBookingErrorStates) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Error"),
                    content: Text(state.msg),
                  );
                },
              );
            }
            else if(state is MultiOfferSuccessStates)
              {
                for(int i=0 ;i<state.modelMultiOffer.data!.length;i++)
                  {
                    setState(() {
                      offerID=state.modelMultiOffer.data![i].offers![i].id??"";
                    });
                      print(offerID);
                    }
                MultiOFFCubit.get(context).hotelB(offerID);
              }

    },
          builder: (context, state) {
            if(state is HotelBookingSuccessStates)
              {
                var listHotelB=state.hotelBookingModel.data;
                return Scaffold(
                    appBar: AppBar(title: const Text("Hotel Booking"),),
                    body:ListView.builder(
                      itemCount: listHotelB!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(20),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black26,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                )
                              ),
                              onPressed: (){
                            AwesomeDialog(
                              context: context,
                              dismissOnTouchOutside: false,
                              animType: AnimType.SCALE,
                              dialogType: DialogType.SUCCES,
                              body: Center(child: Text("ConfirmationId: ${listHotelB[index].providerConfirmationId??""}",
                                style: const TextStyle(fontStyle: FontStyle.italic),
                              ),),
                              btnOkOnPress: () {},
                            ).show();
                          }, child: const Text("Confirm reservation")),
                        );

                      },)
                );
              }
            else
              {
                return CircularProgressIndicator();
              }
          },
        ));




  }
}
