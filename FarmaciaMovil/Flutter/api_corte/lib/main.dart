import 'package:api_corte/carrito/carrito_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:api_corte/models/product.dart';
import 'package:api_corte/widgets/detalle_producto.dart';
import 'package:api_corte/widgets/registro_page.dart';
import 'package:api_corte/widgets/login_page.dart';
import 'package:api_corte/widgets/welcome_page.dart';
import 'package:api_corte/home_page.dart';
import 'package:api_corte/widgets/user_provider.dart';
import 'package:api_corte/carrito/carrito_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CarritoModel()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: MaterialApp(
        title: 'Farmacia Yasbel',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/welcome',
        routes: {
          '/welcome': (context) => WelcomePage(),
          '/login': (context) => LoginPage(),
          '/registro': (context) => RegistroPage(),
          '/home': (context) => HomePage(token: ''),
          '/cart': (context) => CarritoPage(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/product') {
            final product = settings.arguments as Product;
            return MaterialPageRoute(
              builder: (context) => DetalleProducto(product: product),
            );
          }
          return null;
        },
      ),
    );
  }
}
