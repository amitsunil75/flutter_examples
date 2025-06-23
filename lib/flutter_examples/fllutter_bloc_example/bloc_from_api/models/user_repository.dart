import 'dart:async';

import 'user_models.dart';


class UserRepository {
  Future<List<User>> fetchUsers({int page = 1, String query = ''}) async {
    await Future.delayed(const Duration(seconds: 1)); // simulate network

    final allUsers = List.generate(
      50,
      (index) => User(
        id: index,
        name: 'User $index',
        email: 'user$index@example.com',
      ),
    );

    final filtered = allUsers
        .where((u) => u.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    final start = (page - 1) * 10;
    final end = (start + 10) > filtered.length ? filtered.length : start + 10;

    return filtered.sublist(start, end);
  }
}
