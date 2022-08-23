import 'package:flutter/material.dart';
import 'package:playground/ui/screens/riverpod/models/user_model.dart';

class DetailScreen extends StatelessWidget {
  final UserModel user;
  const DetailScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            Center(
              child: CircleAvatar(
                maxRadius: 60,
                backgroundImage: NetworkImage(user.avatar),
              ),
            ),
            Text(
              '${user.firstname} ${user.lastname}',
            ),
            Text(user.email)
          ]),
        ),
      ),
    );
  }
}
