import 'package:flutter/material.dart';

class MyEventData {
  List<Map<String, String>> itemEvent;
  List<Map<String, String>> itemEvent2;

  MyEventData({required this.itemEvent, required this.itemEvent2});

  static MyEventData get myEventData => MyEventData(
        itemEvent: [],
        itemEvent2: [],
      );
}

class ListEvent {
  static MyEventData getData() {
    return MyEventData(itemEvent: [
      {'name': 'Event name', 'time': '09:30 - 10:00'},
      {'name': 'Event name', 'time': '10:00 - 10:30'},
      {'name': 'Event name', 'time': '11:00 - 11:40'}
    ], itemEvent2: [
      {'name': 'Event name', 'time': '09:30 - 10:00'},
      {'name': 'Event name', 'time': '10:00 - 10:30'},
      {'name': 'Event name', 'time': '11:00 - 11:40'}
    ]);
  }
}

class Event extends StatefulWidget {
  final List<Map<String, String>> itemEvent;
  final List<Map<String, String>> itemEvent2;

  Event({required this.itemEvent, required this.itemEvent2});

  @override
  State<Event> createState() => _EventState();
}

class _EventState extends State<Event> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        children: [
          buildEvent(widget.itemEvent, '17 September'),
          const SizedBox(
            height: 30,
          ),
          buildEvent(widget.itemEvent2, '21 September'),
        ],
      ),
    );
  }
}

Widget buildEvent(List<Map<String, String>> list, String title) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          letterSpacing: -0.17,
          color: Color(0xFFC09A50),
        ),
      ),
      ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return buildListEvent(list[index]);
        },
      ),
    ],
  );
}

Widget buildListEvent(Map<String, String> item) {
  return Container(
    padding: const EdgeInsets.only(top: 15),
    width: 100,
    height: 73,
    decoration: const BoxDecoration(
      border: Border(
        top: BorderSide(width: 1, color: Color(0xFFDE8A68)),
      ),
    ),
    child: Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item['name']!),
            Row(
              children: [
                Text(
                  item['time']!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      letterSpacing: -0.17),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Icon(Icons.access_time),
                SizedBox(
                  width: 23,
                  height: 19,
                  child: Image.asset('assets/thongbao.png'),
                )
              ],
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(left: 125, bottom: 15),
          width: 89,
          height: 33,
          child: TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              onPressed: () {},
              child: const Text('Cancel')),
        )
      ],
    ),
  );
}
