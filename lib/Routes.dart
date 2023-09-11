import 'package:flutter/material.dart';
import 'package:hotel/Details/presentation/pages/Details.dart';
import 'package:hotel/Search/presentation/pages/Search.dart';

import 'MultiOffer/presentation/pages/HotelBooking.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Search.RouteName,
      routes: {
        Details.RouteName:(context)=>Details(),
        Search.RouteName:(context)=>Search(),
        HotelBooking.RouteName:(context)=>HotelBooking()
      },
    );
  }
}