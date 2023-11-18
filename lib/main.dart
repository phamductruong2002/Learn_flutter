import 'package:exercise/pages/home.dart';
import 'package:exercise/pages/loading.dart';
import 'package:exercise/pages/profile.dart';
import 'package:exercise/pages/search.dart';
import 'package:exercise/service/churchesprofile.dart';
import 'package:exercise/service/eventsprofile.dart';
import 'package:exercise/service/listhome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // home: Profile(
    //   myEventData: MyEventData.myEventData,
    //   myChurchesData: MyChurchesData.myChurchesData,
    // ),
    // Home(
    //   itemFrame: Frame.itemFrame,
    //   myListData: MyListData.myListData) ,
     initialRoute: '/profile',
     routes: {
       '/':(context) => Loading(),
       '/home':(context) => Home(itemFrame: Frame.itemFrame,
      myListData: MyListData.myListData),
       '/search':(context) => Search(),
       '/profile':(context) => Profile(myEventData: MyEventData.myEventData, myChurchesData: MyChurchesData.myChurchesData,)
     },
  ));
}
