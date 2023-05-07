import 'package:flutter/material.dart';
import 'package:netninja_worldtime/src/models/time_model.dart';
import 'package:netninja_worldtime/src/pages/choose_location.dart';
import 'package:netninja_worldtime/src/pages/home.dart';
import 'package:netninja_worldtime/src/pages/loading.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => TimeModel(),
    child: MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Loading(),
        '/home': (context) => const Home(),
        '/location': (context) => const ChooseLocation(),
      },
    ),
  ));
}

