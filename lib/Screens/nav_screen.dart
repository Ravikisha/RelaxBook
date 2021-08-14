import 'package:flutter/material.dart';
import 'package:test_02/Screens/BottomNavScreens.dart';
import 'package:test_02/widgets/routes_animation.dart';
import 'homescreen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    Scaffold(
      body: Text('helloo world'),
    ),
    Scaffold(
      body: Text('hello world33'),
    ),
    Scaffold(
      body: Text('hello world33333'),
    ),
    Scaffold(
      body: Text('hello world3345444'),
    ),
  ];
  final List<IconData> _icons = const [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 30.0,
                ),
                onPressed: () => print('searcing')),
            IconButton(
                icon: Icon(
                  Icons.account_box_outlined,
                  color: Colors.black,
                  size: 30.0,
                ),
                onPressed: () => print('Account')),
            IconButton(
                icon: Icon(
                  Icons.chat,
                  color: Colors.black,
                  size: 30.0,
                ),
                onPressed: () => print('chat'))
          ],
          elevation: 5.0,
          backgroundColor: Colors.white,
          title: Text(
            'Relax',
            style: TextStyle(color: Colors.black, fontSize: 30.0),
          ),
          bottom: TabBar(
            indicatorPadding: EdgeInsets.zero,
            indicator: BoxDecoration(
                border:
                    Border(top: BorderSide(color: Colors.black, width: 3.0))),
            tabs: _icons
                .asMap()
                .map((i, e) => MapEntry(
                    i,
                    Tab(
                      icon: Icon(
                        e,
                        color:
                            i == _selectedIndex ? Colors.black : Colors.black45,
                        size: 30.0,
                      ),
                    )))
                .values
                .toList(),
            onTap: (index) => setState(() => _selectedIndex = index),
          ),
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Container(
            height: 50,
            color: Colors.white,
            child: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton.icon(
                      onPressed: () => Navigator.push(
                          context,
                          Routes_animation(
                              widget: TrendingPage(),
                              alignment: Alignment.bottomLeft)),
                      icon: const Icon(
                        Icons.explore,
                        color: Colors.black,
                        size: 30.0,
                      ),
                      label: Text('')),
                  // SizedBox(
                  //   width: 3.0,
                  // ),
                  FlatButton.icon(
                      onPressed: () => Navigator.push(
                          context,
                          Routes_animation(
                              widget: People(),
                              alignment: Alignment.lerp(Alignment.bottomLeft,
                                  Alignment.bottomCenter, 0.7))),
                      icon: const Icon(
                        Icons.people,
                        size: 30.0,
                        color: Colors.black,
                      ),
                      label: Text('')),

                  // SizedBox(
                  //   width: 3.0,
                  // ),
                  // FloatingActionButton(
                  //   onPressed: () => print('add'),
                  //   backgroundColor: Colors.black,
                  //   hoverColor: Colors.white,
                  //   focusElevation: 20.0,
                  //   child: Icon(Icons.add),
                  // ),
                  // SizedBox(
                  //   width: 3.0,
                  // ),
                  FlatButton.icon(
                      onPressed: () => Navigator.push(
                          context,
                          Routes_animation(
                              widget: NotificationScreen(),
                              alignment: Alignment.lerp(Alignment.bottomRight,
                                  Alignment.bottomCenter, 0.7))),
                      icon: const Icon(
                        Icons.notifications,
                        size: 30.0,
                        color: Colors.black,
                      ),
                      label: Text('')),
                  // SizedBox(
                  //   width: 3.0,
                  // ),
                  FlatButton.icon(
                    onPressed: () => Navigator.push(
                        context,
                        Routes_animation(
                            widget: Menu(),
                            alignment: Alignment.lerp(Alignment.bottomRight,
                                Alignment.bottomCenter, 0.7))),
                    icon: const Icon(
                      Icons.menu,
                      size: 30.0,
                      color: Colors.black,
                    ),
                    label: Text(''),
                  ),
                  // SizedBox(
                  //   width: 3.0,
                  // ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(right: 20.0, bottom: 0.0),
          child: new FloatingActionButton(
            onPressed: () => Navigator.push(
                context,
                Routes_animation(
                    widget: AddScreen(), alignment: Alignment.bottomCenter)),
            child: Icon(Icons.add),
            backgroundColor: Colors.black,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      ),
    );
  }
}
