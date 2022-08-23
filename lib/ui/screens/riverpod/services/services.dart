import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:playground/ui/screens/riverpod/models/user_model.dart';

class ApiService {
  String endpoint = 'https://reqres.in/api/users?page=2';

  Future<List<UserModel>> getUsers() async {
    Response res = await get(Uri.parse(endpoint));

    if (res.statusCode == 200) {
      final List result = jsonDecode(res.body)['data'];
      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception(res.reasonPhrase);
    }
  }
}

final userProvider = Provider<ApiService>((ref) => ApiService());
