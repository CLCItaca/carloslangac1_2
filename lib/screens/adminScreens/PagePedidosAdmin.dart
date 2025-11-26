import 'package:carloslangac1_2/models/Pedido.dart';
import 'package:flutter/material.dart';
import 'package:carloslangac1_2/services/LogicaPedidos.dart';

class PagePedidosAdmin extends StatefulWidget {

  const PagePedidosAdmin({super.key});

  @override
  State<PagePedidosAdmin> createState() => _PagePedidosAdminState();
}

class _PagePedidosAdminState extends State<PagePedidosAdmin> {
  late final List<Pedido> _listaPedidos = LogicaPedidos.getPedidos();

  
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

                void modificarEstado(){
                  String? estado;
                  showDialog(context: context, builder: (context) => AlertDialog(
                    title: Text('Editar Estado'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          DropdownMenu(dropdownMenuEntries: <DropdownMenuEntry<String>>[
                            DropdownMenuEntry(value: 'Pedido', label: 'Pedido'),
                            DropdownMenuEntry(value: 'En Producción', label: 'En Producción'),
                            DropdownMenuEntry(value: 'En Reparto', label: 'En Reparto'),
                            DropdownMenuEntry(value: 'Entregado', label: 'Entregado')
                          ],
                          onSelected: (value){
                            if (value != null){
                              setState(() {
                                estado = value;
                              });
                            }
                          },
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(onPressed: () => Navigator.pop(context),
                              child: Text('Cancelar'),
                              ),
                              OutlinedButton(onPressed: (){
                                _listaPedidos.elementAt(index).setEstado(estado!);
                                Navigator.pop(context);
                              }, 
                                child: Text('Aceptar')
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ));
                }
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(padding: EdgeInsetsGeometry.only(left: 20)),
                          Text('Precio: ' + _listaPedidos.elementAt(index).getPrecio().toStringAsPrecision(4) + '€')
                        ],
                      ),
                      SizedBox(height: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Estado: ' + _listaPedidos.elementAt(index).getEstado())
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(padding: EdgeInsetsGeometry.all(25)),
                          FloatingActionButton(
                            onPressed: modificarEstado,
                            child: Icon(Icons.create, color: Colors.black,)
                          ),
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