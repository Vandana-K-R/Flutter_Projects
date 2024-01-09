class UserLocation {
  final String city;
  final String state;
  final String country;
  final String postCode;
  final CoOrdinate coOrdinate;
  final Street street;
  final TimeZone timeZone;
  UserLocation(
      {required this.street,
      required this.city,
      required this.state,
      required this.country,
      required this.postCode,
      required this.coOrdinate,
      required this.timeZone});
  factory UserLocation.fromMap(Map<String, dynamic> e) {
    final street = Street.fromMap(e['street']);
    final timeZone = TimeZone.fromMap(e['timezone']);
    final coordinate = CoOrdinate.fromMap(e['coordinates']);
    return UserLocation(
        street: street,
        city: e['city'],
        state: e['state'],
        country: e['country'],
        postCode: e['postCode'].toString(),
        coOrdinate: coordinate,
        timeZone: timeZone);
  }
}

class CoOrdinate {
  final String latitude;
  final String longitude;
  CoOrdinate({required this.latitude, required this.longitude});
  factory CoOrdinate.fromMap(Map<String, dynamic> json) {
    return CoOrdinate(
      latitude: json['latitude'], 
      longitude: json['longitude']);
  }
}

class Street {
  final String streetNumber;
  final String streetName;

  Street({required this.streetNumber, required this.streetName});
  factory Street.fromMap(Map<String, dynamic> json) {
    return Street(
        streetNumber: json['number'].toString(),
        streetName: json['name']);
  }
}

class TimeZone {
  final String offSet;
  final String description;

  TimeZone({required this.offSet, required this.description});
  factory TimeZone.fromMap(Map<String, dynamic> json) {
    return TimeZone(
      offSet: json['offset'], 
      description: json['description']);
  }
}
