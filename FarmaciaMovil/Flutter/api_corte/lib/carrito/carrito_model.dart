import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:api_corte/models/product.dart';
import 'package:provider/provider.dart';
import 'package:api_corte/widgets/user_provider.dart';

class CarritoModel extends ChangeNotifier {
  final Map<Product, int> _carrito = {};

  Map<Product, int> get carrito => _carrito;

  double getTotal() {
    double total = 0;
    _carrito.forEach((product, quantity) {
      total += product.price * quantity;
    });
    return total;
  }

  bool isEmpty() {
    return _carrito.isEmpty;
  }

  void clearCart() {
    _carrito.clear();
    notifyListeners();
  }

  void addProduct(Product product, int quantity) {
    if (_carrito.containsKey(product)) {
      _carrito[product] = _carrito[product]! + quantity;
    } else {
      _carrito[product] = quantity;
    }
    notifyListeners();
  }

  void incrementProduct(Product product) {
    if (_carrito.containsKey(product)) {
      _carrito[product] = _carrito[product]! + 1;
      notifyListeners();
    }
  }

  void decrementProduct(Product product) {
    if (_carrito.containsKey(product)) {
      if (_carrito[product]! > 1) {
        _carrito[product] = _carrito[product]! - 1;
      } else {
        _carrito.remove(product);
      }
      notifyListeners();
    }
  }

  void removeProduct(Product product) {
    if (_carrito.containsKey(product)) {
      _carrito.remove(product);
      notifyListeners();
    }
  }

  Future<void> generarPedido(BuildContext context) async {
    final url = Uri.parse('http://tu-backend.com/api/orders'); // Reemplaza con la URL de tu backend

    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final token = userProvider.token; // Cambia 'authToken' por 'token' si es el getter correcto

    if (token == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No estás autenticado. Por favor, inicia sesión.'),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
      );
      return;
    }

    final pedido = {
      'user_id': 1, // Reemplaza con el ID real del usuario si está disponible
      'payment_method': 'tarjeta', // Esto puede ser dinámico si se elige un método de pago
      'total': getTotal(),
      'status': 'pendiente',
      'order_details': _carrito.entries.map((entry) {
        final product = entry.key;
        return {
          'product_id': product.id, // Asegúrate de que 'id' está definido en la clase Product
          'quantity': entry.value,
          'unit_price': product.price,
          'total_price': product.price * entry.value,
          'product_name': product.name,
        };
      }).toList(),
    };

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode(pedido),
      );

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Pedido generado con éxito'),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
        );
        clearCart(); // Limpiar el carrito después de la compra
      } else {
        final errorData = json.decode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al generar el pedido: ${errorData['error']}'),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error de conexión'),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
      );
    }
  }
}
