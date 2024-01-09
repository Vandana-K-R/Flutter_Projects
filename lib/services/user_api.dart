import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:user/model/user.dart';

class UserApi {
  static Future<List<User>> fetchUsers() async {
    try {
      var response =
          await http.get(Uri.parse('https://randomuser.me/api/?results=50'));

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        print(json);

        final results = json['results'] as List<dynamic>;
        final users = results.map((e) {
          return User.fromMap(e);
        }).toList();

        return users;
      } else {
        // Handle HTTP error
        print('HTTP error: ${response.statusCode}');
        throw Exception('Failed to load users');
      }
    } catch (error) {
      // Handle other errors
      print('Error: $error');
      throw Exception('Failed to load users');
    }
  }
}
