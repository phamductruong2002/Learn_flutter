import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  
  void initState(){
    super.initState();
    Future.delayed(Duration(milliseconds: 300), (){
      Navigator.pushReplacementNamed(context, '/home');
    });
  }  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD9BF8D),
      body: Center(
        child: Image.asset('assets/loading.png'),
      ),      
    );
  }
}