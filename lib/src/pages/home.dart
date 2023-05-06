import 'package:flutter/material.dart';
import 'package:netninja_worldtime/src/models/time_model.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {
    final timeModel = Provider.of<TimeModel>(context);
    // data = ModalRoute.of(context)?.settings.arguments as Map;
    final dynamic data = timeModel.time.toMap();
    print(data);

    // set background
    String bgImage = data['isDayTime'] ? 'day.png': 'night.png';
    Color bgColor = data['isDayTime'] ? Colors.blue: Colors.indigo[700] as Color;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/$bgImage'),
              fit: BoxFit.cover
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/location');
                  }, 
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300]
                  ), 
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: Colors.grey[300]
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: const TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: const TextStyle(
                    fontSize: 56.0,
                    color: Colors.white
                  ),
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}