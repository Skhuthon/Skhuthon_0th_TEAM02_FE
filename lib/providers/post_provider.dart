import 'package:camera/camera.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/post.dart';

class PostNotifier extends StateNotifier<Post> {
  PostNotifier() : super(Post(title: '', contents: '', latitude: 0.0, longtitude: 0.0, image: null));

  void setTitle(String title) {
    state = state.copyWith(title: title);
  }

  void setContents(String contents) {
    state = state.copyWith(contents: contents);
  }

  void setImage(List<XFile> image) {
    state = state.copyWith(image: image);
  }

  void setLocation(double latitude, double longtitude) {
    state = state.copyWith(latitude: latitude, longtitude: longtitude);
  }
}

  final postProvider = StateNotifierProvider<PostNotifier, Post>((ref) => PostNotifier());

