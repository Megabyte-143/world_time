import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location='';   //location name for UI
  String time='' ;       //the time in that location
  String flag=''  ;         //url to an asset flag icon
  String url='';        //location url for api endpoint
  bool isDayTime = false; //true or false if day time or not

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {

    try {

      //make the request
      Response response = await get (Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      //print(data);

      // get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      String offsetmin = data['utc_offset'].substring(4,6);
      // print(datetime);
      // print(offset);
      // print(offsetmin);

      //create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset), minutes: int.parse(offsetmin)));

      //set the time property
      isDayTime = (now.hour > 6 && now.hour <20) ? true : false;
      time = DateFormat('kk:mm').format(now);

    }
    catch(e) {
      print('caught error " $e');
      time ='could not get time data';
    }




  }


}
