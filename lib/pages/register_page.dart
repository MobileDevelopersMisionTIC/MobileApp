import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
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
              // controller: email,
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
              // controller: password,
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
            TextFormField(
              // controller: password,
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
            ),ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            shadowColor: const Color.fromARGB(255, 41, 93, 156),
                            backgroundColor:
                                const Color.fromARGB(255, 40, 94, 187),
                            fixedSize: const Size(200, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        onPressed: () {
                          // validarUsuario();
                        },
                        child: const Text("Registrar")),
          ]),
        )),
      ),
    );
  }
}
