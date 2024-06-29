import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
      appBar: AppBar(title: const Text('Setting'), backgroundColor: BASE),
      body: Padding(
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05, right: MediaQuery.of(context).size.width * 0.05),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              const Text('Account', style: TextStyle(fontSize: 23)),
              const Padding(padding: EdgeInsets.all(10)),
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
                  child: const Row(
                    children: [
                      SizedBox(width: 15),
                      Text(
                        '남궁혜민',
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
                  child: const Row(
                    children: [
                      SizedBox(width: 15),
                      Text(
                        'ng040115@gmail.com',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  )),
              const SizedBox(height: 100),
              const Text('My Post', style: TextStyle(fontSize: 23)),
              const Padding(padding: EdgeInsets.all(5)),
              ButtonTheme(
                child: ElevatedButton(
                    onPressed: () {
                      context.go('/myPosts');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: WHITE,
                      surfaceTintColor: BASE,
                      foregroundColor: BASE,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 140, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '내 글 보러가기',
                        style: TextStyle(
                          color: BLACK,
                          fontSize: 17,
                          fontFamily: 'Ink Free',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  // SizedBox(width: 10)
                ),
              ),
              const SizedBox(height: 130),
              SizedBox(
                width: 400,
                height: 60,
                child: ElevatedButton(
                  onPressed: () async {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(),
                    backgroundColor: GREY,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 0,
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.clear),
                      SizedBox(width: 8),
                      Text(
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
              )
            ],
          ),
        ),
      ),
      
      bottomNavigationBar: const TabBarBase(),
    );
  }
}
