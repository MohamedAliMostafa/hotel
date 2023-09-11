import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/Details/data/data_sources/DtoDetails.dart';
import 'package:hotel/Details/presentation/manager/StatesDetails.dart';
import '../../../MultiOffer/presentation/pages/HotelBooking.dart';
import '../manager/CubitDetails.dart';

class Details extends StatelessWidget {
  static const String RouteName = "Details";

  @override
  Widget build(BuildContext context) {
     var args= ModalRoute.of(context)!.settings.arguments as List<String>;   // Search Hotel ID
    return BlocProvider<DetailsCubit>(
        create: (context) =>
            DetailsCubit(RemoteDetails())..showDetails(["BBLONBTL"]),   //Hotel Ratings data available in the test environment  Link ::https://developers.amadeus.com/self-service/category/hotels/api-doc/hotel-ratings
        child: BlocConsumer<DetailsCubit, DetailsStates>(
          listener: (context, state) {
            if (state is DetailsLoadingStates) {
              showDialog<void>(
                context: context,
                builder: (BuildContext dialogContext) {
                  return const Center(child: CircularProgressIndicator());
                },
              );
            } else if (state is DetailsErrorStates) {
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

          },
          builder: (context, state) {
            var list = DetailsCubit.get(context).ListDetails;
            var listwarn = DetailsCubit.get(context).ListWarn;
            return Scaffold(
              appBar: AppBar(
                title: Text("Details"),
              ),
              body: list.isEmpty
                  ? ListView.builder(
                      itemCount: listwarn.length,
                      itemBuilder: (context, index) {
                        return AlertDialog(
                          title: Text("Warning"),
                          content: Text(listwarn[index].detail.toString()),
                        );
                      },
                    )
                  : ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            elevation: 2,
                            color: Colors.teal,
                            child: Column(
                              children: [
                                Text(
                                  "overallRating: ${list[index].overallRating}",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "numberOfReviews: ${list[index].numberOfReviews} ",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "numberOfRatings: ${list[index].numberOfRatings}",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                    "staff: ${list[index].sentiments!.staff}",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                  "roomComforts: ${list[index].sentiments!.roomComforts}",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "valueForMoney: ${list[index].sentiments!.valueForMoney}",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(15))),
                                    onPressed: () {
                                      Navigator.pushReplacementNamed(context, HotelBooking.RouteName,);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: const [
                                        Text("Hotel Booking"),
                                        Icon(Icons
                                            .local_grocery_store_outlined),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            );
          },
        ));
  }
}
