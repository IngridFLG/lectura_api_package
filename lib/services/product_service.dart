import 'dart:convert';
import 'package:dartz/dartz.dart';
import '../models/product.dart';
import 'api_client.dart';

class ProductService {
  final ApiClient _apiClient = ApiClient();

  /// Obtener todos los productos
  Future<Either<String, List<Product>>> fetchProducts() async {
    try {
      final response = await _apiClient.get('/products');
      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        final products = data.map((item) => Product.fromJson(item)).toList();
        return Right(products);
      } else {
        return Left('Error al obtener productos: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Error de red: $e');
    }
  }

  /// Obtener un producto por ID
  Future<Either<String, Product>> fetchProductById(int id) async {
    try {
      final response = await _apiClient.get('/products/$id');
      if (response.statusCode == 200) {
        return Right(Product.fromJson(json.decode(response.body)));
      } else {
        return Left('Error al obtener producto: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Error de red: $e');
    }
  }

  /// Obtener productos con límite
  Future<Either<String, List<Product>>> fetchProductsWithLimit(int limit) async {
    try {
      final response = await _apiClient.get('/products?limit=$limit');
      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        final products = data.map((item) => Product.fromJson(item)).toList();
        return Right(products);
      } else {
        return Left('Error al obtener productos con límite: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Error de red: $e');
    }
  }

  /// Obtener productos ordenados (ascendente o descendente)
  Future<Either<String, List<Product>>> fetchProductsSorted(String sort) async {
    try {
      final response = await _apiClient.get('/products?sort=$sort');
      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        final products = data.map((item) => Product.fromJson(item)).toList();
        return Right(products);
      } else {
        return Left('Error al ordenar productos: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Error de red: $e');
    }
  }

  /// Agregar un producto
  Future<Either<String, Product>> addProduct(Product product) async {
    try {
      final response = await _apiClient.post('/products', product.toJson());
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return Right(Product.fromJson(data));
      } else {
        return Left('Error al agregar producto: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Error de red: $e');
    }
  }

  /// Actualizar un producto (PUT)
  Future<Either<String, Product>> updateProduct(int id, Product product) async {
    try {
      final response = await _apiClient.put('/products/$id', product.toJson());
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return Right(Product.fromJson(data));
      } else {
        return Left('Error al actualizar producto: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Error de red: $e');
    }
  }

  /// Eliminar un producto
  Future<Either<String, Product>> deleteProduct(int id) async {
    try {
      final response = await _apiClient.delete('/products/$id');
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return Right(Product.fromJson(data));
      } else {
        return Left('Error al eliminar producto: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Error de red: $e');
    }
  }
}
