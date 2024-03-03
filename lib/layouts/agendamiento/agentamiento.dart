import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:vehicheck_express/auth/login.dart';
import 'package:vehicheck_express/layouts/inicio.dart';

class AgendarCita extends StatefulWidget {
  const AgendarCita({super.key});

  @override
  State<AgendarCita> createState() => _AgendarCitaState();
}

class _AgendarCitaState extends State<AgendarCita> {
  bool isSelectDate = false;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  DateTime? getSelectedDay() {
    return _selectedDay;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 4, 4, 4),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
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
                  const SizedBox(height: 20.0),
                  const Text(
                    'Seleccione la Fecha de la Cita',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: TableCalendar(
                      headerStyle: const HeaderStyle(
                        titleCentered: true,
                        formatButtonVisible: false,
                        titleTextStyle: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        leftChevronIcon:
                            Icon(Icons.chevron_left, color: Colors.black),
                        rightChevronIcon:
                            Icon(Icons.chevron_right, color: Colors.black),
                      ),
                      calendarStyle: CalendarStyle(
                        todayDecoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        selectedDecoration: BoxDecoration(
                          color: Colors.red[900],
                          shape: BoxShape.circle,
                        ),
                        todayTextStyle: const TextStyle(
                          color: Colors.white,
                        ),
                        outsideTextStyle:
                            TextStyle(color: Colors.grey.shade400),
                        defaultTextStyle:
                            const TextStyle(color: Colors.black87),
                        weekendTextStyle:
                            TextStyle(color: Colors.red.shade900),
                      ),
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: _focusedDay,
                      calendarFormat: _calendarFormat,
                      availableCalendarFormats: const {
                        CalendarFormat.month: 'Mes',
                      },
                      enabledDayPredicate: (day) {
                        return (day.isAfter(DateTime.now()) ||
                                day.isAtSameMomentAs(DateTime.now())) &&
                            day.isBefore(DateTime.now()
                                .add(const Duration(days: 30)));
                      },
                      selectedDayPredicate: (day) {
                        return isSameDay(_selectedDay, day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                          isSelectDate = true;
                        });
                      },
                      onFormatChanged: (format) {
                        setState(() {
                          _calendarFormat = format;
                        });
                      },
                      onPageChanged: (focusedDay) {
                        _focusedDay = focusedDay;
                      },
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  if (_selectedDay != null) ...[
                    Text(
                        'Día seleccionado: ${_selectedDay!.toIso8601String().substring(0, 10)}',
                        style: const TextStyle(
                            color: Colors.white, fontSize: 17.0))
                  ] else ...[
                    const Text('Seleccione un día para la cita',
                        style:
                            TextStyle(color: Colors.white, fontSize: 17.0))
                  ],
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      if (isSelectDate) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('Seleccione una fecha para la cita')));
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(
                          Color.fromARGB(255, 19, 99, 6)),
                      padding: const MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 40)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                    ),
                    child: const Text('Siguiente',
                        style: TextStyle(fontSize: 20.0, color: Colors.white)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Home()));
                    },
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(
                          Color.fromARGB(255, 125, 0, 16)),
                      padding: const MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 20)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                    ),
                    child: const Text('Volver al Menú',
                        style: TextStyle(fontSize: 20.0, color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}