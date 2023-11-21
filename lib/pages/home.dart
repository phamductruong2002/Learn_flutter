import 'package:exercise/service/listhome.dart';
import 'package:flutter/material.dart';

class Frame {
  static List<Map<String, String>> itemFrame = [
    {
      'image': 'assets/images.png',
      'title': 'HOW TO PRAY',
    },
    {
      'image': 'assets/images2.png',
      'title': 'WHO IS GOD',
    },
    {
      'image': 'assets/images.png',
      'title': 'HOW TO PRAY',
    },
  ];
}

class Home extends StatefulWidget {
  final List<Map<String, String>> itemFrame;
  final MyListData myListData;

  const Home({super.key, required this.itemFrame, required this.myListData});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, String>> get itemList => widget.myListData.itemList;
  List<Map<String, String>> get itemList2 => widget.myListData.itemList2;
  String profileName = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE1A6),
      body: Container(
        margin: const EdgeInsets.only(top: 35, left: 23),
        child: Column(
          children: [
            GestureDetector(
              onTap: () async {
                final result = await Navigator.pushNamed(context, '/profile');
                if (result != null) {
                  setState(() {
                    profileName = result as String;
                  });
                }
              },
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage('assets/avt.png'),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              profileName,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              'Linden United Methodist C',
                              style: TextStyle(
                                color: Color(0xFFC09A50),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.white,
                              shape: const CircleBorder()),
                          child: const Icon(Icons.search),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.white,
                              shape: const CircleBorder()),
                          child: const Icon(Icons.notifications),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
                width: double.infinity,
                height: 74,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: widget.itemFrame.length,
                    itemBuilder: (BuildContext context, int index) {
                      final isWhoIsGod =
                          widget.itemFrame[index]['title'] == 'WHO IS GOD';
                      return Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              child: Stack(children: [
                                Image.asset(
                                  widget.itemFrame[index]['image'] ?? '',
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                    width: 63,
                                    height: 36,
                                    top: 19,
                                    left: 15,
                                    child: Text(
                                      widget.itemFrame[index]['title'] ?? '',
                                      style: TextStyle(
                                        fontSize: 15,
                                        letterSpacing: -0.17,
                                        fontWeight: FontWeight.bold,
                                        color: isWhoIsGod
                                            ? Colors.black
                                            : Colors.white,
                                      ),
                                    ))
                              ])));
                    })),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 1, left: 0),
                child: TabBarExample(
                    preachingData: ListHome1.getData(),
                    newsData: ListHome2.getData(),
                    communityData: ListHome3.getData()),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TabBarExample extends StatefulWidget {
  final MyListData preachingData;
  final MyListData newsData;
  final MyListData communityData;
  const TabBarExample({
    Key? key,
    required this.preachingData,
    required this.newsData,
    required this.communityData,
  }) : super(key: key);

  @override
  State<TabBarExample> createState() => _TabBarExampleState();
}

class _TabBarExampleState extends State<TabBarExample>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  // List<Map<String, String>> get itemList => widget.myListData.itemList;
  // List<Map<String, String>> get itemList2 => widget.myListData.itemList2;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          unselectedLabelColor: Colors.black,
          controller: tabController,
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: Colors.black,
          labelPadding: const EdgeInsets.only(top: 20, right: 20),
          indicator: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Color(0xFFF6BB22), width: 3))),
          tabs: const [
            Tab(
              child: Text(
                'Preaching',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.17),
              ),
            ),
            Tab(
              child: Text(
                'News',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.17),
              ),
            ),
            Tab(
              child: Text(
                'Community',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.17),
              ),
            ),
          ],
        ),
        Expanded(
          child: TabBarView(controller: tabController, children: [
            SingleChildScrollView(
              child: ListTab1(
                itemList: widget.preachingData.itemList,
                itemList2: widget.preachingData.itemList2,
              ),
            ),
            SingleChildScrollView(
              child: ListTab1(
                itemList: widget.newsData.itemList,
                itemList2: widget.newsData.itemList2,
              ),
            ),
            SingleChildScrollView(
                child: ListTab1(
              itemList: widget.communityData.itemList,
              itemList2: widget.communityData.itemList2,
            ))
          ]),
        )
      ],
    );
  }
}
