import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:netninja_worldtime/src/pages/loading.dart';

class WorldTime {


    late String location; //location name for the UI
    late String time; //the time in that location in the UI
    late String flag; //url to and sset flag icon
    late String url; //location url for api endpoint
    late bool isDayTime;


    WorldTime(this.location, this.flag, this.url);

    Future<void> getTime() async {

      try{
        Response response = await get(Uri.http('worldtimeapi.org', '/api/timezone/$url'));
        Map data = jsonDecode(response.body);

        // get properties from data
        String datetime = data['datetime'];
        int offsetHours = int.parse(data['utc_offset'].substring(1,3));
        int offsetMinutes = int.parse(data['utc_offset'].substring(4));

        // create datetime object
        DateTime now = DateTime.parse(datetime);
        now = now.add(Duration(hours: offsetHours, minutes: offsetMinutes));

        // set the time property
        time = DateFormat.jm().format(now);
        isDayTime = now.hour > 6 && now.hour < 20;

      } catch (e) {
        print('caught an error: $e');
        time = 'Could not get time data';
      }
    }

    Map<String, dynamic> toMap() {
      return {
        'location': location,
        'flag': flag,
        'time': time,
        'isDayTime': isDayTime,
      };
    }

  

  
}