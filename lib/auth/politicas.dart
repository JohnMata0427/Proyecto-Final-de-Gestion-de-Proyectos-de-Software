import 'package:flutter/material.dart';

class TerminosCondiciones extends StatelessWidget {
  const TerminosCondiciones({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Términos y Condiciones de Uso'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(30),
          padding: const EdgeInsets.all(20.0),
          color: const Color.fromARGB(255, 93, 93, 93),
          child: const Column(
            children: [
              Text('Politicas de Privacidad, Términos y Condiciones',
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              SizedBox(height: 20.0),
              Text(
                '1. Aceptación de los términos y condiciones\n'
                'Al utilizar la aplicación VehiCheck Express, el usuario acepta los términos y condiciones de uso de la misma. En caso de no estar de acuerdo con los términos y condiciones de uso de la aplicación, el usuario deberá abstenerse de utilizarla. Asimismo, el usuario acepta que la aplicación VehiCheck Express puede recopilar y almacenar información personal del usuario. La aplicación VehiCheck Express se compromete a no compartir la información personal del usuario con terceros. La información personal del usuario será utilizada únicamente para el funcionamiento de la aplicación. La aplicación VehiCheck Express se compromete a proteger la información personal del usuario y a no utilizarla con fines distintos a los establecidos en los términos y condiciones de uso de la aplicación.\n\n'
                '2. Uso de la aplicación\n'
                'El usuario se compromete a utilizar la aplicación VehiCheck Express de forma responsable y a no realizar acciones que puedan dañar la integridad de la aplicación o afectar su funcionamiento. El usuario se compromete a no utilizar la aplicación VehiCheck Express con fines ilegales o fraudulentos. Asimismo, el usuario se compromete a no utilizar la aplicación VehiCheck Express para enviar spam o realizar cualquier otra actividad que pueda afectar la experiencia de otros usuarios.\n\n'
                '3. Modificaciones\n'
                'Los términos y condiciones de uso de la aplicación VehiCheck Express pueden ser modificados en cualquier momento. El usuario será notificado de cualquier cambio en los términos y condiciones de uso de la aplicación. El usuario acepta que es su responsabilidad revisar periódicamente los términos y condiciones de uso de la aplicación para estar al tanto de cualquier modificación. El uso continuado de la aplicación VehiCheck Express después de la notificación de cambios en los términos y condiciones de uso de la aplicación constituirá la aceptación de los mismos.\n\n'
                '4. Contacto\n'
                'Para cualquier duda o aclaración sobre los términos y condiciones de uso de la aplicación VehiCheck Express, el usuario puede ponerse en contacto con el equipo de soporte de la aplicación.\n\n'
                '5. Ley aplicable\n'
                'Los términos y condiciones de uso de la aplicación VehiCheck Express se rigen por la legislación vigente en el país en el que se encuentra el usuario. Cualquier disputa relacionada con los términos y condiciones de uso de la aplicación será resuelta por los tribunales competentes del país en el que se encuentra el usuario.\n\n'
                '6. Propiedad intelectual\n'
                'La aplicación VehiCheck Express es propiedad de su desarrollador y está protegida por las leyes de propiedad intelectual. El usuario se compromete a respetar los derechos de propiedad intelectual del desarrollador de la aplicación y a no realizar ninguna acción que pueda infringir dichos derechos.\n\n'
                '7. Limitación de responsabilidad\n'
                'La aplicación VehiCheck Express se ofrece tal cual, sin garantías de ningún tipo. El usuario utiliza la aplicación bajo su propio riesgo. El desarrollador de la aplicación no será responsable de los daños que puedan surgir del uso de la aplicación, incluyendo, entre otros, daños directos, indirectos, incidentales, especiales, consecuentes o punitivos.\n\n'
                '8. Confidencialidad\n'
                'El usuario se compromete a mantener la confidencialidad de su información de inicio de sesión y a no compartirla con terceros. El usuario será el único responsable de cualquier actividad que se realice con su cuenta de usuario.\n\n'
                '9. Enmiendas\n'
                'El desarrollador de la aplicación VehiCheck Express se reserva el derecho de modificar, suspender o interrumpir la aplicación en cualquier momento, sin previo aviso. El desarrollador de la aplicación no será responsable de los daños que puedan surgir del uso de la aplicación, incluyendo, entre otros, daños directos, indirectos, incidentales, especiales, consecuentes o punitivos.\n\n'
                '10. Aceptación de los términos y condiciones de uso de la aplicación\n'
                'Al utilizar la aplicación VehiCheck Express, el usuario acepta los términos y condiciones de uso de la misma. En caso de no estar de acuerdo con los términos y condiciones de uso de la aplicación, el usuario deberá abstenerse de utilizarla.\n\n',
                style: TextStyle(fontSize: 12.0),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
