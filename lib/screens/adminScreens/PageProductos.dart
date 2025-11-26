import 'dart:io';

import 'package:carloslangac1_2/config/utils/Camera.dart';
import 'package:carloslangac1_2/models/Producto.dart';
import 'package:carloslangac1_2/models/User.dart';
import 'package:carloslangac1_2/services/LogicaPedidos.dart';
import 'package:carloslangac1_2/services/LogicaProductos.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PageProductos extends StatefulWidget {
  final User usuario;
  const PageProductos({super.key, required this.usuario});

  @override
  State<PageProductos> createState() => _PageProductosState();
}

class _PageProductosState extends State<PageProductos> {
  static List<Producto> todosProductos = LogicaProductos.getListaProductos();
  @override
  void addProduct(){
                  String? nuevoNombre;
                  String? nuevoDesc;
                  String? nuevoPrecio;
                  String? photoPath;
                  showDialog(context: context, builder: (context) => AlertDialog(
                    title: Text('Añadir Producto'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              labelText: 'Nombre', 
                              border: OutlineInputBorder()
                            ),
                            onChanged: (value){
                              if(value != ''){
                                nuevoNombre = value;
                              }
                              else{
                                nuevoNombre = 'Nuevo Libro';
                              }
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            decoration: InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              labelText: 'Descripción', 
                              border: OutlineInputBorder()
                            ),
                            onChanged: (value){
                              if(value != ''){
                                nuevoDesc = value;
                              }
                              else{
                                nuevoDesc = 'Lorem Ipsum';
                              }
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            decoration: InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              labelText: 'Precio', 
                              border: OutlineInputBorder()
                            ),
                            onChanged: (value){
                              if(value != ''){
                                nuevoPrecio = value;
                              }
                              else{
                                nuevoPrecio = '1';
                              }
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Cambiar Foto: '),
                              FloatingActionButton(
                                child: Icon(Icons.image),
                                onPressed: () async {
                                  final path = await CameraGalleryService().selectPhoto();
                                  if(path == null) photoPath = 'assets/images/logo.png';
                                  setState(() {
                                    photoPath = path;
                                  });
                                }
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(onPressed: () => Navigator.pop(context),
                                child: Text('Cancelar'),
                              ),
                              OutlinedButton(onPressed: (){
                                Producto nuevoProducto = new Producto(
                                  nombre: nuevoNombre!,
                                  desc: nuevoDesc!,
                                  precio: double.parse(nuevoPrecio!),
                                  imgPath: photoPath!,
                                  stock: 0
                                );
                                LogicaProductos.addProducto(nuevoProducto);
                                Navigator.pop(context);
                              }, 
                                child: Text('Aceptar')
                              )
                            ],
                          )
                        ],
                      )
                    ),
                  ));
                }
  Widget build(BuildContext context) {
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

                void StockPlus() {
                    setState(() {
                      todosProductos.elementAt(index).setStock(todosProductos.elementAt(index).getStock() + 1);
                    });
                }

                void StockMinus(int stock) {
                    if(stock > 0){
                      setState(() {
                        todosProductos.elementAt(index).setStock(todosProductos.elementAt(index).getStock() - 1);
                      });
                    }
                    
                }

                void ChangeProduct(int index){
                  String? nuevoNombre;
                  String? nuevoDesc;
                  String? nuevoPrecio;
                  String? photoPath;
                  showDialog(context: context, builder: (context) => AlertDialog(
                    title: Text('Editar Producto'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              labelText: 'Nuevo Nombre', 
                              border: OutlineInputBorder()
                            ),
                            onChanged: (value){
                              if(value != ''){
                                nuevoNombre = value;
                              }
                              else{
                                nuevoNombre = todosProductos.elementAt(index).getNombre();
                              }
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            decoration: InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              labelText: 'Nueva Descripción', 
                              border: OutlineInputBorder()
                            ),
                            onChanged: (value){
                              if(value != ''){
                                nuevoDesc = value;
                              }
                              else{
                                nuevoDesc = todosProductos.elementAt(index).getDesc();
                              }
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            decoration: InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              labelText: 'Nuevo Precio', 
                              border: OutlineInputBorder()
                            ),
                            onChanged: (value){
                              if(value != ''){
                                nuevoPrecio = value;
                              }
                              else{
                                nuevoPrecio = todosProductos.elementAt(index).getPrecio().toString();
                              }
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Cambiar Foto: '),
                              FloatingActionButton(
                                child: Icon(Icons.image),
                                onPressed: () async {
                                  final path = await CameraGalleryService().selectPhoto();
                                  if(path == null) return null;
                                  setState(() {
                                    photoPath = path;
                                  });
                                }
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(onPressed: () => Navigator.pop(context),
                                child: Text('Cancelar'),
                              ),
                              OutlinedButton(onPressed: (){
                                todosProductos.elementAt(index).setNombre(nuevoNombre!);
                                todosProductos.elementAt(index).setDesc(nuevoDesc!);
                                todosProductos.elementAt(index).setDouble(double.parse(nuevoPrecio!));
                                todosProductos.elementAt(index).setImgPath(photoPath!);
                                Navigator.pop(context);
                              }, 
                                child: Text('Aceptar')
                              )
                            ],
                          )
                        ],
                      )
                    ),
                  ));
                }

                void eraseProduct(User usuario){
                  String? intentoBorrar;
                  showDialog(context: context, builder: (context) => AlertDialog(
                    title: Text('Borrar Producto'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Text('¿Estas seguro que quieres borrar este producto?'),
                          SizedBox(height: 20),
                          Text('Intoduzca su contraseña', style: TextStyle(fontStyle: FontStyle.italic),),
                          SizedBox(height: 20),
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              labelText: 'Contraseña administrador', 
                              border: OutlineInputBorder()
                            ),
                            onChanged: (value){
                              intentoBorrar = value;
                            }
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(onPressed: () => Navigator.pop(context),
                              child: Text('Cancelar'),
                              ),
                              OutlinedButton(onPressed: (){
                                if(intentoBorrar == usuario.getPasswrd()){
                                  LogicaProductos.getListaProductos().removeAt(index);
                                }
                                Navigator.pop(context);
                              }, 
                                child: Text('Aceptar')
                              )
                            ],
                          )
                        ]
                      )
                    )
                  ));
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
                                      Image.network(todosProductos.elementAt(index).getImgPath()) :
                                      Image.file(File(todosProductos.elementAt(index).getImgPath()))
                                  :const Icon(Icons.book)
                              ),
                              SizedBox(width: 150),
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
                                        Text('Precio: ' + todosProductos.elementAt(index).getPrecio().toString()),
                                        Text('Stock: ' + todosProductos.elementAt(index).getStock().toString()),
                                        Text(todosProductos.elementAt(index).getDesc())
                                      ],
                                    ) 
                                  ),
                                ],
                              ),
                              SizedBox(width: 150),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  FloatingActionButton(
                                    onPressed: (){
                                      ChangeProduct(index);
                                    },
                                    child: Icon(Icons.create, color: Colors.black,)
                                  ),
                                  SizedBox(height: 40),
                                  FloatingActionButton(
                                    onPressed: (){
                                      eraseProduct(widget.usuario);
                                    },
                                    child: Icon(Icons.delete, color: Colors.red,)
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
                              TextButton(onPressed:(){StockMinus(todosProductos.elementAt(index).getStock());}, child: Text('-',style: TextStyle(color: Colors.white))),
                              Text(todosProductos.elementAt(index).getStock().toString(), style: TextStyle(color: Colors.white)),
                              TextButton(onPressed: StockPlus, child: Text('+',style: TextStyle(color: Colors.white))),
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
              OutlinedButton(onPressed: addProduct, 
              style: ElevatedButton.styleFrom(
                    fixedSize: Size(250, 40),
                    backgroundColor: Color.fromARGB(255, 227, 237, 255),
              ),
              child: 
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.bookmark_rounded, color: Color.fromARGB(255, 22, 104, 255)),
                    Text(
                      'Añadir Producto',
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