import 'dart:convert';
import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart' as k;
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_auth.dart';
import '../models/user.dart';

class AuthController with ChangeNotifier {
  bool isLogin = false;
  FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<User?> loginWithKakao() async {
    try {
      OAuthToken token;
      if (await k.isKakaoTalkInstalled()) {
        try {
          token = await k.UserApi.instance.loginWithKakaoTalk();
          log("카카오톡 로그인 성공");
        } catch (e) {
          log("카카오톡 로그인 실패 : $e");
          token = await k.UserApi.instance.loginWithKakaoAccount();
          log("카카오 계정 로그인 성공");
        }
      } else {
        token = await k.UserApi.instance.loginWithKakaoAccount();
        log("카카오 계정 로그인 성공");
      }
      k.User kakaoUser = await k.UserApi.instance.me();
      await storage.write(key: 'kakaoToken', value: token.accessToken);
      return User(
        name: kakaoUser.kakaoAccount!.name!,
        email: kakaoUser.kakaoAccount!.email!,
      );
    } catch (e) {
      log("로그인 실패 : $e");
      return null;
    }
  }

  Future<void> login(User? user) async {
    String? token = await storage.read(key: 'kakaoToken');
    if (user != null) {
      final response = await http.get(
        Uri.parse('http://54.180.215.240:8080/api/v1/kakao/callback?code=$token'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final String accessToken = data['data'];
        log(accessToken.toString());
        await storage.write(key: 'accessToken', value: accessToken);
      }
      else {
        log('로그인 실패: ${response.statusCode}');
      }

      isLogin = true;
      notifyListeners();
    } else {
      return;
    }
  }

  Future<void> logout() async {
    //서버 로그아웃 로직 필요
    isLogin = false;
    notifyListeners();
  }
}

final authProvider = ChangeNotifierProvider((ref) => AuthController());
