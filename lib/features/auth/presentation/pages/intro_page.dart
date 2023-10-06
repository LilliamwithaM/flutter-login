import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ui_one/features/auth/presentation/pages/sign_in_page.dart';
import 'package:ui_one/features/auth/presentation/pages/sign_up_page.dart';

import '../components/buttons.dart';

class IntroPage extends StatefulWidget {
  static const String id = "intro_page";
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue, // Cambia el color de fondo aquí
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "¡Bienvenido Usuario Nuevo!",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Color(0xFF265AE8),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "¿Ya tienes una cuenta? ¡Deseas continuar!",
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF383838),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            Center( // Centra el botón
              child: MyButton(
                onPressed: () {
                  Navigator.pushNamed(context, SignUpPage.id);
                },
                text: "¡Deseas registrarte en la página!",
                color: Color(0xFF265AE8),
                textColor: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Esperamos que disfrutes de nuestra página y aceptes las condiciones. ¡Saludos crack!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF404653),
                letterSpacing: 0.5,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 30),
            Text(
              "¿Ya tienes alguna cuenta? ¿Eres como el bicho siuu?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF383838),
                letterSpacing: 0.5,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 15),
            RichText(
              text: TextSpan(
                text: "Inicia sesión siuuu",
                style: TextStyle(
                  color: Color(0xFF265AE8),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, SignInPage.id);
                  },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
