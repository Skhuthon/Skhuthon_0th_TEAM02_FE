import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:skhuthon_app/app_router.dart';
import 'package:skhuthon_app/common/color.dart';

class TabBarNotifier extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void updateIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}

final tabBarProvider = ChangeNotifierProvider((ref) => TabBarNotifier());


class TabBarBase extends ConsumerWidget {
  const TabBarBase({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabBarNotifier = ref.watch(tabBarProvider);
    final router = ref.watch(routerProvider);
    return SalomonBottomBar(
      currentIndex: tabBarNotifier.currentIndex,
      onTap: (i)  {
        ref.read(tabBarProvider.notifier).updateIndex(i);
        switch (i) {
          case 0:
            router.go('/profile');
            break;
          case 1:
            router.go('/');
            break;
          case 2:
            router.go('/setting');
            break;
        }
      },

      unselectedItemColor: WHITE,
      items: [
        SalomonBottomBarItem(
          icon: const Icon(Icons.person),
          title: const Text("Profile"),
          selectedColor: WHITE,
        ),
        SalomonBottomBarItem(
          icon: const Icon(Icons.edit),
          title: const Text("Home"),
          selectedColor: WHITE,
        ),
        SalomonBottomBarItem(
          icon: const Icon(Icons.settings),
          title: const Text("Setting"),
          selectedColor: WHITE,
        ),
      ],
      backgroundColor: BASE,
    );
  }
}
