import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobileapp/pages/favoritosPoi_page.dart';
import 'package:mobileapp/pages/login_page.dart';
import 'package:mobileapp/pages/poi_page.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.lightBlue),
            child: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/mobileapp-misiontic-c4.appspot.com/o/Utl%2Fkisspng-computer-icons-user-profile-person-5abd8530d0a352.2050393115223698408546.png?alt=media&token=8c95ac2a-3559-4f8a-ae25-1be5248e76ab'),
          ),
          Column(
            children: [
              ListTile(
                leading: const Icon(FontAwesomeIcons.person, size: 20),
                title:
                    Text((FirebaseAuth.instance.currentUser?.email).toString()),
              ),
              ListTile(
                leading: const Icon(FontAwesomeIcons.locationDot, size: 20),
                title: const Text("Sitios de interes"),
                onTap: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PointOfInterest()));
                }),
              ),
              ListTile(
                leading: const Icon(FontAwesomeIcons.star, size: 20),
                title: const Text("Favoritos"),
                onTap: (() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FavPoi()));
                }),
              ),
              ListTile(
                leading: const Icon(Icons.exit_to_app, size: 20),
                title: const Text("Cerrar Sesion"),
                onTap: (() {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
