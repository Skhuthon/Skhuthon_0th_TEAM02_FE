import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skhuthon_app/common/widgets/tabBarBase.dart';

import '../../common/color.dart';

class MyPostScreen extends StatefulWidget {
  const MyPostScreen({super.key});

  @override
  State<MyPostScreen> createState() => _MyPostScreenState();
}

class _MyPostScreenState extends State<MyPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Post'), backgroundColor: BASE,),
      body: Center(
          child: Column(
            children: [
              SizedBox(width: 10,height: 30,),
              Container(
                  width: 390,
                  height: 50,
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
                  child: Row(children: [
                    SizedBox(width: 20,),
                    Text('많은 것을 경험한 서울여행'),

                  ],)
                  ),

              SizedBox(width: 10,height: 20,),
              Container(
                  width: 390,
                  height: 50,
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
                  child:  Row(children: [
                    SizedBox(width: 20,),
                    Text('국밥 국밥 부산으로 고고싱 !'),

                  ],)),
              SizedBox(width: 10,height: 20,),
              Container(
                  width: 390,
                  height: 50,
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
                  child:  Row(children: [
                    SizedBox(width: 20,),
                    Text('해 뜬거 보러가자 마이 강릉'),

                  ],)),
              SizedBox(width: 10,height: 20,),
              Container(
                  width: 390,
                  height: 50,
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
                  child:  Row(children: [
                    SizedBox(width: 20,),
                    Text('을왕리 바다바다 ~ '),

                  ],)),
              SizedBox(width: 10,height: 20,),
              Container(
                  width: 390,
                  height: 50,
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
                  child:  Row(children: [
                    SizedBox(width: 20,),
                    Text('빠지러 빠지로 가평여행'),

                  ],)),

            ],
          ),
      ),
      bottomNavigationBar: TabBarBase(),
    );
  }
}
