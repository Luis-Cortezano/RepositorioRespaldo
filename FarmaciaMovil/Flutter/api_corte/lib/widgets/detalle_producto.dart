import 'package:api_corte/carrito/carrito_model.dart';
import 'package:flutter/material.dart';
import 'package:api_corte/models/product.dart';
import 'package:provider/provider.dart';

class DetalleProducto extends StatelessWidget {
  final Product product;

  DetalleProducto({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFB4FD9F), 
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/icon.png', 
                height: 40.0,
                width: 40.0,
              ),
            ),
            SizedBox(width: 10.0),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                'https://localhost:3000/Imagenes/${product.categoryId}/${product.photo}',
                fit: BoxFit.cover,
                height: 250.0,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return Center(child: Icon(Icons.error, color: Colors.red));
                },
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              product.name,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Precio: \$${product.price}',
              style: TextStyle(fontSize: 18.0, color: Colors.green),
            ),
            SizedBox(height: 16.0),
            Text(
              product.description,
              style: TextStyle(fontSize: 16.0),
            ),
            Spacer(),
            ElevatedButton.icon( 
              onPressed: () {
                final carrito = Provider.of<CarritoModel>(context, listen: false);
                carrito.addProduct(product, 1);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${product.name} añadido al carrito'),
                    duration: Duration(seconds: 2),
                    backgroundColor: Colors.green,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                );
              },
              icon: Icon(Icons.add_shopping_cart), 
              label: Text('Añadir al Carrito'),
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
            ),
          ],
        ),
      ),
    );
  }
}
