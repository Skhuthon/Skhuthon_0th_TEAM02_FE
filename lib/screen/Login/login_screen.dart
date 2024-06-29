import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/common/color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late Size size;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        size = MediaQuery.of(context).size;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (size == null) {
      return const SizedBox.shrink();
    }
    return Scaffold(
      backgroundColor: WHITE,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: size.width * 1.2,
              child: Image.asset('assets/images/logo.png'),
            ),
            Column(
              children: [
                SizedBox(
                  width: size.height * 0.2,
                  child: const Text('Title',
                      style: TextStyle(fontSize: 100, color: BLACK)),
                ),
                SizedBox(
                  width: size.height * 0.2,
                  child: const Text(' sub Title',
                      style: TextStyle(fontSize: 50, color: BLACK)),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.2,
                      vertical: size.width * 0.03,
                    ),
                    backgroundColor: YELLOW,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/kakao.png",
                        width: 43,
                        height: 26,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        '카카오톡으로 로그인',
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
              ],
            )
          ],
        ),
      ),
    );
  }
}
