import 'package:flutter/material.dart';
import 'package:test_02/data/data.dart';
import 'package:test_02/models/models.dart';
import 'package:test_02/widgets/post_container.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            final Post post = posts[index];
            return PostContainer(post: post);
          }, childCount: posts.length)),
        ],
      ),
    );
  }
}
