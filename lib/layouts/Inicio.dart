// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../auth/login.dart';
import 'agendamiento/agentamiento.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 4, 4, 4),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top),
                  child: Image.asset('images/vehicheck_express_logo.png')),
              Image.asset('images/decoration.png'),
              const SizedBox(height: 20.0),
              const Text(
                'Empresa dedicada al mantenimiento, cuidado y reparación de tu vehículo.',
                style: TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Modulo(
                          titulo: 'Trabajos Realizados',
                          imagen: 'images/icons/trabajos.png',
                          child: LoginScreen()),
                      Modulo(
                          titulo: 'Agendamiento de citas',
                          imagen: 'images/icons/agendamiento.png',
                          child: AgendarCita()),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Modulo(
                          titulo: 'Seguimiento en tiempo real',
                          imagen: 'images/icons/seguimiento.png',
                          child: LoginScreen()),
                      Modulo(
                          titulo: 'Pago en línea',
                          imagen: 'images/icons/pago.png',
                          child: LoginScreen()),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Modulo(
                          titulo: 'Proformas y Cotizaciones',
                          imagen: 'images/icons/proformas.png',
                          child: LoginScreen()),
                      Modulo(
                          titulo: 'Contactanos',
                          imagen: 'images/icons/contacto.png',
                          child: LoginScreen()),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(
                          Color.fromARGB(255, 125, 0, 16)),
                      padding: const MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 30)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                    ),
                    child: const Text('Salir',
                        style:
                            TextStyle(fontSize: 20.0, color: Colors.white)),
                  ),
                  const SizedBox(height: 20.0),
                  const Text('© 2024 VehiCheck Express.\nTodos los derechos reservados.',
                      style: TextStyle(
                          fontSize: 12.0,
                          fontStyle: FontStyle.italic,
                          color: Colors.white),
                      textAlign: TextAlign.center,),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}

class Modulo extends StatelessWidget {
  final String titulo;
  final String imagen;
  final Widget child;
  const Modulo({
    super.key,
    required this.child,
    required this.titulo,
    required this.imagen,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => child));
      },
      child: Container(
        width: 155,
        height: 155,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromARGB(255, 244, 244, 244)),
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(titulo,
                style: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                textAlign: TextAlign.center),
            const SizedBox(height: 15.0),
            Image.asset(imagen, width: 90, height: 70)
          ],
        ),
      ),
    );
  }
}
