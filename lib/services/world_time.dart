import 'package:http/http.dart' show Response, get;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location ='India'; // location name for UI
  String result = ""; // the time in that location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint
  late bool isDaytime;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    // make the request
    try {
      Response response =
          await get(Uri.parse('https://timezone.abstractapi.com/v1/current_time/?api_key=2bc075c30c5c47228c0c97c04e1ad623&location=$url'));
      Map data = jsonDecode(response.body);

      // get properties from json
      String datetime = data['datetime'];
     // int offset = data['gmt_offset'];
     // int hours = int.parse(offset.substring(1, 3));
      //int minutes = int.parse(offset.substring(4, 6));

      // if (offset[0] == '-') {
      //   hours = -hours;
      //   minutes = -minutes;
      // }
      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      //now = now.add(Duration(hours:offset, ));
      print(now);
      isDaytime = data['is_dst'];
      // set the time property
      result = DateFormat.jm().format(now);
      //result = 'hii this is test code';
    } catch (e) {
      result = 'not find time data';

      isDaytime = true;
    }
  }
}

// WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');