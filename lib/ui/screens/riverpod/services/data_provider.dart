import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playground/ui/screens/riverpod/models/user_model.dart';
import 'package:playground/ui/screens/riverpod/services/services.dart';

final userDataProvider = FutureProvider<List<UserModel>>((ref) async {
  return ref.watch(userProvider).getUsers();
});
