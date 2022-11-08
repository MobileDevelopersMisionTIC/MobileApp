class UserApp {
  var id;
  var nombre;
  var email;
  var ciudad;
  // var password;

  UserApp(
    this.id,
    this.nombre,
    this.email,
    this.ciudad,
    // this.password,
  );

  UserApp.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        nombre = data['nombre'],
        email = data['email'],
        ciudad = data['ciudad']
  // ,
  // password = data['password']
  ;

  Map<String, dynamic> convertir() => {
        'id': id,
        'nombre': nombre,
        'email': email,
        'ciudad': ciudad
        // ,
        // 'password': password
      };
}
