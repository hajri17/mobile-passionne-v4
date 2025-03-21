import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String baseUrl = 'http://192.168.1.54:5000/';

  static Future<String?> getDataFromShared(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<void> saveDataToShared(key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static Future<void> removeDataFromShared(value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(value);
  }

  static Future<String?> verifToken() async {
    String? token = getDataFromShared('connected_jwt_token') as String?;

    if (token == null || token.isEmpty) return null;

    final response = await http.post(
      Uri.parse('$baseUrl/verifToken'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return token;
    } else {
      // removeDataFromShared('connected_jwt_token');
      return null;
    }
  }

  static Future<http.Response> get(String endpoint) async {
    String? token = await verifToken();
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
    return await http.get(Uri.parse('$baseUrl$endpoint'), headers: headers);
  }

  static Future<http.Response> post(String endpoint, dynamic body) async {
    String? token = await verifToken();
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers,
      body: jsonEncode(body),
    );
    return response;
  }

  static Future<http.Response> postWithoutToken(
      String endpoint, dynamic body) async {
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      body: jsonEncode(body),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    return response;
  }

  static Future<http.Response> update(String endpoint, dynamic body) async {
    String? token = await verifToken();
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
    final response = await http.put(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers,
      body: jsonEncode(body),
    );
    return response;
  }

  static Future<http.Response> delete(String endpoint) async {
    String? token = await verifToken();
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
    final response = await http.delete(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers,
    );
    return response;
  }

  static Future<bool> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }
}
