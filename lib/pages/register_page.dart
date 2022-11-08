import 'package:flutter/material.dart';
import 'package:mobileapp/model/user_model.dart';
import 'package:mobileapp/pages/login_page.dart';
import 'package:mobileapp/repository/user_register.dart';
import 'package:mobileapp/repository/utilities.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nombre = TextEditingController();
  final email = TextEditingController();
  final ciudad = TextEditingController();
  final password = TextEditingController();
  final confPassword = TextEditingController();
  UserRegister usuario = UserRegister();
  late Utilities utl;

  void saveUser(UserApp newUser) async {
    String? resultado = await usuario.registerUser(email.text, password.text);
    switch (resultado) {
      case "invalid-email":
        utl.snackMessage("El formato del email no es correcto");
        break;
      case "weak-password":
        utl.snackMessage("Contraseña debe tener min 6 caracteres");
        break;
      case "unknown":
        utl.snackMessage("Complete la informacion");
        break;
      case "network-request-failed":
        utl.snackMessage("Revise su conexion a internet");
        break;
      default:
        newUser.id = resultado;
        registerUser(newUser);
        utl.snackMessage("Usuario registrado exitosamente");
    }
  }

  void registerUser(UserApp newUser) async {
    var id = await usuario.createUser(newUser);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  void traerDatos() {
    setState(() {
      if (password.text == confPassword.text) {
        if (nombre.text.isNotEmpty &&
            ciudad.text.isNotEmpty &&
            email.text.isNotEmpty &&
            password.text.isNotEmpty &&
            confPassword.text.isNotEmpty) {
          var newUserApp = UserApp(
            "",
            nombre.text,
            email.text,
            ciudad.text, /*password.text*/
          );
          saveUser(newUserApp);
        } else {
          utl.snackMessage("Datos incompletos, Llene toda la informacion");
        }
      } else {
        utl.snackMessage("Las contraseñas no coinciden");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    utl = Utilities(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: SingleChildScrollView(
            child: Center(
          child: Column(children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              margin: const EdgeInsets.all(20),
              child: const Image(
                  image: AssetImage("assets/images/logo.png"),
                  width: 300,
                  height: 300),
            ),
            TextFormField(
              controller: nombre,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  labelText: "Nombre",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  suffixIcon: const Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 41, 93, 156),
                    size: 30,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
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
              controller: ciudad,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Ciudad",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  suffixIcon: const Icon(
                    Icons.location_city,
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
              keyboardType: TextInputType.visiblePassword,
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
            TextFormField(
              controller: confPassword,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Confirmar password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  suffixIcon: const Icon(
                    Icons.password,
                    color: Color.fromARGB(255, 41, 93, 156),
                    size: 30,
                  )),
            ),
            const SizedBox(
              height: 50,
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
                  traerDatos();
                },
                child: const Text("Registrar")),
          ]),
        )),
      ),
    );
  }
}
