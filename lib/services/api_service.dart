import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'api_client.dart';
import '../models/product.dart';

class ApiService {
  final ApiClient _apiClient = ApiClient();

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

  Future<Either<String, Product>> addProduct(Product product) async {
    try {
      final response = await _apiClient.post('/products', {
        'title': product.title,
        'price': product.price,
        'category': product.category,
        'description': product.description,
        'image': product.image,
      });
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
