import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'screens/Home/home_screen.dart';
import 'screens/Login/login_screen.dart';
import 'providers/auth_provider.dart';

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
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      )
    ],

    redirect: (context, state) {
      return null;
    
      //리다이렉트 로직 필요
    }
  );
});
