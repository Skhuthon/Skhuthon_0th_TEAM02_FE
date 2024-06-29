import 'package:flutter/material.dart';
import 'package:skhuthon_app/common/widgets/tabBarBase.dart';

class FriendPostScreen extends StatefulWidget {
  const FriendPostScreen({super.key});

  @override
  State<FriendPostScreen> createState() => _FriendPostScreenState();
}

class _FriendPostScreenState extends State<FriendPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Friends_Post',

      )),
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
                    side: BorderSide(width: 1, color: Color(0xFFC8C8C8)),
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
            Padding(padding: EdgeInsets.all(20)),
            Container(
                width: 390,
                height: 550,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFFC8C8C8)),
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
