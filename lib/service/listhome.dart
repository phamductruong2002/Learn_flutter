import 'package:flutter/material.dart';

// Danh sách dữ liệu chung
class MyListData {
  List<Map<String, String>> itemList;
  List<Map<String, String>> itemList2;

  MyListData({required this.itemList, required this.itemList2});

static MyListData get myListData => MyListData(
    itemList: [], 
    itemList2: [], 
  );
}

// Dữ liệu List1
class ListHome1 {
  static MyListData getData() {
    return MyListData(itemList: [
      {
        'image': 'assets/Scrim.png',
        'title': 'Linden United Methodist Church',
        'time': '9:00 - 11:00',
        'description':
            'Westside’s mission is To Make Jesus Known. Jesus calls us to go and make',
      },
      {
        'image': 'assets/Scrim2.png',
        'title': 'Grace Community Church',
        'time': '9:00 - 11:00',
        'description':
            'God also calls us to the “ends of the earth,” or to global missions. There are',
      },
      {
        'image': 'assets/Scrim3.png',
        'title': 'Grace Cathedral',
        'time': '9:00 - 11:00',
        'description':
            'God also calls us to the “ends of the earth,” or to global missions. There are',
      },
      {
        'image': 'assets/Scrim4.png',
        'title': 'Mariposa Assembly of God Church',
        'time': '9:00 - 11:00',
        'description':
            'God also calls us to the “ends of the earth,” or to global missions. There are',
      },
    ], itemList2: [
      {
        'image': 'assets/Scrim2.png',
        'title': 'Linden United Methodist Church',
        'time': '9:00 - 11:00',
        'description':
            'Westside’s mission is To Make Jesus Known. Jesus calls us to go and make',
      },
      {
        'image': 'assets/Scrim5.png',
        'title': 'Grace Community Church',
        'time': '9:00 - 11:00',
        'description':
            'God also calls us to the “ends of the earth,” or to global missions. There are',
      },
      {
        'image': 'assets/Scrim4.png',
        'title': 'Mariposa Assembly of God Church',
        'time': '9:00 - 11:00',
        'description':
            'God also calls us to the “ends of the earth,” or to global missions. There are',
      },
    ]);
  }
}

// Dữ liệu List 2
class ListHome2 {
  static MyListData getData() {
    return MyListData(itemList: [
      
      {
        'image': 'assets/Scrim2.png',
        'title': 'Grace Community Church',
        'time': '9:00 - 11:00',
        'description':
            'God also calls us to the “ends of the earth,” or to global missions. There are',
      },
      {
        'image': 'assets/Scrim3.png',
        'title': 'Grace Cathedral',
        'time': '9:00 - 11:00',
        'description':
            'God also calls us to the “ends of the earth,” or to global missions. There are',
      },
      {
        'image': 'assets/Scrim4.png',
        'title': 'Mariposa Assembly of God Church',
        'time': '9:00 - 11:00',
        'description':
            'God also calls us to the “ends of the earth,” or to global missions. There are',
      },
    ], itemList2: [
      {
        'image': 'assets/Scrim2.png',
        'title': 'Linden United Methodist Church',
        'time': '9:00 - 11:00',
        'description':
            'Westside’s mission is To Make Jesus Known. Jesus calls us to go and make',
      },

      {
        'image': 'assets/Scrim4.png',
        'title': 'Mariposa Assembly of God Church',
        'time': '9:00 - 11:00',
        'description':
            'God also calls us to the “ends of the earth,” or to global missions. There are',
      },
    ]);
  }
}

// Dữ liệu List 3
class ListHome3 {
  static MyListData getData() {
    return MyListData(itemList: [
      {
        'image': 'assets/Scrim4.png',
        'title': 'Mariposa Assembly of God Church',
        'time': '9:00 - 11:00',
        'description':
            'God also calls us to the “ends of the earth,” or to global missions. There are',
      },
    ], itemList2: [
      {
        'image': 'assets/Scrim2.png',
        'title': 'Linden United Methodist Church',
        'time': '9:00 - 11:00',
        'description':
            'Westside’s mission is To Make Jesus Known. Jesus calls us to go and make',
      },
      
      {
        'image': 'assets/Scrim4.png',
        'title': 'Mariposa Assembly of God Church',
        'time': '9:00 - 11:00',
        'description':
            'God also calls us to the “ends of the earth,” or to global missions. There are',
      },
    ]);
  }
}

class ListTab1 extends StatefulWidget {
  final List<Map<String, String>> itemList;
  final List<Map<String, String>> itemList2;

  ListTab1({required this.itemList, required this.itemList2});

  // static MyListData getData(){
  //   return MyListData(itemList: [], itemList2: []);
  // }

  @override
  State<ListTab1> createState() => _ListTabState();
}

class _ListTabState extends State<ListTab1> {
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Column(
        children: [
          buildGroup(widget.itemList, 'Yesterday'),
          const SizedBox(
            height: 30,
          ),
          buildGroup(widget.itemList2, 'Tomorrow'),
        ],
      ),
    );
  }
}

Widget buildGroup(List<Map<String, String>> list, String title) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          letterSpacing: -0.17,
          color: Color(0xFFC09A50),
        ),
      ),
      ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return buildListItem(list[index]);
        },
      ),
    ],
  );
}

Widget buildListItem(Map<String, String> item) {
  return Container(
    width: double.infinity,
    height: 93,
    decoration: const BoxDecoration(
      border: Border(
        top: BorderSide(width: 1, color: Color(0xFFDEC390)),
        bottom: BorderSide(width: 1, color: Color(0xFFDEC390)),
      ),
    ),
    child: SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(item['image']!),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 7),
                    width: 150,
                    height: 44,
                    child: Text(
                      item['title']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        letterSpacing: -0.41,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 7, left: 80),
                    height: 18,
                    child: Text(
                      item['time']!,
                      style: const TextStyle(
                        fontSize: 15,
                        letterSpacing: -0.24,
                        color: Color(0xFFC09A50),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 260,
                height: 36,
                child: Text(
                  item['description']!,
                  style: const TextStyle(
                    fontSize: 15,
                    letterSpacing: -0.24,
                    color: Color(0xFFC09A50),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
