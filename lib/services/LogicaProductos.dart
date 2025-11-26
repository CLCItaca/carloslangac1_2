import 'package:carloslangac1_2/models/Producto.dart';

class LogicaProductos {
  static final List<Producto> _listaProductos = [
    Producto(
      nombre: "Blackwate I: La Riada",
      desc: "Misterio y Supernatural",
      imgPath: "assets/images/BlackWaterRiada.jpg",
      stock: 5,
      precio: 16.99
    ),
    Producto(
      nombre: "El aliento de los dioses",
      desc: "Fantasía e Intriga",
      imgPath: "assets/images/Aliento.jpg",
      stock: 10,
      precio: 12.99
    ),
    Producto(
      nombre: "Lesser Known Monsters",
      desc: "Romance oscuro y Suspense",
      imgPath: "assets/images/LesserKnown.jpg",
      stock: 3,
      precio: 10.99
    )
  ];

  static void addProducto(Producto productoNuevo){
    _listaProductos.add(productoNuevo);
  }

  static List<Producto> getListaProductos(){
    return _listaProductos;
  }
}