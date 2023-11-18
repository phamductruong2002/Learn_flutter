import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFD1A6),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 35, left: 23, right: 23),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton.small(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    onPressed: () {},
                    child: Icon(Icons.notifications),
                  ),
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/avt.png'),
                  )
                ],
              ),
              Container(
                width: 329,
                height: 36,
                child: Stack(children: [
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Search churches',
                      hintStyle: TextStyle(color: Color(0xFFCBCBCB)),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide:
                              BorderSide(color: Color(0xFFD99F69), width: 1)),
                      labelText: 'Search churches',
                    ),
                  ),
                  Positioned(
                    width: 33,
                    height: 33,
                    top: 1,
                    left: 280,
                    child: InkWell(
                      onTap: () {},
                      child: Image.asset('assets/icon.png'),
                    ),
                  )
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
