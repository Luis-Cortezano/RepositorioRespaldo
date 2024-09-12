import 'package:flutter/material.dart';
import 'top_bar.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          TopBar(), 
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 5.0), 
              child: Image.asset(
                'assets/images/iconwelcome.png',
                height: 160.0, 
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 120), 
                  Text(
                    '¡Bienvenido!',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF559D46),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Aquí encontrarás una amplia variedad de productos a precios increíbles.',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),
                  Text(
                    'Inicia sesión',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF559D46),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF74BD64),
                      foregroundColor: Colors.white, 
                      minimumSize: Size(200, 60), 
                      elevation: 8,
                      shadowColor: Colors.black.withOpacity(0.2), 
                      side: BorderSide(
                        color: const Color(0xFF559D46), 
                        width: 5.0, 
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.login), 
                        SizedBox(width: 8),
                        Text('Inicio de sesión'),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '¿No tienes una cuenta?, regístrate aquí!',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF74BD64), 
                      foregroundColor: Colors.yellow, 
                      minimumSize: Size(200, 60), 
                      elevation: 8, 
                      shadowColor: Colors.black.withOpacity(0.2), 
                      side: BorderSide(
                        color: const Color(0xFF559D46),
                        width: 5.0, 
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0), 
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/registro');
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.person_add),
                        SizedBox(width: 8),
                        Text('Registrarse'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}