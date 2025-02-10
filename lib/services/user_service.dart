import 'dart:convert';
import 'package:dartz/dartz.dart';
import '../models/user.dart';
import 'api_client.dart';

class UserService {
  final ApiClient _apiClient = ApiClient();

  // Obtener todos los usuarios
  Future<Either<String, List<User>>> fetchAllUsers() async {
    try {
      final response = await _apiClient.get('/users');
      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        final users = data.map((user) => User.fromJson(user)).toList();
        return Right(users);
      } else {
        return Left('Error al obtener usuarios: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Error de red: $e');
    }
  }

  // Obtener un usuario por ID
  Future<Either<String, User>> fetchUserById(int id) async {
    try {
      final response = await _apiClient.get('/users/$id');
      if (response.statusCode == 200) {
        return Right(User.fromJson(json.decode(response.body)));
      } else {
        return Left('Error al obtener usuario: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Error de red: $e');
    }
  }

  // Registrar un nuevo usuario
  Future<Either<String, Map<String, dynamic>>> registerUser(User user) async {
    try {

      final response = await _apiClient.post('/users', user.toJson());

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        return Right(responseData);
      } else {
        return Left('Error al registrar usuario: Código ${response.statusCode}');
      }
    } catch (e) {
      return Left('Error de red: $e');
    }
  }

  // Actualizar un usuario
  Future<Either<String, User>> updateUser(int userId, User user) async {
    try {
      final response = await _apiClient.put('/users/$userId', user.toJson());
      if (response.statusCode == 200) {
        return Right(User.fromJson(json.decode(response.body)));
      } else {
        return Left('Error al actualizar usuario: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Error de red: $e');
    }
  }

  // Eliminar un usuario
  Future<Either<String, String>> deleteUser(int userId) async {
    try {
      final response = await _apiClient.delete('/users/$userId');
      if (response.statusCode == 200) {
        return Right('Usuario eliminado correctamente');
      } else {
        return Left('Error al eliminar usuario: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Error de red: $e');
    }
  }

  // Iniciar sesión
  Future<Either<String, String>> login(String username, String password) async {
    try {
      final response = await _apiClient.post('/auth/login', {
        'username': username,
        'password': password,
      });
      if (response.statusCode == 200) {
        return Right(json.decode(response.body)['token']);
      } else {
        return Left('Error de inicio de sesión: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Error de red: $e');
    }
  }
}
