import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<dynamic, dynamic> data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;

    //String bgImage="";

    String bgImage = data['isDaytime'] ? 'day1.png' : 'night1.png';

    Color bgColor = Colors.black;
    Color text = Colors.black;
    if (data['isDaytime'] == true) {
      bgColor = Color.fromARGB(255, 112, 131, 147);
      text = Color.fromARGB(255, 58, 57, 57);
    } else if (data['isDaytime'] == false) {
      bgColor = const Color.fromARGB(255, 44, 62, 164);
      text = Colors.white;
    }

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/$bgImage'),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 170.0, 0, 0),
            child: Column(children: [
              TextButton.icon(
                onPressed: () async {
                  dynamic result = await Navigator.pushNamed(context, '/local');
                  if (result != null) {
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDaytime': result['isDaytime'],
                        'flag': result['flag']
                      };
                    });
                  }
                },
                icon: Icon(
                  Icons.edit_location,
                  color: Colors.grey,
                  size: 20,
                ),
                label: Text(
                  'Choose location',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  data['location'],
                  style: TextStyle(
                    fontSize: 32.0,
                    letterSpacing: 2.0,
                    color:text,
                  ),
                ),
              ]),
              SizedBox(
                height: 20,
              ),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 50,
                  color:text,
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
