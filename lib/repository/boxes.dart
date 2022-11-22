import 'package:hive/hive.dart';
import 'package:mobileapp/model/poi_local.dart';

class Boxes {
  static Box<PoiLocal> boxFavoritos() => Hive.box<PoiLocal>('favoritos');
}
