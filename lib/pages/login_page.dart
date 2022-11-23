import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/pages/poi_page.dart';
import 'package:mobileapp/pages/register_page.dart';
import 'package:mobileapp/repository/utilities.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  late final Utilities utl;

  void validarUsuario() async {
    try {
      final user = await auth.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      if (user != null) {
        utl.snackMessage("Bienvenido");
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => PointOfInterest()));
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-email":
          utl.snackMessage("El formato del email no es correcto");
          break;
        case "user-not-found":
          utl.snackMessage("El usuario no esta registrado");
          break;
        case "wrong-password":
          utl.snackMessage("Contraseña incorrecta");
          break;
        case "unknow":
          utl.snackMessage("Complete la informacion");
          break;
        case "network-request-failed":
          utl.snackMessage("Revise su conexion a internet");
          break;
        default:
          utl.snackMessage("Error para iniciar sesion ${e.code}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    utl = Utilities(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
          child: Center(
            child: Column(
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 40, horizontal: 40),
                    margin: const EdgeInsets.all(10),
                    child: const Image(
                      image: AssetImage(("assets/images/logo.png")),
                    )),
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      suffixIcon: const Icon(
                        Icons.email,
                        color: Color.fromARGB(255, 41, 93, 156),
                        size: 30,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      suffixIcon: const Icon(
                        Icons.password,
                        color: Color.fromARGB(255, 41, 93, 156),
                        size: 30,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 41, 93, 156),
                      textStyle: const TextStyle(
                          fontSize: 16, fontStyle: FontStyle.italic)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                  },
                  child: const Text("Registrarse"),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        shadowColor: const Color.fromARGB(255, 41, 93, 156),
                        backgroundColor: const Color.fromARGB(255, 40, 94, 187),
                        fixedSize: const Size(200, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    onPressed: () {
                      validarUsuario();
                    },
                    child: const Text("Iniciar Sesion")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
