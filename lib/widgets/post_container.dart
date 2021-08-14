import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:test_02/data/data.dart';
import 'package:test_02/models/models.dart';
import 'package:test_02/widgets/profile_avatar.dart';
import 'dart:async';

class PostContainer extends StatefulWidget {
  final Post post;

  const PostContainer({
    Key key,
    @required this.post,
  }) : super(key: key);

  @override
  _PostContainerState createState() => _PostContainerState();
}

class _PostContainerState extends State<PostContainer> {
  bool showHeartOverlay = false;
  _doubleTapped() {
    setState(() {
      showHeartOverlay = true;
      showHeartOverlay = true;
      if (showHeartOverlay) {
        Timer(const Duration(milliseconds: 500), () {
          setState(() {
            showHeartOverlay = false;
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _PostHeader(post: widget.post),
            const SizedBox(
              height: 4.0,
            ),
            Text(widget.post.caption),
            GestureDetector(
              onDoubleTap: () => _doubleTapped(),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  widget.post.imageUrl != null
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: CachedNetworkImage(
                              imageUrl: widget.post.imageUrl),
                        )
                      : const SizedBox.shrink(),
                  showHeartOverlay
                      ? Icon(
                          Icons.favorite,
                          color: Colors.redAccent,
                          size: 80.0,
                        )
                      : Container()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: _PostStats(post: widget.post),
            ),
            Divider(
              height: 2.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              child: Row(
                children: [
                  Icon(MdiIcons.clock),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text('${widget.post.timeAgo} Ago'),
                ],
              ),
            ),
            Divider(
              height: 2.0,
            ),
          ],
        ),
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({
    Key key,
    @required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),
        const SizedBox(
          width: 8.0,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.user.name,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),

            // Row(
            //   children: [
            //     Icon(
            //       Icons.public,
            //       color: Colors.grey[600],
            //       size: 12.0,
            //     ),
            //   ],
            // )
          ],
        )),
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;
  // final int views;

  const _PostStats({
    Key key,
    @required this.post,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // List<bool> _selections = List.generate(1, (_) => true);
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                MdiIcons.eye,
                size: 10.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 4.0,
            ),
            Expanded(
              child: Text(
                '${post.views} Views',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ),
          ],
        ),
        const Divider(),
        Row(
          children: [
            Like_btn(label: '${post.likes}', onTap: () => print('Like')),

            // _PostButton(
            //     icon: Icon(Icons.thumb_up_alt_outlined),
            //     label: 'Likes',
            //     onTap: () => print('Liked')),

            _PostButton(
                icon: Icon(
                  MdiIcons.commentOutline,
                  color: Colors.grey[600],
                  size: 20.0,
                ),
                label: '${post.comments}',
                onTap: () => print('Comment')),
            _PostButton(
                icon: Icon(
                  MdiIcons.shareOutline,
                  color: Colors.grey[600],
                  size: 20.0,
                ),
                label: '${post.shares}',
                onTap: () => print('Share')),
            IconButton(
                icon: Icon(Icons.more_horiz),
                onPressed: () => print('more options')),
          ],
        )
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function onTap;

  const _PostButton({
    Key key,
    @required this.icon,
    @required this.label,
    @required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Container(
              height: 25.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon,
                  const SizedBox(
                    width: 4.0,
                  ),
                  Text(label),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Like_btn extends StatefulWidget {
  final Function onTap;
  final String label;

  const Like_btn({
    Key key,
    @required this.onTap,
    @required this.label,
  }) : super(key: key);

  @override
  _Like_btnState createState() => _Like_btnState();
}

class _Like_btnState extends State<Like_btn> {
  bool liked = false;

  _pressed() {
    setState(() {
      liked = !liked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () => _pressed(),
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0, bottom: 20.0),
            child: Container(
              height: 25.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      icon: Icon(
                        liked ? Icons.thumb_up : Icons.thumb_up_alt_outlined,
                        color:
                            liked ? Colors.blueAccent[700] : Colors.grey[600],
                      ),
                      onPressed: () => _pressed()),
                  const SizedBox(
                    width: 4.0,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 11.0),
                    child: Text(widget.label),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
