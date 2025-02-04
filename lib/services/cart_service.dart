import 'dart:convert';
import 'package:dartz/dartz.dart';
import '../models/cart.dart';
import '../models/cart_item.dart';
import 'api_client.dart';

class CartService {
  final ApiClient _apiClient = ApiClient();

  /// Obtener todos los carritos
  Future<Either<String, List<Cart>>> fetchAllCarts() async {
    try {
      final response = await _apiClient.get('/carts');
      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        final carts = data.map((cart) => Cart.fromJson(cart)).toList();
        return Right(carts);
      } else {
        return Left('Error al obtener carritos: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Error de red: $e');
    }
  }

  /// Obtener un carrito por ID
  Future<Either<String, Cart>> fetchCartById(int cartId) async {
    try {
      final response = await _apiClient.get('/carts/$cartId');
      if (response.statusCode == 200) {
        return Right(Cart.fromJson(json.decode(response.body)));
      } else {
        return Left('Error al obtener carrito: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Error de red: $e');
    }
  }

  /// Obtener carritos con límite
  Future<Either<String, List<Cart>>> fetchCartsWithLimit(int limit) async {
    try {
      final response = await _apiClient.get('/carts?limit=$limit');
      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        final carts = data.map((cart) => Cart.fromJson(cart)).toList();
        return Right(carts);
      } else {
        return Left('Error al obtener carritos con límite: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Error de red: $e');
    }
  }

  /// Obtener carritos ordenados
  Future<Either<String, List<Cart>>> fetchCartsSorted(String sort) async {
    try {
      final response = await _apiClient.get('/carts?sort=$sort');
      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        final carts = data.map((cart) => Cart.fromJson(cart)).toList();
        return Right(carts);
      } else {
        return Left('Error al ordenar carritos: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Error de red: $e');
    }
  }

  /// Obtener carritos por rango de fechas
  Future<Either<String, List<Cart>>> fetchCartsByDateRange(String startDate, String endDate) async {
    try {
      final response =
          await _apiClient.get('/carts?startdate=$startDate&enddate=$endDate');
      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        final carts = data.map((cart) => Cart.fromJson(cart)).toList();
        return Right(carts);
      } else {
        return Left('Error al obtener carritos por rango de fechas: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Error de red: $e');
    }
  }

  /// Obtener carritos de un usuario específico
  Future<Either<String, List<Cart>>> fetchUserCarts(int userId) async {
    try {
      final response = await _apiClient.get('/carts/user/$userId');
      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        final carts = data.map((cart) => Cart.fromJson(cart)).toList();
        return Right(carts);
      } else {
        return Left('Error al obtener carritos del usuario: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Error de red: $e');
    }
  }

  /// Agregar productos a un carrito
  Future<Either<String, Cart>> addToCart(int userId, List<CartItem> items) async {
    try {
      final response = await _apiClient.post('/carts', {
        'userId': userId,
        'date': DateTime.now().toIso8601String(),
        'products': items.map((item) => item.toJson()).toList(),
      });
      if (response.statusCode == 200) {
        return Right(Cart.fromJson(json.decode(response.body)));
      } else {
        return Left('Error al agregar al carrito: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Error de red: $e');
    }
  }

  /// Actualizar un carrito
  Future<Either<String, Cart>> updateCart(int cartId, List<CartItem> items) async {
    try {
      final response = await _apiClient.put('/carts/$cartId', {
        'date': DateTime.now().toIso8601String(),
        'products': items.map((item) => item.toJson()).toList(),
      });
      if (response.statusCode == 200) {
        return Right(Cart.fromJson(json.decode(response.body)));
      } else {
        return Left('Error al actualizar carrito: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Error de red: $e');
    }
  }

  /// Eliminar un carrito
  Future<Either<String, String>> deleteCart(int cartId) async {
    try {
      final response = await _apiClient.delete('/carts/$cartId');
      if (response.statusCode == 200) {
        return Right('Carrito eliminado correctamente');
      } else {
        return Left('Error al eliminar carrito: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Error de red: $e');
    }
  }
}
