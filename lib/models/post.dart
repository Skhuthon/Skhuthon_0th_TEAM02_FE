import 'package:camera/camera.dart';

class Post {
  final String title;
  final String contents;
  final double latitude;
  final double longtitude;
  final List<XFile>? image;

  Post({required this.title, required this.contents, required this.latitude, required this.longtitude, this.image});

  Post copyWith({String? title, String? contents, double? latitude, double? longtitude, List<XFile>? image}) {
    return Post(
      title: title ?? this.title,
      contents: contents ?? this.contents,
      latitude: latitude ?? this.latitude,
      longtitude: longtitude ?? this.longtitude,
      image: image ?? this.image,
    );
  }
}
