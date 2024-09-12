import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String errorMessage;

  const ErrorPage({Key? key, this.errorMessage = 'ERROR'}) : super(key: key);

@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color(0xFF74BD64), 
                shape: BoxShape.circle, 
              ),
              child: Image.asset(
                'assets/images/icon.png',
                height: 150.0,
              ),
            ),
            SizedBox(height: 20),
            Text(
              '¡UPS!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF74BD64),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Vuelva más tarde',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black, 
              ),
            ),
          ],
        ),
      ),
    );
  }
}