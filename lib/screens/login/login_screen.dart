import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skhuthon_app/providers/auth_provider.dart';
import 'package:skhuthon_app/providers/user_provider.dart';

import '../../common/color.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final authController = ref.watch(authProvider);
    final userState = ref.read(userProvider.notifier);

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
                  child: const Text('TraBlog',
                      style: TextStyle(fontSize: 65, color: BLACK, fontFamily:'NanumPen')),
                ),
                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width * 0.2,),
                    const Text('Make a note of your memory', style: TextStyle(fontSize: 30, color: BLACK, fontFamily:'NanumPen')),
                  ],
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () async {
                    await authController.loginWithKakao().then((user) {
                      if (user != null) {
                        authController.login(user);
                        userState.setUser(user);
                      }
                    });
                  },
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
