import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobileapp/model/modelos_model.dart';
import 'package:mobileapp/model/poi_local.dart';
import 'package:mobileapp/pages/menu_page.dart';
import 'package:mobileapp/pages/poiDetalle_page.dart';
import 'package:mobileapp/repository/boxes.dart';
import 'package:hive_flutter/adapters.dart';

class FavPoi extends StatefulWidget {
  const FavPoi({super.key});

  @override
  State<FavPoi> createState() => _FavPoiState();
}

class _FavPoiState extends State<FavPoi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Favoritos"),
        ),
        drawer: MenuPage(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: ListaFavoritos(),
        ));
  }

  Widget ListaFavoritos() {
    return ValueListenableBuilder<Box<PoiLocal>>(
        valueListenable: Boxes.boxFavoritos().listenable(),
        builder: (context, box, _) {
          final lista = box.values.toList().cast<PoiLocal>();
          return ListView.builder(
              padding: const EdgeInsets.all(30),
              itemCount: lista.length,
              itemBuilder: (BuildContext context, i) {
                return Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: CircleAvatar(
                        backgroundImage:
                            NetworkImage(lista[i].foto ?? "Sin imagen"),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          lista[i].nombre ?? "Sin nombre",
                          style: const TextStyle(
                              fontSize: 20, color: Colors.black),
                          textAlign: TextAlign.left,
                        ),
                        subtitle: Text(
                          lista[i].ciudad ?? "sin ciudad",
                        ),
                        onTap: () {
                          DatosPoi poiNew = DatosPoi(
                              nombre: lista[i].nombre ?? "",
                              ciudad: lista[i].ciudad ?? "",
                              foto: lista[i].foto ?? "",
                              descripcion: lista[i].descripcion ?? "",
                              puntuacion: lista[i].puntuacion ?? 0,
                              id: lista[i].id ?? "");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetallePoi(poi: poiNew)));
                        },
                        onLongPress: () {
                          setState(() {
                            lista[i].delete();
                          });
                        },
                      ),
                    ),
                  ],
                );
              });
        });
  }
}
