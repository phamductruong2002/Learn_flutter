import 'package:exercise/service/churchesprofile.dart';
import 'package:exercise/service/eventsprofile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Profile extends StatefulWidget {
  final MyEventData myEventData;
  final MyChurchesData myChurchesData;

  Profile({required this.myEventData, required this.myChurchesData});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<Map<String, String>> get itemList => widget.myEventData.itemEvent;
  List<Map<String, String>> get itemList2 => widget.myEventData.itemEvent2;
  List<Map<String, String>> get itemListChurch =>
      widget.myChurchesData.itemMyChurches;
  var textName = ''.;

  void setName(String name) {
    setState(() {
      textName = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(ModalRoute.of(context)!.settings.arguments);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.only(top: 45, left: 23),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/avt.png'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      textName,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          letterSpacing: -0.17),
                    ),
                    const Text(
                      'Linden United Methodist C',
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: -0.17,
                          color: Color(0xFF686868)),
                    )
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                FloatingActionButton.small(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  onPressed: () {},
                  child: const Icon(Icons.search),
                ),
                FloatingActionButton.small(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  onPressed: () {},
                  child: const Icon(Icons.notifications),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 15, right: 50),
              width: 176,
              height: 20,
              child: const Text(
                'Donations: 2412\$',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    letterSpacing: -0.17),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 1, left: 0),
                child: TabBarExample(
                  setName: setName,
                  textName: textName,
                  
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TabBarExample extends StatefulWidget {
  final String textName;
  final ValueChanged<String> setName;
  const TabBarExample(
      {Key? key,
      
      required this.setName, required this.textName})
      : super(key: key);

  @override
  State<TabBarExample> createState() => _TabBarExampleState();
}

class _TabBarExampleState extends State<TabBarExample>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final myEvents = ListEvent.getData();
    final myChurch = ListChurches.getData();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TabBar(
          unselectedLabelColor: Colors.black,
          controller: tabController,
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: Colors.black,
          labelPadding: const EdgeInsets.fromLTRB(0, 20, 30, 0),
          indicator: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Color(0xFF194DD1), width: 3))),
          tabs: const [
            Tab(
              child: Text(
                'Profile',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.17),
              ),
            ),
            Tab(
              child: Text(
                'My events',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.17),
              ),
            ),
            Tab(
              child: Text(
                'My churches',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.17),
              ),
            ),
          ],
        ),
        Expanded(
            child: TabBarView(controller: tabController, children: [
          //List Profile
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(right: 23, top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    decoration: const InputDecoration(hintText: 'Name'),
                    controller: controller,
                    // onChanged: (value) {
                    //   widget.setName(value);
                    // },
                    textCapitalization: TextCapitalization.words,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextField(),
                  const TextField(),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextField(),
                  const SizedBox(
                    height: 30,
                  ),
                  const TextField(),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextField(),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(onPressed: () {
                        widget.setName(controller.text);
                      }, child: const Text('Save')),
                      ElevatedButton(
                        onPressed: (){
                          Navigator.of(context).pop(widget.textName);
                        }, 
                        child: Text('Back'))
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Stack(children: [
                          Container(
                            color: Colors.black,
                            width: 156,
                            height: 89,
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 30, left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  ' **** **** **** 2556',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      letterSpacing: -0.17),
                                ),
                                SizedBox(
                                    width: 26,
                                    height: 26,
                                    child: Image.asset('assets/mastercard.png'))
                              ],
                            ),
                          )
                        ]),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Stack(alignment: Alignment.center, children: [
                          Container(
                            color: const Color(0xFF6FCFF8),
                            width: 156,
                            height: 89,
                          ),
                          SizedBox(
                              width: 22,
                              height: 22,
                              child: Image.asset('assets/Group2.png'))
                        ]),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          // List My events
          SingleChildScrollView(
            child: Event(
                itemEvent: myEvents.itemEvent, itemEvent2: myEvents.itemEvent2),
          ),

          //List My churches
          Churches(
            itemMyChurches: myChurch.itemMyChurches,
          )
        ]))
      ],
    );
  }
}


