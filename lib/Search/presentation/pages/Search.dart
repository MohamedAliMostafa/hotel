import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/Details/presentation/pages/Details.dart';
import 'package:hotel/Search/data/data_sources/DtoSearch.dart';
import 'package:hotel/Search/presentation/manager/States.dart';

import '../manager/Cubit.dart';

class Search extends StatefulWidget {
static const String RouteName="search";

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {

    return BlocProvider<SearchCubit>(

        create: (context) => SearchCubit(RemoteData()),
      child: BlocConsumer<SearchCubit,SearchStates>(
        listener: (context, state) {
          if(state is SearchLoadingStates)
            {
              showDialog<void>(
                context: context,
                builder: (BuildContext dialogContext) {
                  return const Center(child: CircularProgressIndicator());
                },
              );
            }
          else if(state is SearchErrorStates)
            {
              showDialog(context: context, builder: (context) {
                return  AlertDialog(title: const Text("Error"),
                  content: Text(state.msg),
                );
              },);
            }
          else if( state is SearchSuccessStates)
            {
Navigator.pop(context);
            }

        },
        builder: (context, state) {

          return Scaffold(
            backgroundColor: Colors.black,
            body: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20,right: 20,top: 30),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: TextField(
onSubmitted: (value) {
  setState(() {
    SearchCubit.get(context).SearchControll;
    SearchCubit.get(context).SearchHotel(SearchCubit.get(context).SearchControll.text);
  });
},
                    controller: SearchCubit.get(context).SearchControll,
                    cursorColor: Colors.blue,
                    decoration: InputDecoration(
                        hintText: "SearchByLocation",
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                        focusedBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                        suffixIcon: IconButton(icon: Icon(Icons.search_sharp,color: Colors.black),onPressed: () {
setState(() {
  SearchCubit.get(context).SearchHotel(SearchCubit.get(context).SearchControll.text);
});


                        },)

                    ),
                  ),
                ),
                SearchCubit.get(context).SearchControll.text.isEmpty?Expanded(child: Center(child: Image.asset("assets/images/hotel.png"))):Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                     return  const Divider(thickness: 2,color: Colors.teal,endIndent: 20,indent: 20,);
                    },
                    itemBuilder: (context, index) {
                    var ListHot=SearchCubit.get(context).ListHotels;
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Details.RouteName,arguments: ListHot[index].hotelIds);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Card(
                            shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)
                            ),
                            child:Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Hotel Name : ${ListHot[index].name??""}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 12),),
                                  SizedBox(height: 15,),
                                  Text("City Name : ${ListHot[index].address!.cityName??""}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 12),),
                                ],
                              ),
                            ),

                        ),
                      ),
                    );
                  },itemCount: SearchCubit.get(context).ListHotels.length,),
                )
              ],
            ),
          );
        },
      )
      );
  }
}
