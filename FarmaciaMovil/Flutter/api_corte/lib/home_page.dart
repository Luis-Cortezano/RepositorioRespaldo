import 'dart:convert';
import 'package:api_corte/models/product.dart';
import 'package:api_corte/widgets/datos_page.dart';
import 'package:http/http.dart' as http;
import 'package:api_corte/widgets/carga_page.dart';
import 'package:api_corte/widgets/error_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String token;

  const HomePage({Key? key, required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Product>>(
        future: getData(token),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CargaPage();
          } else if (snapshot.hasError) {
            return ErrorPage(errorMessage: snapshot.error.toString());
          } else if (snapshot.hasData) {
            return DatosPage(products: snapshot.data!);
          } else {
            return const ErrorPage();
          }
        },
      ),
    );
  }

  Future<List<Product>> getData(String token) async {
    final url = Uri.https('1b1b-38-188-225-50.ngrok-free.app', '/products');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final List jsonData = jsonDecode(response.body);
      return jsonData.map((item) => Product.fromJson(item)).toList();
    } else {
     throw Exception('Error en la petición: ${response.statusCode}');
    }
  }

}

