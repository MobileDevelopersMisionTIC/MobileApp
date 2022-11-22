import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/model/modelos_model.dart';
import 'package:mobileapp/pages/menu_page.dart';
import 'package:mobileapp/pages/poiDetalle_page.dart';
import 'package:mobileapp/repository/utilities.dart';

class PointOfInterest extends StatefulWidget {
  PointOfInterest({Key? key}) : super(key: key);

  @override
  State<PointOfInterest> createState() => _PointOfInterestState();
}

class _PointOfInterestState extends State<PointOfInterest> {
  List pois = [];
  List idDoc = [];
  final buscar = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPoi();
  }

  Future getPoi() async {
    String id = "";
    QuerySnapshot poi =
        await FirebaseFirestore.instance.collection("LugarTuristico").get();
    // QuerySnapshot mascota = await FirebaseFirestore.instance
    //     .collection("Usuarios")
    //     .doc(uid)
    //     .collection("mascotas")
    //     .where("nombre", isEqualTo: "paquito").get();

    setState(() {
      if (poi.docs.isNotEmpty) {
        for (var pas in poi.docs) {
          id = pas.id;
          idDoc.add(id);
          pois.add(pas.data());
        }
      }
    });
  }

  Future getCiudad() async {
    idDoc.clear();
    pois.clear();
    String id = "";
    if (buscar.text.isEmpty) {
      getPoi();
    } else {
      QuerySnapshot poiCiudad = await FirebaseFirestore.instance
          .collection("LugarTuristico")
          .where("ciudad", isEqualTo: buscar.text)
          .get();
      // QuerySnapshot mascota = await FirebaseFirestore.instance
      //     .collection("Usuarios")
      //     .doc(uid)
      //     .collection("mascotas")
      //     .where("nombre", isEqualTo: "paquito").get();

      setState(() {
        if (poiCiudad.docs.isNotEmpty) {
          for (var pas in poiCiudad.docs) {
            id = pas.id;
            idDoc.add(id);
            pois.add(pas.data());
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sitios Turisticos"),
      ),
      drawer: MenuPage(),
      body: Stack(
        children: [
          Row(
            children: [
              Expanded(
                  child: Container(
                      padding: const EdgeInsets.only(
                          top: 20, left: 5, right: 0, bottom: 0),
                      child: TextFormField(
                          controller: buscar,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            labelText: "Ciudad",
                            border: OutlineInputBorder(),
                          )))),
              IconButton(
                  onPressed: () {
                    setState(() {
                      getCiudad();
                    });
                  },
                  padding: const EdgeInsets.only(right: 5, top: 15),
                  icon: const Icon(
                    Icons.search,
                    size: 40,
                    color: Colors.lightBlue,
                  ))
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: ListView.builder(
                itemCount: pois.length,
                itemBuilder: (BuildContext context, i) {
                  return Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: CircleAvatar(
                            backgroundImage: NetworkImage(
                          pois[i]["foto"],
                        )),
                      ),
                      Expanded(
                          child: ListTile(
                        title: Text(
                          pois[i]["nombre"],
                          style: const TextStyle(
                              fontSize: 20, color: Colors.black),
                          textAlign: TextAlign.left,
                        ),
                        subtitle: Text(
                          pois[i]["ciudad"].toString().capitalize(),
                        ),
                        onTap: () {
                          DatosPoi poiNew = DatosPoi(
                              nombre: pois[i]["nombre"],
                              ciudad: pois[i]["ciudad"],
                              foto: pois[i]["foto"],
                              descripcion: pois[i]["descripcion"],
                              puntuacion: pois[i]["puntuacion"],
                              // ubicacion: pois[i]["ubicacion"],
                              id: idDoc[i]);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetallePoi(poi: poiNew)));
                        },
                      ))
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}
