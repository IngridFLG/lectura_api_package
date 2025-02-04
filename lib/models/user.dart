class User {
  final int? id; // Puede ser nulo al registrar un nuevo usuario
  final String email;
  final String username;
  final String password;
  final String phone;
  final String firstName;
  final String lastName;
  final String city;
  final String street;
  final int number;
  final String zipcode;
  final double? latitude;
  final double? longitude;

  const User({
    this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.phone,
    required this.firstName,
    required this.lastName,
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
    this.latitude,
    this.longitude,
  });

  // Factory constructor to create a User from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      username: json['username'],
      password: json['password'] ?? '',
      phone: json['phone'],
      firstName: json['name']['firstname'],
      lastName: json['name']['lastname'],
      city: json['address']['city'],
      street: json['address']['street'],
      number: json['address']['number'],
      zipcode: json['address']['zipcode'],
      latitude: json['address']['geolocation']['lat'] != null
          ? double.parse(json['address']['geolocation']['lat'])
          : null,
      longitude: json['address']['geolocation']['long'] != null
          ? double.parse(json['address']['geolocation']['long'])
          : null,
    );
  }

  // Method to convert a User to JSON
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'username': username,
      'password': password,
      'phone': phone,
      'name': {
        'firstname': firstName,
        'lastname': lastName,
      },
      'address': {
        'city': city,
        'street': street,
        'number': number,
        'zipcode': zipcode,
        'geolocation': {
          'lat': latitude?.toString(),
          'long': longitude?.toString(),
        },
      },
    };
  }
}
