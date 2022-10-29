import 'package:flutter/material.dart';
import 'package:mobileapp/pages/poi_page.dart';
import 'package:mobileapp/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final email = TextEditingController();
  final password = TextEditingController();

  void validarUsuario() {
    if (email.text.isEmpty || password.text.isEmpty) {
      snackMessage("Ingrese informacion");
    } else if (email.text == "santione92@gmail.com" &&
        password.text == "12345") {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => PointOfInterest()));
    } else {
      snackMessage("Datos Incorrectos");
    }
  }

  void snackMessage(String message) {
    final screen = ScaffoldMessenger.of(context);
    screen.showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.blue.shade900,
    ));
  }

  @override
  Widget build(BuildContext context) {
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
                  decoration:  InputDecoration(
                      
                      labelText: "Email",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                      suffixIcon: const Icon(
                        Icons.email,
                        color:  Color.fromARGB(255, 41, 93, 156),
                        size: 30,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: password,
                  obscureText: true,
                  decoration:  InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                      suffixIcon: const Icon(
                        Icons.password,
                        color:  Color.fromARGB(255, 41, 93, 156),
                        size: 30,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor:
                              const Color.fromARGB(255, 41, 93, 156),
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
                            backgroundColor:
                                const Color.fromARGB(255, 40, 94, 187),
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
