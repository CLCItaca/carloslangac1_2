import 'package:carloslangac1_2/models/Producto.dart';
import 'package:carloslangac1_2/models/User.dart';

class Pedido {
  final int numPedido;
  final List<Producto> productosPedido;
  final String productosLista;
  final double precio;
  String estado;
  User usuario;

  Pedido({
    required this.numPedido,
    required this.productosLista,
    required this.productosPedido,
    required this.precio,
    required this.estado,
    required this.usuario
  });

  String getListaProductos(){
    return productosLista;
  }
  int getNum(){
    return numPedido;
  }

  List<Producto> getProductos(){
    return productosPedido;
  }

  double getPrecio(){
    return precio;
  }

  void setEstado(String estado){
    this.estado = estado;
  }

  String getEstado(){
    return estado;
  }

  User getUsuario(){
    return usuario;
  }
}