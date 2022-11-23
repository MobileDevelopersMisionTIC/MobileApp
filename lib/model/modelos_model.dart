import 'package:cloud_firestore/cloud_firestore.dart';

class DatosPoi {
  //deberia estar en modelo carp
  String nombre = "";
  String ciudad = "";
  String foto = "";
  String descripcion = "";
  GeoPoint ubicacion;
  String id = "";
  int puntuacion = 0;

  DatosPoi({
    required this.nombre,
    required this.ciudad,
    required this.foto,
    required this.descripcion,
    required this.ubicacion,
    required this.id,
    required this.puntuacion,
  });
}
