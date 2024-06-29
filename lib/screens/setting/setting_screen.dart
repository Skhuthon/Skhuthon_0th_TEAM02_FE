import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skhuthon_app/common/widgets/tabBarBase.dart';

import '../../common/color.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Setting'), backgroundColor: BASE),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100),
            const Text('Account', style: TextStyle(fontSize: 23)),
            const Padding(padding: EdgeInsets.all(10)),
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
                child: Row(
                  children: [
                    SizedBox(width: 15),
                    Text(
                      'HIIIH KJEKNSLKJKRJKLE LK EN',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                )),
            const Padding(padding: EdgeInsets.all(10)),
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
                child: const Row(
                  children: [
                    SizedBox(width: 15),
                    Text(
                      'HIIIH KJEKNSLKJKRJKLE LK EN',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                )),
            const SizedBox(height: 200),
            const Text('My Post', style: TextStyle(fontSize: 23)),
            const Padding(padding: EdgeInsets.all(5)),
            ElevatedButton(
              onPressed: () async {},
              style: ElevatedButton.styleFrom(
                backgroundColor: WHITE,
                surfaceTintColor: BASE,
                foregroundColor: BASE,
                padding:
                    const EdgeInsets.symmetric(horizontal: 140, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: const Text(
                '내 글 보러가기 ',
                style: TextStyle(
                  color: BLACK,
                  fontSize: 17,
                  fontFamily: 'Ink Free',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 130),
            SizedBox(
              child: ElevatedButton(
                onPressed: () async {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(),
                  backgroundColor: GREY,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 0,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.clear),
                    const SizedBox(width: 8),
                    const Text(
                      'Log Out',
                      style: TextStyle(
                        color: BLACK,
                        fontSize: 20,
                        fontFamily: 'Ink Free',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              width: 400,height: 60,
            )
          ],
        ),
      ),
      bottomNavigationBar: TabBarBase(),
    );
  }
}
