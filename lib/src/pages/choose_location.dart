import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:netninja_worldtime/src/models/time_model.dart';
import 'package:netninja_worldtime/src/services/world_time.dart';
import 'package:provider/provider.dart';


class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
    debugPrint('Choose location initstate function run');
  }

  @override
  void dispose() {
    debugPrint('Choose location dispose function run');
    super.dispose();
  }

  @override
  build(BuildContext context) {
    final timeModel = Provider.of<TimeModel>(context, listen: false);
    List<WorldTime> locations = [
	    WorldTime('London','united-kingdom','Europe/London'),
      WorldTime('Athens','greece','Europe/Athens'),
      WorldTime('Cairo','egypt','Africa/Cairo'),
      WorldTime('Nairobi','kenya','Africa/Nairobi'),
      WorldTime('Chicago','united-states-of-america','America/Chicago'),
      WorldTime('NewYork','united-states-of-america','America/New_York'),
      WorldTime('Tokyo', 'japan', 'Asia/Tokyo'),
      WorldTime('Seoul','south-korea','Asia/Seoul'),
      WorldTime('Jakarta','indonesia','Asia/Jakarta'),
	  ];

    void updateTime(int index) async {
      WorldTime worldTime = locations[index];
      await worldTime.getTime();
      timeModel.time = worldTime;
    }

    debugPrint('Choose location build function run');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: const Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage('https://cdn.countryflags.com/thumbs/${locations[index].flag}/flag-square-250.png'),
                ),
                onTap: () {
                  updateTime(index);
                  //navigate to home screen
                  Navigator.pop(context);
                },
              ),
            ),
          );
        },
      )
    );
  }
}