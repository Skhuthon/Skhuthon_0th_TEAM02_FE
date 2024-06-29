import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart' as k;
import '../models/user.dart';

class AuthController with ChangeNotifier {
  Future<User?> loginWithKakao() async {
    try {
      if (await k.isKakaoTalkInstalled()) {
        try {
          await k.UserApi.instance.loginWithKakaoTalk();
          log("카카오톡 로그인 성공");
        } catch (e) {
          log("카카오톡 로그인 실패 : $e");
          await k.UserApi.instance.loginWithKakaoAccount();
          log("카카오 계정 로그인 성공");
        }
      } else {
        await k.UserApi.instance.loginWithKakaoAccount();
        log("카카오 계정 로그인 성공");
      }
      k.User kakaoUser = await k.UserApi.instance.me();
      return User(
        name: kakaoUser.kakaoAccount!.name!,
        email: kakaoUser.kakaoAccount!.email!,
      );
    } catch (e) {
      log("로그인 실패 : $e");
      return null;
    }
  }

  Future<void> login() async {
    User? user = await loginWithKakao();
    if (user != null) {
      //서버 로그인 로직 필요
      notifyListeners();
    } else {
      return;
    }
  }
}

final authProvider = ChangeNotifierProvider((ref) => AuthController());
