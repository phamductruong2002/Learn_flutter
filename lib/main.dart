import 'package:exercise/pages/home.dart';
import 'package:exercise/pages/loading.dart';
import 'package:exercise/pages/profile/profile.dart';
import 'package:exercise/pages/search.dart';
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
    initialRoute: '/',
    routes: {
      '/': (context) => const Loading(),
      '/home': (context) => Home(
            itemFrame: Frame.itemFrame,
            myListData: MyListData.myListData,
          ),
      '/search': (context) => const Search(),
      '/profile': (context) => const Profile(),
    },
  ));
}
