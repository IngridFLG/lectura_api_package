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
  final String? latitude;
  final String? longitude;

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

factory User.fromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'],
    email: json['email'] ?? '',
    username: json['username'] ?? '',
    password: json['password'] ?? '',
    phone: json['phone'] ?? '',
    firstName: json['name']?['firstname'] ?? '',
    lastName: json['name']?['lastname'] ?? '',
    city: json['address']?['city'] ?? '',
    street: json['address']?['street'] ?? '',
    number: json['address']?['number'] ?? 0,
    zipcode: json['address']?['zipcode'] ?? '',
    latitude: json['address']?['geolocation']?['lat']?.toString() ?? '0.0',
    longitude: json['address']?['geolocation']?['long']?.toString() ?? '0.0',
  );
}


  // Método para convertir User a JSON
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
          'lat': latitude,
          'long': longitude,
        },
      },
    };
  }
}
