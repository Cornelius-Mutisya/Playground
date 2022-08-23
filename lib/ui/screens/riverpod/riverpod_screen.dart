import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playground/ui/screens/riverpod/details_screen.dart';
import 'package:playground/ui/screens/riverpod/models/user_model.dart';
import 'package:playground/ui/screens/riverpod/services/data_provider.dart';

class RiverpodScreen extends ConsumerWidget {
  const RiverpodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final userData = ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Screen'),
      ),
      body: userData.when(
        data: (userData) {
          List<UserModel> userList = userData.map((e) => e).toList();
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (_, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  DetailScreen(user: userList[index])));
                        },
                        child: Card(
                          elevation: 4,
                          color: Colors.blue,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                userList[index].avatar,
                              ),
                            ),
                            title: Text(
                              userList[index].firstname,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            subtitle: Text(
                              userList[index].lastname,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: userList.length,
                  ),
                )
              ],
            ),
          );
        },
        error: (err, s) => Text(err.toString()),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
