import 'package:flutter/material.dart';
import '../../layouts/inicio.dart';
import '../../globals.dart' as globals;

class HoraCita extends StatefulWidget {
  const HoraCita({super.key});

  @override
  State<HoraCita> createState() => _HoraCitaState();
}

class _HoraCitaState extends State<HoraCita> {
  TimeOfDay selectedTime = const TimeOfDay(hour: 0, minute: 0);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 4, 4, 4),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('images/icon_app.png',
                      width: 100.0, height: 100.0),
                  const Text(
                    'Bienvenido al Modulo de\nAgendamiento de Citas',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Escoja la Hora de la Cita',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Container(
                width: 100,
                margin: const EdgeInsets.symmetric(vertical: 20),
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    DropdownButton<int>(
                      value: globals.selectedHour,
                      icon: Container(),
                      items:
                          List<DropdownMenuItem<int>>.generate(24, (int index) {
                        return DropdownMenuItem<int>(
                          value: index,
                          child: Text(index.toString().padLeft(2, '0')),
                        );
                      }),
                      onChanged: (int? value) {
                        setState(() {
                          globals.selectedHour = value!;
                        });
                      },
                      style: const TextStyle(fontSize: 24, color: Colors.black),
                    ),
                    const Text(':', style: TextStyle(fontSize: 24, color: Colors.black)),
                    DropdownButton<int>(
                      value: globals.selectedMinute,
                      icon: Container(),
                      items:
                          List<DropdownMenuItem<int>>.generate(60, (int index) {
                        return DropdownMenuItem<int>(
                          value: index,
                          child: Text(index.toString().padLeft(2, '0')),
                        );
                      }),
                      onChanged: (int? value) {
                        setState(() {
                          globals.selectedMinute = value!;
                        });
                      },
                      style: const TextStyle(fontSize: 24, color: Colors.black),
                    ),
                  ],
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [const Icon(Icons.alarm), const SizedBox(width: 5), const Text('Estado: '), Text((globals.selectedHour > 5 && globals.selectedHour < 22) ? 'Disponible' : 'No Disponible', style: TextStyle(color: (globals.selectedHour > 5 && globals.selectedHour < 22) ? Colors.green : Colors.red) ,)],
              ),
              const SizedBox(height: 20),
              if (globals.selectedHour > 5 && globals.selectedHour < 22)
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedTime = TimeOfDay(hour: globals.selectedHour, minute: globals.selectedMinute);
                    });
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Confirmar Cita'),
                          content: Text('¿Desea agendar la cita para las ${selectedTime.format(context)}?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancelar'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Cita Agendada'),
                                      content: const Text('Su cita ha sido agendada exitosamente.'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Home())),
                                          child: const Text('Aceptar'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: const Text('Aceptar'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(
                          Color.fromARGB(255, 125, 0, 16)),
                      padding: const MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 30)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                    ),
                  child: const Text('Agendar Cita', style: TextStyle(fontSize: 20.0, color: Colors.white)),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
