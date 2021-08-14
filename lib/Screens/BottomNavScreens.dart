import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test_02/Screens/screens.dart';
import 'package:test_02/data/data.dart';
import 'package:test_02/models/models.dart';

class TrendingPage extends StatefulWidget {
  @override
  _TrendingPageState createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trending Page'),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 10,
      ),
      body: HomeScreen(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.arrow_upward),
        elevation: 10,
        onPressed: () => print(posts.length),
      ),
    );
  }
}

class People extends StatefulWidget {
  @override
  _PeopleState createState() => _PeopleState();
}

class _PeopleState extends State<People> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('People'),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: FollowPeople(currentUser: currentUser))
          ],
        ));
  }
}

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddScreen'),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 5.0,
      ),
      body: Center(
          child: Text(
        'WELCOME TO ADD SCREEN',
        style: TextStyle(
          fontSize: 30.0,
        ),
      )),
    );
  }
}

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notification',
          style: TextStyle(fontSize: 30.0),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Notification',
          style: TextStyle(fontSize: 30.0),
        ),
      ),
    );
  }
}

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Text('Menu'),
    );
  }
}

class FollowPeople extends StatelessWidget {
  final User currentUser;

  const FollowPeople({
    Key key,
    @required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundColor: Colors.grey[200],
              backgroundImage: CachedNetworkImageProvider(currentUser.imageUrl),
            )
          ],
        ),
      ]),
    );
  }
}
