import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/widgets/TextFieldWidget.dart';
import '../../common/widgets/tabBarBase.dart';

/*final createPostScreenProvider = ChangeNotifierProvider((ref) => CreatePostScreenProvider());

class CreatePostScreenProvider extends ChangeNotifier {
  final _formKey = GlobalKey<FormState>();
  TextFieldWidget _title =  TextFieldWidget(value: 'Title', hintText: 'Title');
  TextFieldWidget _contents = TextFieldWidget(value: 'Contents', hintText: 'Enter Your Memories');

  GlobalKey<FormState> get formKey => _formKey;
  TextFieldWidget get title => _title;
  TextFieldWidget get contents => _contents;

  void submitPost() {
    if (_formKey.currentState!.validate()) {
      // 게시물 등록 로직 구현
      // ...
      notifyListeners();
    }
  }
}

class CreatePostScreen extends ConsumerWidget {
  const CreatePostScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createPostScreenProvider = ref.watch(textProvider);
// Post 누르면 등록되도록 로직 구현
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Container(
              child: TextButton(
                  onPressed: () {
                    createPostScreenProvider.submitPost();
                  },
                  child: const Text('Complete')),
            ),
            SizedBox(
                width: 350, height: 80, child: createPostScreenProvider.title.textFormField
            ),
            SizedBox(
                width: 350, height: 500, child: createPostScreenProvider.contents.textFormField
            )
          ],
        ),
      ),
      bottomNavigationBar: const TabBarBase(),
    );
  }
}*/
