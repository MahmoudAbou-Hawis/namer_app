import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:namer_app/presentation/cubit/FavoriteCubiit.dart';
import 'package:namer_app/presentation/pages/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => FavoriteCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          title: 'Namer App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
          ),
          home:HomePage(),
        ),
    );
  }
}
