import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skhuthon_app/common/color.dart';
import 'package:skhuthon_app/common/widgets/tabBarBase.dart';
import 'package:skhuthon_app/providers/post_provider.dart';

import '../../models/post.dart';

class PostShowScreen extends StatefulWidget {
  const PostShowScreen({super.key});

  @override
  State<PostShowScreen> createState() => _PostShowScreenState();
}

class _PostShowScreenState extends State<PostShowScreen> {
  PostNotifier postNotifier = PostNotifier();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: BASE,
        title: Text('Title'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(30)),
            Container(
                width: 390,
                height: 48,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFFC8C8C8)),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: const Center(
                  child: Text(""),
                )),
            Padding(padding: EdgeInsets.all(20)),
            Container(
                width: 390,
                height: 550,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFFC8C8C8)),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: const Center(
                  child: Text('HIIIH KJEKNSLKJKRJKLE LK EN'),
                )),
          ],
        ),
      ),
      bottomNavigationBar: TabBarBase(),
    );
  }
}
