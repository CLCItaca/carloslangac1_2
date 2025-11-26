import 'dart:math';

import 'package:carloslangac1_2/models/Pedido.dart';
import 'package:carloslangac1_2/models/Producto.dart';
import 'package:carloslangac1_2/models/User.dart';
import 'package:carloslangac1_2/services/LogicaProductos.dart';

class LogicaPedidos {
  static Random rndNum = Random();
  static final List<Pedido> _listaPedidos = [];

  static double sumarPrecio(List<Producto> productos){
    double precioFinal = 0;

    for(Producto i in productos){
      precioFinal = precioFinal + i.getPrecio();
    }

    return precioFinal;
  }

  static String productosPorTipo(List<Producto> productos){
    List<String> productosPorTipo = [];
    productosPorTipo.clear();
    for(int i = 0; i < LogicaProductos.getListaProductos().length; i++){
      int contador = 0;
      for(Producto j in productos){
        if(j.getNombre() == LogicaProductos.getListaProductos().elementAt(i).getNombre()){
          contador++;
        }
      }
      if(contador != 0){
        productosPorTipo.add(contador.toString() + ' x ' + LogicaProductos.getListaProductos().elementAt(i).getNombre() + '\n');
      }
    }

    return productosPorTipo.join();
  }
  static void addPedido(List<Producto> productos, User usuario){
    
    Pedido nuevoPedido = new Pedido(
      numPedido: rndNum.nextInt(9999), 
      productosPedido: productos, 
      productosLista: productosPorTipo(productos),
      precio: sumarPrecio(productos), 
      estado: 'Pedido',
      usuario: usuario
    );

    _listaPedidos.add(nuevoPedido);
  }

  static List<Pedido> getPedidos(){
    return _listaPedidos;
  }

  static List<Pedido> getPedidosByUser(User usuario){
    List<Pedido> _listaByUser = [];
    for(Pedido i in getPedidos()){
      if(i.getUsuario().getNombre() == usuario.getNombre()){
        _listaByUser.add(i);
      }
    }
    return _listaByUser;
  }
}