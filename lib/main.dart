import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:icecream/models/repository/stock_repository.dart';
import 'package:icecream/models/repository/stock_repository_dummy_impl.dart';
import 'package:icecream/views/pages/home_page_widget.dart';

void main() {

  GetIt.instance.registerSingleton<StockRepository>(StockRepositoryImpl());

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
      home: const HomePageWidget(),
    );
  }
}