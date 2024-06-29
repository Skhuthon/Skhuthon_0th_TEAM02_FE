import 'package:flutter/material.dart';
import 'package:skhuthon_app/common/widgets/tabBarBase.dart';
import 'package:skhuthon_app/main.dart';

import '../../common/color.dart';

class MyPostScreen extends StatefulWidget {
  const MyPostScreen({super.key});

  @override
  State<MyPostScreen> createState() => _MyPostScreenState();
}

class _MyPostScreenState extends State<MyPostScreen> {
  List<Map<String, String>> postList = [
    {'title': 'Title1', 'contents': 'content1'},
    {'title': 'Title2', 'contents': 'content2'},
    {'title': 'Title3', 'contents': 'content3'},
    {'title': 'Title4', 'contents': 'content4'},
    {'title': 'Title5', 'contents': 'content5'}
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('MyPost'),
        backgroundColor: BASE,
      ),
      body: Center(
        child: Column(
          children: [
            FutureBuilder(
              future: Future.delayed(
                  const Duration(seconds: 1), () => postList),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Map<String, String>>> snapshot) {
                if (snapshot.hasData) {
                  List<Map<String, String>> posts = snapshot.data!;
                  return Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('Title: ${posts[index]["title"]!}',
                              style: const TextStyle(fontSize: 20)),
                          subtitle: Text(
                              "Contents: ${posts[index]["contents"]!}"),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemCount: posts.length,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const Text('Error loading Post list');
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
      bottomNavigationBar: const TabBarBase(),
    );
  }
}
