import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:skhuthon_app/screens/friends/friendPost_screen.dart';
import 'package:skhuthon_app/screens/friends/friendsList_screen.dart';
import 'package:skhuthon_app/screens/home/home_screen.dart';
import 'package:skhuthon_app/screens/post/post_screen.dart';
import 'package:skhuthon_app/screens/setting/setting_screen.dart';

import 'screens/Login/login_screen.dart';
import 'providers/auth_provider.dart';
import 'screens/post/components/select_location.dart';

final _key = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
      navigatorKey: _key,
      debugLogDiagnostics: true,
      initialLocation: '/',
      refreshListenable: authState,
      
      routes: [
        GoRoute(
          path: '/',
          name: 'home',
          builder: (context, state) => const HomeScreen(),
          routes: [
            GoRoute(
              path: 'post',
              name: 'post',
              builder: (context, state) => PostScreen(),
              routes: [
                GoRoute(
                  path: 'select',
                  name: 'select',
                  builder: (context, state) => const SelectLocationScreen(),
                ),
              ]
            )
          ]
        ),
        GoRoute(
          path: '/login',
          name: 'login',
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: '/friendsList',
          name: 'friendsList',
          builder: (context, state) => const FriendsListScreen()
        ),
        GoRoute(
          path: '/friendPost',
          name: 'friendPost',
          builder: (context, state) => const FriendPostScreen()
        ),
        GoRoute(
          path: '/setting',
          name: 'setting',
          builder: (context, state) => const SettingScreen()
        ),
      ],
      redirect: (context, state) {
        return null;

        //리다이렉트 로직 필요
      });
});
