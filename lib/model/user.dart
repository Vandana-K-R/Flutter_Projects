import 'package:user/model/user_dob.dart';
import 'package:user/model/user_location.dart';
import 'package:user/model/user_name.dart';
import 'package:user/model/user_picture.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String native;
  final UserName name;
  final UserDob dob;
  final UserLocation location;
  final UserPicture picture;
  User(
      {required this.email,
      required this.phone,
      required this.cell,
      required this.native,
      required this.gender,
      required this.name,
      required this.dob,
      required this.location,
      required this.picture});

  factory User.fromMap(Map<String, dynamic> e) {
    final name = UserName.fromMap(e['name']);
    final dob = UserDob.fromMap(e['dob']);
    final location = UserLocation.fromMap(e['location']);
    final picture = UserPicture.fromMap(e['picture']);
    return User(
        email: e['email'],
        phone: e['phone'],
        cell: e['cell'],
        native: e['nat'],
        gender: e['gender'],
        name: name,
        dob: dob,
        location: location,
        picture: picture);
  }

  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }
}
