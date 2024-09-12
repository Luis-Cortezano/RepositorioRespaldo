import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserProvider with ChangeNotifier {
  String? _username;
  String? _token;
  String? _errorMessage;

  String? get username => _username;
  String? get token => _token;
  String? get errorMessage => _errorMessage;

  // Agregamos un getter para obtener el token si es necesario
  String? get authToken => _token;

  Future<void> register({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phone,
    required String address,
    required String passwordConfirmation,
  }) async {
    final url = Uri.parse('https://1b1b-38-188-225-50.ngrok-free.app/users');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'user': {
            'username': username,
            'first_name': firstName,
            'last_name': lastName,
            'email': email,
            'password': password,
            'phone': phone,
            'address': address,
            'password_confirmation': passwordConfirmation,
          }
        }),
      );

      if (response.statusCode == 201) {
        final responseData = json.decode(response.body);
        _username = responseData['username'];
        _token = responseData['token'];
        _errorMessage = null;
      } else {
        final errorData = json.decode(response.body);
        _errorMessage = errorData['errors'] ?? 'Error al registrar el usuario';
      }
    } catch (e) {
      _errorMessage = 'Error de red. Por favor, intenta nuevamente.';
    }

    notifyListeners();
  }

  Future<void> login(String username, String password) async {
    final url = Uri.parse('https://1b1b-38-188-225-50.ngrok-free.app/login');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'user': {
            'username': username,
            'password': password,
          }
        }),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        _username = responseData['username'];
        _token = responseData['token'];
        _errorMessage = null;
      } else {
        final errorData = json.decode(response.body);
        _errorMessage = errorData['errors'] ?? 'Error en las credenciales';
      }
    } catch (e) {
      _errorMessage = 'Error de red. Por favor, intenta nuevamente.';
    }

    notifyListeners();
  }

  void logout() {
    _username = null;
    _token = null;
    _errorMessage = null;
    notifyListeners();
  }
}
