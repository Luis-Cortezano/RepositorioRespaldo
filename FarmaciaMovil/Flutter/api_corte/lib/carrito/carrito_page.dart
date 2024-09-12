import 'package:api_corte/carrito/carrito_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:api_corte/widgets/detalle_producto.dart';

class CarritoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final carrito = Provider.of<CarritoModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito de Compras'),
      ),
      body: carrito.isEmpty()
          ? Center(
              child: Text('El carrito está vacío'),
            )
          : ListView.builder(
              itemCount: carrito.carrito.length,
              itemBuilder: (context, index) {
                final product = carrito.carrito.keys.elementAt(index);
                final quantity = carrito.carrito[product]!;
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetalleProducto(product: product),
                        ),
                      );
                    },
                    title: Text(
                      product.name,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Precio: \$${product.price}',
                          style: TextStyle(fontSize: 16, color: Colors.blue[900]),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Descripción: ${product.description}',
                          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove, color: Colors.red),
                          onPressed: () {
                            carrito.decrementProduct(product); // Ajustado para sólo pasar el producto
                          },
                        ),
                        Text('$quantity', style: TextStyle(fontSize: 16)),
                        IconButton(
                          icon: Icon(Icons.add, color: Colors.green),
                          onPressed: () {
                            carrito.incrementProduct(product); // Ajustado para sólo pasar el producto
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            carrito.removeProduct(product); // Ajustado para sólo pasar el producto
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('${product.name} se ha eliminado del carrito'),
                                duration: Duration(seconds: 2),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: carrito.isEmpty()
          ? null
          : Container(
              padding: EdgeInsets.all(10),
              color: Colors.grey[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total: \$${carrito.getTotal().toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await carrito.generarPedido(context); // Verifica si generarPedido requiere el contexto
                    },
                    child: Text('Generar Pedido'),
                  ),
                ],
              ),
            ),
    );
  }
}
