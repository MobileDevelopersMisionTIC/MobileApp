import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobileapp/model/modelos_model.dart';
import 'package:mobileapp/model/poi_local.dart';
import 'package:mobileapp/pages/menu_page.dart';
import 'package:mobileapp/repository/boxes.dart';
import 'package:mobileapp/repository/utilities.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetallePoi extends StatefulWidget {
  final DatosPoi poi;

  DetallePoi({required this.poi});

  @override
  State<DetallePoi> createState() => _DetallePoiState();
}

class _DetallePoiState extends State<DetallePoi> {
  String poi = "Bulevar del rio";
  String ciudad = "Cali";
  String departamento = "Valle del Cauca";
  int temperatura = 30;
  String descripcion =
      "El Bulevar de la Avenida Colombia, conocido también como el Bulevar del Río por estar situado a orillas del río Cali, es un bulevar ubicado en el centro histórico de la ciudad de Santiago de Cali, Colombia. Porta el nombre de la avenida que otrora transitaba en el lugar donde hoy se encuentra el bulevar y la cual sigue funcionando por medio de un túnel ubicado directamente debajo de éste, siendo este el túnel urbano más largo de Colombia.";

  var favorito = false;

  @override
  void initState() {
    getFavoritos();
  }

  void getFavoritos() {
    final box = Boxes.boxFavoritos();
    for (var element in box.values) {
      if (element.id == widget.poi.id) {
        favorito = true;
      }
    }
  }

  void agregarFav() {
    var paseadorFav = PoiLocal()
      ..id = widget.poi.id
      ..nombre = widget.poi.nombre
      ..puntuacion = widget.poi.puntuacion
      ..ciudad = widget.poi.ciudad
      ..foto = widget.poi.foto
      ..descripcion = widget.poi.descripcion;

    final box = Boxes.boxFavoritos();
    // box.add(paseadorFav);
    if (favorito) {
      box.delete(paseadorFav.id);
    } else {
      box.put(paseadorFav.id, paseadorFav);
    }
    setState(() {
      favorito = !favorito;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuPage(),
      appBar: AppBar(
        title: Text(
          "Detalle Sitio Turistico, ${widget.poi.nombre.toString().capitalize()}",
          style: const TextStyle(color: Colors.white, fontSize: 17),
        ),
        actions: [
          IconButton(
              onPressed: () {
                agregarFav();
              },
              icon: Icon(
                  favorito
                      ? FontAwesomeIcons.solidHeart
                      : FontAwesomeIcons.heart,
                  size: 30,
                  color: Colors.red))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
        child: SingleChildScrollView(
          // child: Center(

          child: Column(children: [
            Center(
                child: Column(children: [
              Text(
                widget.poi.nombre,
                style:
                    const TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 40,
              ),
              ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  child: Image.network(widget.poi.foto)),
              const SizedBox(
                height: 30,
              ),
            ])),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Ciudad: ${widget.poi.ciudad.capitalize()}",
                    style: const TextStyle(fontSize: 19)),
                const SizedBox(
                  height: 10,
                ),
                // Text("Departamento: $departamento",
                //     style: const TextStyle(fontSize: 19)),
                // const SizedBox(
                //   height: 10,
                // ),
                // Text(
                //   "Temperatura: $temperatura",
                //   style: const TextStyle(fontSize: 19),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                Text("Descripcion: ${widget.poi.descripcion}",
                    style: const TextStyle(fontSize: 19),
                    textAlign: TextAlign.justify),
              ],
            ),
            RatingBar.builder(
              itemBuilder: (context, _) =>
                  const Icon(Icons.star, color: Colors.amber),
              onRatingUpdate: (rating) {
                print(rating); //just for testing
              },
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            )
          ]),
          // )
        ),
      ),
    );
  }
}
