import 'dart:io';

import 'package:carloslangac1_2/l10n/app_localizations.dart';
import 'package:carloslangac1_2/models/Producto.dart';
import 'package:carloslangac1_2/models/User.dart';
import 'package:carloslangac1_2/services/LogicaPedidos.dart';
import 'package:carloslangac1_2/services/LogicaProductos.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PageHome extends StatefulWidget {
  final User usuario;
  const PageHome({super.key, required this.usuario});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  static List<Producto> todosProductos = LogicaProductos.getListaProductos();
  static List<int> cantidadProducto = List.filled(todosProductos.length, 0);
  static List<Producto> productosNuevoPedido = <Producto>[];
  @override
  
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    void nuevoPedido(){
      if(productosNuevoPedido.isNotEmpty){
        LogicaPedidos.addPedido(productosNuevoPedido, widget.usuario);
        setState(() {
          productosNuevoPedido.clear();
          cantidadProducto = List.filled(todosProductos.length, 0);
        });
      }
    }
    return Container(
      padding: EdgeInsets.all(15),
      alignment: Alignment.topCenter,
      child: 
      Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: todosProductos.length,
              itemBuilder: (context, index) {

                void validateStockPlus() {
                  if (todosProductos.elementAt(index).getStock() > 0) {
                    productosNuevoPedido.add(todosProductos.elementAt(index));
                    todosProductos.elementAt(index).setStock(todosProductos.elementAt(index).getStock() - 1);
                    setState(() {
                      cantidadProducto[index]++;
                    });
                  }
                }

                void validateStockMinus() {
                  if (cantidadProducto[index] > 0) {
                    productosNuevoPedido.removeLast();
                    todosProductos.elementAt(index).setStock(todosProductos.elementAt(index).getStock() + 1);
                    setState(() {
                      cantidadProducto[index] = cantidadProducto[index] - 1;
                    });
                  }
                }

                return Card(
                  color: Color.fromARGB(255, 57, 126, 255),
                  elevation: 5,
                  shadowColor: Colors.grey,
                  child: Column(
                    children: <Widget>[
                      Padding(padding: EdgeInsetsGeometry.only(bottom: 20)),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                height: 230,
                                width: 250,
                                alignment: Alignment.center,
                                child: todosProductos.elementAt(index).getImgPath() != null ?
                                  todosProductos.elementAt(index).getImgPath().startsWith("assets") ?
                                    Image.asset(todosProductos.elementAt(index).getImgPath()) :
                                    kIsWeb ?
                                      Image.network(todosProductos.elementAt(index).getImgPath()):
                                      Image.file(File(todosProductos.elementAt(index).getImgPath()))
                                  :const Icon(Icons.book)
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: Alignment.topCenter,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(todosProductos.elementAt(index).getNombre(), style: TextStyle(fontSize: 20)),
                                        Padding(padding: EdgeInsetsGeometry.only(left: 10)),
                                        Text(l10n.precio + ': ' + todosProductos.elementAt(index).getPrecio().toString()),
                                        Text('Stock: ' + todosProductos.elementAt(index).getStock().toString()),
                                        Text(todosProductos.elementAt(index).getDesc())
                                      ],
                                    ) 
                                      
                                  
                                  ),
                                ],
                              )
                            ],
                          ),
                          
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(onPressed: validateStockMinus, child: Text('-',style: TextStyle(color: Colors.white))),
                              Text(cantidadProducto[index].toString(), style: TextStyle(color: Colors.white)),
                              TextButton(onPressed: validateStockPlus, child: Text('+',style: TextStyle(color: Colors.white))),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(onPressed: nuevoPedido, 
              style: ElevatedButton.styleFrom(
                    fixedSize: Size(250, 40),
                    backgroundColor: Color.fromARGB(255, 227, 237, 255),
              ),
              child: 
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_cart_checkout_rounded, color: Color.fromARGB(255, 22, 104, 255)),
                    Text(
                      l10n.realizarCompra,
                      style: TextStyle(
                        color: Color.fromARGB(255, 22, 104, 255),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}