import 'package:flutter/material.dart';

import '../services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Delhi, India', location: 'India', flag: 'india.png'),
    WorldTime(url: 'London, UK', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Tokyo, Japan', location: 'Japan', flag: 'japan.png'),
    WorldTime(url: 'Singapore, Asia', location: 'Singapore', flag: 'singapore.png'),
    WorldTime(url: 'Beijing, China', location: 'China', flag: 'china.png'),
    WorldTime(url: 'Paris, France', location: 'Paris', flag: 'france.png'),
    WorldTime(url: 'America, USA', location: 'America', flag: 'usa.jpg'),
    WorldTime(url: 'Dubai, UAE', location: 'Dubai', flag: 'uae.png'),
    WorldTime(url: 'Moscow, Russia', location: 'Mosocow', flag: 'russia.png'),
  ];
  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.result,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('images/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
