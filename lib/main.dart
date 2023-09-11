import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'Core/Utilis/Observer/Observer.dart';
import 'Routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  runApp( MyApp());
}

