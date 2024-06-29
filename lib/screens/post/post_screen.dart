import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skhuthon_app/providers/post_provider.dart';
import 'package:skhuthon_app/screens/post/components/custom_button.dart';
import 'package:skhuthon_app/screens/post/components/custom_textbutton.dart';
import 'package:skhuthon_app/screens/post/components/custom_textfield.dart';
import 'package:skhuthon_app/screens/post/components/select_picture.dart';

class PostScreen extends HookConsumerWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final post = ref.watch(postProvider);
    final postNotifier = ref.read(postProvider.notifier);

    final titleController = useTextEditingController(text: post.title);
    final contentsController = useTextEditingController(text: post.contents);
    final imagesState = useState<List<File>>([]);

    void onImagesPicked(List<File> images) {
      if (images.length <= 5) {
        imagesState.value = images;
      }
      else {
        imagesState.value = images.sublist(0, 5);
      }
    }

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.05,
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05,
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      elevation: 8,
                      child: CustomTextField(
                        controller: titleController,
                        hintText: '제목',
                        onChanged: (value) => postNotifier.setTitle(value),
                      ),
                    )),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.025,
                    ),
                    const FaIcon(FontAwesomeIcons.locationDot),
                    const CustomTextButton(),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                SelectPicture(
                  images: imagesState.value,
                  onImagesPicked: onImagesPicked,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Material(
                    borderRadius: BorderRadius.circular(20),
                    elevation: 8,
                    child: CustomTextField(
                      controller: contentsController,
                      hintText: '일기를 작성해 보세요.',
                      minLines: 12,
                      maxLines: 12,
                      onChanged: (value) => postNotifier.setContents(value),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                      text: "저장",
                      onPressed: () {
                        //일기 업로드 로직 및 성공 시 pop
                      },
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    CustomButton(
                      text: "취소",
                      onPressed: () => context.pop(),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
