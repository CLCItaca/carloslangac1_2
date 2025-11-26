class Producto {
  String nombre;
  String desc;
  String imgPath;
  double precio;
  int stock;
  
  Producto({
    required this.nombre,
    required this.desc,
    required this.imgPath,
    required this.stock,
    required this.precio
  });

  String getNombre(){
    return nombre;
  }

  void setNombre(String nuevoNombre){
    nombre = nuevoNombre;
  }

  String getDesc(){
    return desc;
  }

  void setDesc(String nuevoDesc){
    desc = nuevoDesc;
  }

  String getImgPath(){
    return imgPath;
  }

  void setImgPath(String nuevoImg){
    imgPath = nuevoImg;
  }
  
  
  int getStock(){
    return stock;
  }

  void setStock(int nuevoStock){
    stock = nuevoStock;
  }

  double getPrecio(){
    return precio;
  }

  void setDouble(double nuevoPrecio){
    precio = nuevoPrecio;
  }
}