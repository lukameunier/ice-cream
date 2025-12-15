import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:icecream/models/repository/stock_repository.dart';
import 'package:icecream/models/repository/stock_repository_dummy_impl.dart';
import 'package:icecream/presenters/home_page_presenter.dart';
import 'package:icecream/views/pages/details_page_widget.dart';
import 'package:icecream/views/pages/home_page_widget.dart';
import 'package:provider/provider.dart';

void main() {
  GetIt.instance.registerSingleton<StockRepository>(StockRepositoryImpl());

  runApp(
    ChangeNotifierProvider(
      create: (_) => HomePagePresenter(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Icecream Factory',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePageWidget(),
        '/details': (context) => DetailsPageWidget(),
      },
    );
  }
}
