import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../auth/login.dart';
import '../auth/politicas.dart';
import '../globals.dart' as globals;

class RegistroScreen extends StatefulWidget {
  const RegistroScreen({super.key});

  @override
  State<RegistroScreen> createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
  bool isChecked = false;
  bool isVisible = false;
  bool isVisible2 = false;
  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController cedulaController = TextEditingController();
  final TextEditingController contactoController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController fechaNacimientoController =
      TextEditingController();
  final TextEditingController contrasenaController = TextEditingController();
  final TextEditingController confirmarContrasenaController =
      TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 4, 4, 4),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top),
                      child: Image.asset('images/vehicheck_express_logo.png')),
                  Image.asset('images/decoration.png'),
                  const SizedBox(height: 20.0),
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, ingrese su nombre y apellido';
                        }
                        return null;
                      },
                      controller: usuarioController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        iconColor: Colors.black87,
                        border: InputBorder.none,
                        labelText: 'Nombre y Apellido',
                        labelStyle: TextStyle(color: Colors.black45),
                        hintText: 'Ingrese su nombre y apellido',
                        hintStyle: TextStyle(color: Colors.black38),
                      ),
                      style: const TextStyle(color: Colors.black87),
                      cursorColor: Colors.redAccent,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, ingrese su cedula';
                        }
                        return null;
                      },
                      controller: cedulaController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: const InputDecoration(
                        icon: Icon(Icons.credit_card),
                        iconColor: Colors.black87,
                        border: InputBorder.none,
                        labelText: 'Cedula',
                        labelStyle: TextStyle(color: Colors.black45),
                        hintText: 'Ingrese su cedula',
                        hintStyle: TextStyle(color: Colors.black38),
                      ),
                      style: const TextStyle(color: Colors.black87),
                      cursorColor: Colors.redAccent,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, ingrese su contacto';
                        }
                        return null;
                      },
                      controller: contactoController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: const InputDecoration(
                        icon: Icon(Icons.phone),
                        iconColor: Colors.black87,
                        border: InputBorder.none,
                        labelText: 'Contacto',
                        labelStyle: TextStyle(color: Colors.black45),
                        hintText: 'Ingrese su contacto',
                        hintStyle: TextStyle(color: Colors.black38),
                      ),
                      style: const TextStyle(color: Colors.black87),
                      cursorColor: Colors.redAccent,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, ingrese su correo';
                        }
                        return null;
                      },
                      controller: correoController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.email),
                        iconColor: Colors.black87,
                        border: InputBorder.none,
                        labelText: 'Correo',
                        labelStyle: TextStyle(color: Colors.black45),
                        hintText: 'Ingrese su correo',
                        hintStyle: TextStyle(color: Colors.black38),
                      ),
                      style: const TextStyle(color: Colors.black87),
                      cursorColor: Colors.redAccent,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, ingrese su fecha de nacimiento';
                        }
                        return null;
                      },
                      controller: fechaNacimientoController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.date_range),
                        iconColor: Colors.black87,
                        border: InputBorder.none,
                        labelText: 'Fecha de Nacimiento',
                        labelStyle: TextStyle(color: Colors.black45),
                        hintText: 'Ingrese su fecha de nacimiento',
                        hintStyle: TextStyle(color: Colors.black38),
                      ),
                      style: const TextStyle(color: Colors.black87),
                      cursorColor: Colors.redAccent,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, ingrese su contraseña';
                        }
                        return null;
                      },
                      controller: contrasenaController,
                      decoration: InputDecoration(
                        icon: const Icon(Icons.lock),
                        iconColor: Colors.black87,
                        border: InputBorder.none,
                        labelText: 'Contraseña',
                        labelStyle: const TextStyle(color: Colors.black45),
                        hintText: 'Ingrese su contraseña',
                        hintStyle: const TextStyle(color: Colors.black38),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          icon: Icon(isVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        suffixIconColor: Colors.black87,
                      ),
                      style: const TextStyle(color: Colors.black87),
                      obscureText: !isVisible,
                      obscuringCharacter: '*',
                      cursorColor: Colors.redAccent,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, ingrese su contraseña';
                        }
                        return null;
                      },
                      controller: confirmarContrasenaController,
                      decoration: InputDecoration(
                        icon: const Icon(Icons.lock),
                        iconColor: Colors.black87,
                        border: InputBorder.none,
                        labelText: 'Confirmar Contraseña',
                        labelStyle: const TextStyle(color: Colors.black45),
                        hintText: 'Ingrese de nuevo su contraseña',
                        hintStyle: const TextStyle(color: Colors.black38),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisible2 = !isVisible2;
                            });
                          },
                          icon: Icon(isVisible2
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        suffixIconColor: Colors.black87,
                      ),
                      style: const TextStyle(color: Colors.black87),
                      obscureText: !isVisible2,
                      obscuringCharacter: '*',
                      cursorColor: Colors.redAccent,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                        color: Colors.grey[600],
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          if ((contrasenaController.text ==
                              confirmarContrasenaController.text) && usuarioController.text.isNotEmpty && cedulaController.text.isNotEmpty && contactoController.text.isNotEmpty && correoController.text.isNotEmpty && fechaNacimientoController.text.isNotEmpty && contrasenaController.text.isNotEmpty && confirmarContrasenaController.text.isNotEmpty) {
                            globals.usuarios.add(usuarioController.text);
                            // globals.cedula = cedulaController.text;
                            // globals.contacto = contactoController.text;
                            // globals.correo = correoController.text;
                            // globals.fechaNacimiento = fechaNacimientoController.text;
                            globals.passwords.add(contrasenaController.text);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          } else if (contrasenaController.text !=
                              confirmarContrasenaController.text) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Las contraseñas no coinciden')));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Por favor, complete todos los campos')));
                          }
                        }
                      },
                      child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Registrar',
                                style: TextStyle(color: Colors.white)),
                            SizedBox(width: 5.0),
                            Icon(Icons.login, color: Colors.white)
                          ]),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Cancelar',
                                style: TextStyle(color: Colors.white)),
                            SizedBox(width: 5.0),
                            Icon(Icons.cancel, color: Colors.white)
                          ]),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text('¿Tienes cuenta?'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        child: const Text('Logeate',
                            style: TextStyle(color: Colors.red)),
                      ),
                    ],
                  ),
                  const Text('O Continuar con:',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            // ignore: avoid_print
                            print('Facebook');
                          },
                          icon: const Icon(Icons.facebook,
                              color: Colors.blue, size: 30.0),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                          )),
                      const SizedBox(width: 15.0),
                      IconButton(
                          onPressed: () {
                            // ignore: avoid_print
                            print('Google');
                          },
                          icon: const Icon(Icons.email,
                              color: Colors.white, size: 30.0),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red),
                          )),
                    ],
                  ),
                  const SizedBox(height: 40.0),
                  const Text('Recuerda que al continuar, tú estás de acuerdo con nuestras',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold)),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const TerminosCondiciones()));
                      },
                      child: const Text(
                          'Políticas de Privacidad, Terminos y Condiciones',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 10.0,
                              fontWeight: FontWeight.bold))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
