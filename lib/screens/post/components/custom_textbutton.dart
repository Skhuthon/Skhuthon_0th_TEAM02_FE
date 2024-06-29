import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skhuthon_app/providers/post_provider.dart';

class CustomTextButton extends ConsumerStatefulWidget {
  const CustomTextButton({super.key});

  @override
  _CustomTextButtonState createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends ConsumerState<CustomTextButton> {
  String _buttonText = "위치";

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        final result = await context.push('/post/select');
        if (result != null && result is NLatLng) {
          log(result.toString());
          ref.read(postProvider.notifier).setLocation(result.latitude, result.longitude);
          setState(() {
            _buttonText = "위치 선택 완료";
          });
        }
      },
      child: Text(_buttonText, style: const TextStyle(color: Colors.black, fontSize: 20)),
    );
  }
}
