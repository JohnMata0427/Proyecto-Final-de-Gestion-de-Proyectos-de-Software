import 'package:flutter/material.dart';
import '../../layouts/inicio.dart';

class Recibo extends StatelessWidget {
  final String? title;

  const Recibo({super.key, this.title});

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
                  margin:
                      EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                  child: Image.asset('images/vehicheck_express_logo.png')),
              Image.asset('images/decoration.png'),
              const SizedBox(height: 20.0),
              Text(
                title??'Tu Cita ha sido\nregistrada con éxito',
                style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 100.0,
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Imprime tu recibo\ny presentalo en el taller.',
                style: TextStyle(fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              const Icon(
                Icons.print,
                color: Colors.white,
                size: 100.0,
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Gracias por confiar en VehiCheck Express.',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Home()),
                  );
                },
                style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(horizontal: 30)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                    ),
                    child: const Text('Volver al Menú',
                        style: TextStyle(fontSize: 20.0, color: Colors.white))
              ),
            ],
          ),
        ),
      ),
    );
  }
}
