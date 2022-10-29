import 'package:flutter/material.dart';

class PointOfInterest extends StatefulWidget {
  PointOfInterest({Key? key}) : super(key: key);

  @override
  State<PointOfInterest> createState() => _PointOfInterestState();
}

class _PointOfInterestState extends State<PointOfInterest> {
  String poi="Bulevar del rio";
  String ciudad = "Cali";
  String departamento = "Valle del Cauca";
  int temperatura = 30;
  String descripcion =
      "El Bulevar de la Avenida Colombia, conocido también como el Bulevar del Río por estar situado a orillas del río Cali, es un bulevar ubicado en el centro histórico de la ciudad de Santiago de Cali, Colombia. Porta el nombre de la avenida que otrora transitaba en el lugar donde hoy se encuentra el bulevar y la cual sigue funcionando por medio de un túnel ubicado directamente debajo de éste, siendo este el túnel urbano más largo de Colombia.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          "Detalle Sitio Turistico, $poi",
          style: const TextStyle(color: Colors.white, fontSize: 17) ,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
        child: SingleChildScrollView(
          // child: Center(

          child: Column(children: [
            Center(
                child: Column(children:  [
              Text(
                poi,
                style: const TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
              ),
             const SizedBox(
                height: 40,
              ),
            const  ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: Image(image: AssetImage("assets/images/cali.jpg"))),
             const SizedBox(
                height: 30,
              ),
            ])),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Ciudad: $ciudad", style: const TextStyle(fontSize: 19)),
                const SizedBox(
                  height: 10,
                ),
                Text("Departamento: $departamento",
                    style: const TextStyle(fontSize: 19)),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Temperatura: $temperatura",
                  style: const TextStyle(fontSize: 19),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("Descripcion: $descripcion",
                    style: const TextStyle(fontSize: 19),
                    textAlign: TextAlign.justify),
              ],
            )
          ]),
          // )
        ),
      ),
    );
  }
}
