import 'package:carloslangac1_2/models/Pedido.dart';
import 'package:carloslangac1_2/models/User.dart';
import 'package:flutter/material.dart';
import 'package:carloslangac1_2/services/LogicaPedidos.dart';

class PagePedidos extends StatefulWidget {
  final User usuario;
  const PagePedidos({super.key,required this.usuario});

  @override
  State<PagePedidos> createState() => _PagePedidosState();
}

class _PagePedidosState extends State<PagePedidos> {
  late final List<Pedido> _listaPedidos = LogicaPedidos.getPedidosByUser(widget.usuario);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      alignment: Alignment.topCenter,
      child: 
      Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _listaPedidos.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Color.fromARGB(255, 57, 126, 255),
                  elevation: 5,
                  shadowColor: Colors.grey,
                  child: Column(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(
                            title: Text('Pedido Número: ' + _listaPedidos.elementAt(index).getNum().toString()),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(title: Text(_listaPedidos.elementAt(index).getListaProductos()))
                        ] 
                      ),
                      

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(padding: EdgeInsetsGeometry.only(left: 20)),
                          Text('Precio: ' + _listaPedidos.elementAt(index).getPrecio().toStringAsPrecision(4) + '€')
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Estado: ' + _listaPedidos.elementAt(index).getEstado())
                        ],
                      )
                    ],
                  )
                );
              }
            )
          )
        ]
      )
    );
  }
}