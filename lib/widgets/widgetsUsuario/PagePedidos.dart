import 'package:carloslangac1_2/config/resources/MyColors.dart';
import 'package:carloslangac1_2/l10n/app_localizations.dart';
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
                            title: Text(l10n.pedido + ' ' + l10n.numero + ': ' + _listaPedidos.elementAt(index).getNum().toString()),
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
                          Text(l10n.precio + ': ' + _listaPedidos.elementAt(index).getPrecio().toStringAsPrecision(4) + '€')
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(l10n.estado + ": " + _listaPedidos.elementAt(index).getEstado())
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