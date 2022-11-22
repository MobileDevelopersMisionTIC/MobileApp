import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
part 'poi_local.g.dart';

//flutter packages pub run build_runner build
@HiveType(typeId: 0)
class PoiLocal extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? nombre;
  @HiveField(2)
  String? ciudad;
  @HiveField(3)
  String? foto;
  @HiveField(4)
  String? descripcion;
  @HiveField(5)
  int? puntuacion;
  @HiveField(6)
  GeoPoint? ubicacion;
}
