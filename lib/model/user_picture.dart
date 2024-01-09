class UserPicture {
  final String large;
  final String medium;
  final String thumbNail;
  UserPicture({
    required this.large, 
    required this.medium, 
    required this.thumbNail});

    factory UserPicture.fromMap(Map<String, dynamic> e){
      return UserPicture(
        large: e['large'],
        medium: e['medium'],
        thumbNail: e['thumbnail']);
    }
}
