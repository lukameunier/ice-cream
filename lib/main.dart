import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:icecream/models/repository/icecream_repository.dart';
import 'package:icecream/models/repository/icecream_repository_dummy_impl.dart';
import 'package:icecream/views/button_widget.dart';
import 'package:icecream/views/flavours_widget.dart';

void main() {

  GetIt.instance.registerSingleton<IcecreamRepository>(IcecreamRepositoryDummyImpl());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const FlavoursWidget(),
    );
  }
}