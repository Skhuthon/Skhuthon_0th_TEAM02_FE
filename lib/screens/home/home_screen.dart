import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skhuthon_app/screens/home/components/home_map.dart';

import '../../common/widgets/tabBarBase.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: const HomeMap(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/post');
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const TabBarBase(),
    );
  }
}
