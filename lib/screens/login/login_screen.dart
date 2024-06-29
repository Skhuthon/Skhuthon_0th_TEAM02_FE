import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skhuthon_app/providers/auth_provider.dart';

import '../../common/color.dart';

// 상태 관리를 위한 Provider 선언
final loginProvider = ChangeNotifierProvider((ref) => LoginProvider());

class LoginProvider extends ChangeNotifier {
  // 필요한 상태 변수 선언
  // 예: 로그인 버튼 클릭 여부 등

  // 상태 변수 관련 메소드 구현
  // 예: 로그인 버튼 클릭 처리 등
}

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final authController = ref.watch(authProvider);

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
                  onPressed: () async {
                    await authController.login();
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
