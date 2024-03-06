import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../layouts/agendamiento/recibo.dart';
import '../../globals.dart' as globals;

enum PaymentType { cash, card }

enum CardType { debit, credit }

class PagoOnline extends StatefulWidget {
  const PagoOnline({super.key});

  @override
  State<PagoOnline> createState() => _PagoOnlineState();
}

class _PagoOnlineState extends State<PagoOnline> {
  PaymentType? _paymentType = PaymentType.cash;
  CardType? _cardType = CardType.debit;
  bool _isSelected = false;
  final _formKey = GlobalKey<FormState>();
  final _cardNumberController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cvcController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 4, 4, 4),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('images/icon_app.png',
                      width: 100.0, height: 100.0),
                  const Text(
                    'Bienvenido al Modulo de\nPago en Línea',
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
                'Datos de Facturación',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15.0),
              Row(
                children: [
                  const Icon(Icons.location_on),
                  const SizedBox(width: 10),
                  Text('Retirar Vehiculo en: ${globals.selectedDay?.difference(DateTime.now()).inDays} dias',
                      style: const TextStyle(fontSize: 17.0)),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  const Icon(Icons.access_time),
                  const SizedBox(width: 10),
                  Text('Cuando: ${globals.selectedDay!.toIso8601String().substring(0, 10)} a las ${globals.selectedHour.toString().padLeft(2, '0')}:${globals.selectedMinute.toString().padLeft(2, '0')}' , style: const TextStyle(fontSize: 17)),
                ],
              ),
              const SizedBox(height: 15.0),
              const Text('Metodo de Pago',
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _paymentType = PaymentType.cash;
                      });
                    },
                    child: Row(
                      children: [
                        Radio<PaymentType>(
                          activeColor: Colors.red,
                          value: PaymentType.cash,
                          groupValue: _paymentType,
                          onChanged: (PaymentType? value) {
                            setState(() {
                              _paymentType = value;
                            });
                          },
                        ),
                        const Text('Efectivo', style: TextStyle(fontSize: 17)),
                        const SizedBox(width: 10.0),
                        const Icon(Icons.money)
                      ],
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _paymentType = PaymentType.card;
                      });
                    },
                    child: Row(
                      children: [
                        Radio<PaymentType>(
                          activeColor: Colors.red,
                          value: PaymentType.card,
                          groupValue: _paymentType,
                          onChanged: (PaymentType? value) {
                            setState(() {
                              _paymentType = value;
                            });
                          },
                        ),
                        const Text('Tarjeta', style: TextStyle(fontSize: 17)),
                        const SizedBox(width: 10.0),
                        const Icon(Icons.credit_card)
                      ],
                    ),
                  ),
                ],
              ),
              if (_paymentType == PaymentType.card) ...[
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Datos de la tarjeta',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _cardType = CardType.debit;
                              });
                            },
                            child: Row(
                              children: [
                                Radio<CardType>(
                                  activeColor: Colors.red,
                                  value: CardType.debit,
                                  groupValue: _cardType,
                                  onChanged: (CardType? value) {
                                    setState(() {
                                      _cardType = value;
                                    });
                                  },
                                ),
                                const Text('Debito',
                                    style: TextStyle(fontSize: 17)),
                              ],
                            ),
                          ),
                          const SizedBox(width: 63.0),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _cardType = CardType.credit;
                              });
                            },
                            child: Row(
                              children: [
                                Radio<CardType>(
                                  activeColor: Colors.red,
                                  value: CardType.credit,
                                  groupValue: _cardType,
                                  onChanged: (CardType? value) {
                                    setState(() {
                                      _cardType = value;
                                    });
                                  },
                                ),
                                const Text('Credito',
                                    style: TextStyle(fontSize: 17)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Número de tarjeta requerido';
                            }
                            return null;
                          },
                          controller: _cardNumberController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            CardNumberInputFormatter()
                          ],
                          decoration: const InputDecoration(
                              icon: Icon(Icons.credit_card),
                              iconColor: Colors.black87,
                              labelText: 'Número de tarjeta',
                              labelStyle: TextStyle(color: Colors.black45),
                              hintText: '0000 0000 0000 0000',
                              hintStyle: TextStyle(color: Colors.black38),
                              border: InputBorder.none,
                              counterText: ""),
                          style: const TextStyle(color: Colors.black87),
                          cursorColor: Colors.redAccent,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Fecha de expiración requerida';
                                  }
                                  return null;
                                },
                                controller: _expiryDateController,
                                keyboardType: TextInputType.datetime,
                                maxLength: 5,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  DateInputFormatter()
                                ],
                                decoration: const InputDecoration(
                                    icon: Icon(Icons.date_range),
                                    iconColor: Colors.black87,
                                    border: InputBorder.none,
                                    labelText: 'Expiración',
                                    labelStyle:
                                        TextStyle(color: Colors.black45),
                                    hintText: 'MM/AA',
                                    hintStyle: TextStyle(color: Colors.black38),
                                    counterText: ""),
                                style: const TextStyle(color: Colors.black87),
                                cursorColor: Colors.redAccent,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Codigo de seguridad requerido';
                                  }
                                  return null;
                                },
                                controller: _cvcController,
                                keyboardType: TextInputType.number,
                                maxLength: 3,
                                decoration: const InputDecoration(
                                    icon: Icon(Icons.lock),
                                    iconColor: Colors.black87,
                                    border: InputBorder.none,
                                    labelText: 'CVC',
                                    labelStyle:
                                        TextStyle(color: Colors.black45),
                                    hintText: '000',
                                    hintStyle: TextStyle(color: Colors.black38),
                                    counterText: ""),
                                style: const TextStyle(color: Colors.black87),
                                cursorColor: Colors.redAccent,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        children: [
                          Checkbox(
                              value: _isSelected,
                              onChanged: (value) {
                                setState(() {
                                  _isSelected = value!;
                                });
                              }),
                          const Text(
                              'Acepto que usen mis datos unicamente para el\nretiro del vehiculo. Terminos y Condiciones,\ny Políticas de privacidad de VehiCheck Express',
                              style: TextStyle(fontSize: 15),
                              textAlign: TextAlign.start),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      const Text('Total a pagar',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10.0),
                      const Text('\$ 15.00',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20.0),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Procesando pago...'),
                                    duration: Duration(seconds: 1)));
                            if (_formKey.currentState!.validate() &&
                                _cardNumberController.text.length == 19 &&
                                int.parse(_expiryDateController.text
                                        .substring(0, 2)) <=
                                    12 &&
                                _isSelected) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Pago exitoso'),
                                      duration: Duration(seconds: 3),
                                      backgroundColor: Colors.green));
                                      
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const Recibo(title: "Tu Pago ha sido\nregistrado con éxito")));
                              
                            } else if (_cardNumberController.text.length !=
                                19) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Número de tarjeta incorrecto'),
                                      duration: Duration(seconds: 3),
                                      backgroundColor: Colors.red));
                            } else if (int.parse(_expiryDateController.text
                                    .substring(0, 2)) >
                                12) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Fecha de expiración incorrecta'),
                                      duration: Duration(seconds: 3),
                                      backgroundColor: Colors.red));
                            } else if (!_isSelected) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Acepte los terminos y condiciones'),
                                      duration: Duration(seconds: 3),
                                      backgroundColor: Colors.red));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Error en el pago'),
                                      duration: Duration(seconds: 3),
                                      backgroundColor: Colors.red));
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(horizontal: 30)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                          ),
                          child: const Text('Pagar ahora',
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                )
              ] else ...[
                const Text('Pago en efectivo',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Recibo(title: "Tu Pago ha sido\nregistrado con éxito")));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(horizontal: 30)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                    ),
                    child: const Text('Imprimir recibo',
                        style: TextStyle(fontSize: 20.0, color: Colors.white)),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove all slashes
    String newText = newValue.text.replaceAll('/', '');

    // Add a slash after 2 digits
    if (newText.length > 2) {
      newText = '${newText.substring(0, 2)}/${newText.substring(2)}';
    }

    // Limit to 5 characters: 4 digits and 1 slash
    if (newText.length > 5) {
      newText = newText.substring(0, 5);
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove all spaces
    String newText = newValue.text.replaceAll(' ', '');

    // Add a space after every 4 digits
    for (int i = 4; i < newText.length; i += 5) {
      newText = '${newText.substring(0, i)} ${newText.substring(i)}';
    }

    // Limit to 19 characters: 16 digits and 3 spaces
    if (newText.length > 19) {
      newText = newText.substring(0, 19);
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
