import 'package:flutter/material.dart';

class PointOfInterest extends StatefulWidget {
  PointOfInterest({Key? key}) : super(key: key);

  @override
  State<PointOfInterest> createState() => _PointOfInterestState();
}

class _PointOfInterestState extends State<PointOfInterest> {
  String ciudad = "Cali";
  String departamento = "Valle del Cauca";
  int temperatura = 30;
  String descripcion =
      "Oficialmente Distrito Especial, Deportivo, Cultural, Turístico, Empresarial y de Servicios de Santiago de Cali,​​​ es un distrito colombiano, capital del departamento de Valle del Cauca,​la tercera ciudad más poblada y el tercer centro económico y cultural de Colombia.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Santiago de Cali"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
        child: SingleChildScrollView(
            child: Center(
          child: Column(children: [
            const Text(
              "Santiago de Cali",
              style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 40,
            ),
            const ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: Image(image: AssetImage("assets/images/cali.jpg"))),
            const SizedBox(
              height: 30,
            ),
    


            Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Text("Ciudad: $ciudad", style: const TextStyle(fontSize: 19)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text("Departamento: $departamento",
                      style: const TextStyle(fontSize: 19),
                      textAlign: TextAlign.justify),
                  const SizedBox(
                    height: 10,
                  ),
                  Text("Temperatura: $temperatura",
                      style: const TextStyle(fontSize: 19),
                      textAlign: TextAlign.left),
                  const SizedBox(
                    height: 10,
                  ),
                  Text("Descripcion: $descripcion",
                      style: const TextStyle(fontSize: 19),
                      textAlign: TextAlign.justify),
                ],
              ),
            )



          ]),
        )),
      ),
    );
  }
}
