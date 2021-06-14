import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data ={};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;

    //set background
    String bgImage= data['isDayTime'] ? 'day.png' : 'night.jpg';
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.black12;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: <Widget>[
                // ignore: deprecated_member_use
                FlatButton.icon(
                    onPressed: () {
                      dynamic result = Navigator.pushNamed(context, '/choose_location');
                      if(result !=null){
                        setState(() {
                          data = {
                            // 'time' = result['time'],
                            // 'location' = result['location'],
                            // 'isDaytime' = result['isDayTime'],
                            // 'flag' = result['flag'],
                          } as Map ;
                        });
                      }
                    },
                    icon: Icon(
                        Icons.edit_location,
                      color: Colors.white,
                    ),
                    label: Text(
                        'Edit Location',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        data['location'],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          letterSpacing: 3.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                    data['time'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 66.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
