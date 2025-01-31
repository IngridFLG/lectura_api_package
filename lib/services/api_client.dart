import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  final String _baseUrl = 'https://fakestoreapi.com';

  Future<http.Response> get(String endpoint) async {
    final url = Uri.parse('$_baseUrl$endpoint');
    return await http.get(url);
  }

  Future<http.Response> post(String endpoint, Map<String, dynamic> body) async {
    final url = Uri.parse('$_baseUrl$endpoint');
    return await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );
  }

  Future<http.Response> delete(String endpoint) async {
    final url = Uri.parse('$_baseUrl$endpoint');
    return await http.delete(url);
  }
}
