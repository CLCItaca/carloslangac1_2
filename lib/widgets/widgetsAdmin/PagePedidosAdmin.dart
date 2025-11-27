import 'package:carloslangac1_2/config/resources/MyColors.dart';
import 'package:carloslangac1_2/l10n/app_localizations.dart';
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
    final l10n = AppLocalizations.of(context)!;
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
                    title: Text(l10n.editarEstado),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          DropdownMenu(dropdownMenuEntries: <DropdownMenuEntry<String>>[
                            DropdownMenuEntry(value: l10n.pedidoVerbo, label: l10n.pedidoVerbo),
                            DropdownMenuEntry(value: l10n.produccion, label: l10n.produccion),
                            DropdownMenuEntry(value: l10n.reparto, label: l10n.reparto),
                            DropdownMenuEntry(value: l10n.entregado, label: l10n.entregado)
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
                              child: Text(l10n.cancelar),
                              ),
                              OutlinedButton(onPressed: (){
                                _listaPedidos.elementAt(index).setEstado(estado!);
                                Navigator.pop(context);
                              }, 
                                child: Text(l10n.aceptar)
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ));
                }
                return Card(
                  color: MyColors.boxColor,
                  elevation: 5,
                  shadowColor: Colors.grey,
                  child: Column(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(
                            title: Text(l10n.pedido + " " + l10n.numero + ": " + _listaPedidos.elementAt(index).getNum().toString()),
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
                          Text( l10n.precio + ': ' + _listaPedidos.elementAt(index).getPrecio().toStringAsPrecision(4) + '€')
                        ],
                      ),
                      SizedBox(height: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(l10n.estado + ': ' + _listaPedidos.elementAt(index).getEstado())
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