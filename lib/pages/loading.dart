import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
// Map<dynamic, dynamic> data = {'loacation':'India','flag':'india.png','url':'https://timezone.abstractapi.com/v1/current_time/?api_key=2bc075c30c5c47228c0c97c04e1ad623&location=Delhi, India'};
  // Map<dynamic, dynamic> data = {
  //   'location': 'India',
  //   'flag': 'india.jpg',
  //   'url': 'Delhi, India'
  // };
  void setupWorldTime() async {
    // data = data.isNotEmpty
    //     ? data
    //     : ModalRoute.of(context)!.settings.arguments as Map;

    WorldTime instance = WorldTime(location: 'India', flag:'india.png', url: 'Delhi, India');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.result,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    print('init');
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
          child: SpinKitWanderingCubes(
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: index.isEven ? Colors.red : Colors.green,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
