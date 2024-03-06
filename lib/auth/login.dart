import 'package:flutter/material.dart';
import '../auth/registro.dart';
import '../layouts/inicio.dart';
import 'politicas.dart';
import '../globals.dart' as globals;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  bool isVisible = false;
  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController contrasenaController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 4, 4, 4),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150.0),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Color.fromARGB(255, 97, 12, 12),
                Color.fromRGBO(4, 4, 4, 1),
              ],
            ),
            border: Border(
              bottom: BorderSide(width: 2.0, color: Colors.red),
            ),
          ),
          child: const Center(
            child: Text('Iniciar sesión',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)),
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: const Text('Ingrese su usuario: ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold)),
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
                          return 'Por favor, ingrese su usuario';
                        }
                        return null;
                      },
                      controller: usuarioController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        iconColor: Colors.black87,
                        border: InputBorder.none,
                        labelText: 'Usuario',
                        labelStyle: TextStyle(color: Colors.black45),
                        hintText: 'Ingrese su usuario',
                        hintStyle: TextStyle(color: Colors.black38),
                      ),
                      style: const TextStyle(color: Colors.black87),
                      cursorColor: Colors.redAccent,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: const Text('Ingrese su contraseña: ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold)),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Olvidé mi contraseña',
                            style: TextStyle(color: Colors.red),
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 14.0),
                        child: Text('Recuerdame'),
                      ),
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          if (globals.usuarios.contains(usuarioController.text) &&
                              globals.passwords[globals.usuarios.indexOf(usuarioController.text)] ==
                                  contrasenaController.text) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Home()),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Usuario o contraseña incorrectos'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        }
                      },
                      child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Iniciar sesión',
                                style: TextStyle(color: Colors.white)),
                            SizedBox(width: 5.0),
                            Icon(Icons.login, color: Colors.white)
                          ]),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text('¿No tienes cuenta?'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistroScreen()));
                        },
                        child: const Text('Registrarse',
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
                        icon: const Icon(Icons.facebook, color: Colors.blue, size: 30.0),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                        )
                      ),
                      const SizedBox(width: 15.0),
                      IconButton(
                        onPressed: () {
                          // ignore: avoid_print
                          print('Google');
                        },
                        icon: const Icon(Icons.email, color: Colors.white, size: 30.0),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.red),
                        )
                      ),
                    ],
                  ),
                  const SizedBox(height: 40.0),
                  const Text('Al continuar, tú estás de acuerdo con nuestras',
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
