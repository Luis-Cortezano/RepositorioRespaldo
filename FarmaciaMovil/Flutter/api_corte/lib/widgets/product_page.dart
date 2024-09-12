import 'package:api_corte/models/product.dart';
import 'package:flutter/material.dart';


class ProductPage extends StatelessWidget {
  final Product product;

  const ProductPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalle de Producto')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            SizedBox(height: 20),
            Text(
              product.name,
              
            ),
            SizedBox(height: 10),
            Text('Precio: \$${product.price.toString()}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Descripción:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(product.description, style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),

          ],
        ),
      ),
    );
  }
}
