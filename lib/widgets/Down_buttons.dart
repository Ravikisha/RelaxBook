import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Bottomnavbar extends StatefulWidget {
  @override
  _BottomnavbarState createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: [
          Icon(
            Icons.explore,
            size: 30.0,
          ),
          Icon(
            Icons.people,
            size: 30.0,
          ),
          Icon(
            Icons.add,
            size: 30.0,
          ),
          Icon(
            Icons.notifications,
            size: 30.0,
          ),
          Icon(
            Icons.settings,
            size: 30.0,
          ),
        ],
        color: Colors.white70,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
        animationCurve: Curves.easeInOutBack,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }
}

// Widget _buildbottumbar() {
//   GlobalKey _bottomNavigationKey = GlobalKey();
//   return CurvedNavigationBar(
//     key: _bottomNavigationKey,
//     index: 0,
//     height: 50.0,
//     items: [
//       Icon(
//         Icons.explore,
//         size: 30.0,
//       ),
//       Icon(
//         Icons.people,
//         size: 30.0,
//       ),
//       Icon(
//         Icons.add,
//         size: 30.0,
//       ),
//       Icon(
//         Icons.notifications,
//         size: 30.0,
//       ),
//       Icon(
//         Icons.settings,
//         size: 30.0,
//       ),
//     ],
//     color: Colors.white,
//     buttonBackgroundColor: Colors.white,
//     backgroundColor: Colors.blueAccent,
//     animationCurve: Curves.easeInOut,
//     animationDuration: Duration(milliseconds: 600),
//     onTap: (index) {
//       setState(() {
//         _page = index;
//       });
//     },
//   );
// }
