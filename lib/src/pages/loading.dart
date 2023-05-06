import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:netninja_worldtime/src/models/time_model.dart';
import 'package:netninja_worldtime/src/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';


class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'Loading...';

  void setupWorldTime() async{
    WorldTime worldTime = WorldTime('Tokyo', 'japan', 'Asia/Tokyo');
    await worldTime.getTime();
    final timeModel = Provider.of<TimeModel>(context, listen: false);
    timeModel.time = worldTime;
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  void initState() {
    print('Loading initstate function run');
    super.initState();
    setupWorldTime();
  }

  @override
  void dispose() {
    print('Loading dispose function run');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 80.0,
        ),
      )
    );
  }
}