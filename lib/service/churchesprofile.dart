import 'package:flutter/material.dart';

class MyChurchesData {
  List<Map<String, String>> itemMyChurches;

  MyChurchesData({required this.itemMyChurches});

  static MyChurchesData get myChurchesData => MyChurchesData(
        itemMyChurches: [],
      );
}

class ListChurches {
  static MyChurchesData getData() {
    return MyChurchesData(
      itemMyChurches: [
        {
          'name': 'Linden United Methodist Church',
          'days': '10 days',
          'donate': 'Donations: 12 \$',
          'icon': 'assets/heart.png'
        },
        {
          'name': 'Mariposa Assembly of God Church',
          'days': '34 days',
          'donate': 'Donations: 1 200 \$',
          'icon': 'assets/heart2.png'
        },
        {
          'name': 'Grace Cathedral',
          'days': '120 days',
          'donate': 'Donations: 1 200 \$',
          'icon': 'assets/heart2.png'
        }
      ],
    );
  }
}

class Churches extends StatefulWidget {
  final List<Map<String, String>> itemMyChurches;
  Churches({required this.itemMyChurches});
  @override
  State<Churches> createState() =>
      _ChurchesState(itemMyChurches: itemMyChurches);
}

class _ChurchesState extends State<Churches> {
  final List<Map<String, String>> itemMyChurches;
  _ChurchesState({required this.itemMyChurches});

  @override
  Widget build(BuildContext context) {
    return Container(
        // padding: const EdgeInsets.only(top: 5),
        child: ListView.builder(
            itemCount: itemMyChurches.length,
            itemBuilder: (context, index) {
              final church = itemMyChurches[index];
              return buildListChurches(church);
            }));
  }
}

Widget buildListChurches(Map<String, String> item) {
  bool lindenUnited = item['name'] == 'Linden United Methodist Church';
  return Column(
    children: [
      const Divider(
        color: Color(0xFFBABABA),
        height: 40,
        thickness: 1,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 220,
            height: 48,
            child: Text(
              item['name']!,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: -0.17),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 20),
            child: Text(
              item['days']!,
              style: const TextStyle(
                  fontSize: 15, letterSpacing: -0.17, color: Color(0xFF3A74CC)),
            ),
          )
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            item['donate']!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              letterSpacing: -0.17,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20),
            width: 25,
            height: 21.3,
            child: lindenUnited
                ? Image.asset('assets/heart.png')
                : Image.asset('assets/heart2.png'),
          )
        ],
      )
    ],
  );
}

class TextFieldApp extends StatefulWidget {
  const TextFieldApp({super.key});

  @override
  State<TextFieldApp> createState() => _TextFieldAppState();
}

class _TextFieldAppState extends State<TextFieldApp> {
  TextEditingController? controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textCapitalization: TextCapitalization.sentences,
    );
  }
}
