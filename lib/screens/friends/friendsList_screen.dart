import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skhuthon_app/common/widgets/tabBarBase.dart';

import '../../common/color.dart';
import '../../models/user.dart';

class FriendsListScreen extends StatefulWidget {
  const FriendsListScreen({super.key});

  @override
  State<FriendsListScreen> createState() => _FriendsListScreenState();
}

class _FriendsListScreenState extends State<FriendsListScreen> {
  User user =
  User(name: 'a', email: 'd', followingList: ['user1', 'user2', 'user3']);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Friends'),
        backgroundColor: BASE,
      ),
      body: Center(
        child: Column(
          children: [
            const Text('MyPost'),
            const Text('Following List'),
            FutureBuilder<List<String>?>(
              future: Future.delayed(
                  const Duration(seconds: 1), () => user.followingList),
              builder: (BuildContext context,
                  AsyncSnapshot<List<String>?> snapshot) {
                if (snapshot.hasData) {
                  return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('Username: ${snapshot.data![index]}',
                            style: const TextStyle(fontSize: 20)),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: snapshot.data!.length,
                  );
                } else if (snapshot.hasError) {
                  return const Text('Error loading following list');
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => Dialog(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(
                          width: 200, // 제한된 너비 설정
                          child: Form(
                            key: _formKey,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: BLACK,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        SizedBox(
                          width: 100, // 제한된 너비 설정
                          child: TextButton(
                            onPressed: () {
                              final formKeyState = _formKey.currentState!;
                              if (formKeyState.validate()) {
                                formKeyState.save();
                                Navigator.pop(context);
                              }
                            },
                            child: const Text('Submit', style: TextStyle(fontSize: 15),),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.2,
                  vertical: size.width * 0.03,
                ),
                backgroundColor: BASE,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 0,
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.person_add, color: Colors.white),
                  SizedBox(width: 0.8),
                  Padding(padding: EdgeInsets.all(5)),
                  Text(
                    'Add Friends',
                    style: TextStyle(
                      color: BLACK,
                      fontSize: 20,
                      fontFamily: 'Ink Free',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const TabBarBase(),
    );
  }
}
