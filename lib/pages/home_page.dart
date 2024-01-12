import 'package:flutter/material.dart';
import 'package:user/model/user.dart';
import 'package:user/services/user_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Rest Api Call'), backgroundColor: Colors.red[300]),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            final picture = user.picture.thumbNail;
            //final color = user.gender == 'male' ? Colors.blue : Colors.pink;
            return ListTile(
              leading: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(picture),
              ),
              title: Text(user.fullName),
              subtitle: Text(user.email),
              tileColor: Colors.grey[100],
            );
          }),
    );
  }
}
