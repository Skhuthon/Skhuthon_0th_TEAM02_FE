import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skhuthon_app/common/widgets/tabBarBase.dart';

import '../../common/color.dart';
import '../../models/user.dart';

class FriendsList_Screen extends StatefulWidget {
  const FriendsList_Screen({super.key});

  @override
  State<FriendsList_Screen> createState() => _FriendsList_ScreenState();
}

class _FriendsList_ScreenState extends State<FriendsList_Screen> {
  User user = User(name: 'a', email: 'd', followingList: ['user1', 'user2', 'user3']);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Friends'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('MyPost')
            // sharedReperance를 통해 받아온 것들 구현
            ,
            const Text('Following List'),
            FutureBuilder<List<String>?>(
              future: Future.delayed(const Duration(seconds: 1), () => user.followingList),
              builder: (BuildContext context, AsyncSnapshot<List<String>?> snapshot) {
                if (snapshot.hasData) {
                  return ListView.separated(
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
           Padding(padding: EdgeInsets.all(330)),
           ElevatedButton(
              onPressed: () async {
              },
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
                  Icon(Icons.person_add, color: Colors.white,),
                   SizedBox(width: 8),
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
