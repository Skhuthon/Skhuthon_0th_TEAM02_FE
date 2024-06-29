import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/user.dart';

class UserStateNotifier extends StateNotifier<User?> {
  UserStateNotifier() : super(null);

  void setUser(User user) {
    state = user;
  }

  void clearUser() {
    state = null;
  }
}

final userProvider = StateNotifierProvider<UserStateNotifier, User?>((ref) => UserStateNotifier());
