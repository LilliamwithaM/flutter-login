import 'package:flutter/material.dart';
import 'package:ui_one/features/auth/presentation/components/buttons.dart';
import 'package:ui_one/features/auth/presentation/validator/auth_validator.dart';
import 'package:ui_one/service._locator.dart';
import '../../../../service/auth_service.dart';
import 'package:ui_one/features/auth/presentation/pages/admin_page.dart';

class SignUpPage extends StatefulWidget {
  static const String id = "sign_up_page";

  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _signUpGlobalKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordRetryController = TextEditingController();
  bool passwordSee = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(
          255, 243, 33, 156), // Cambiar el color de fondo a azul
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _signUpGlobalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),

                // Botón de retroceso
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.chevron_left,
                    size: 40,
                    color: Colors.black, // Icono de flecha en negro
                  ),
                ),
                const SizedBox(height: 30),

                // Título
                Row(
                  children: const [
                    SizedBox(width: 10),
                    Text(
                      "Ingresa tus datos para hacer nuevo miembro de bichopolis",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 55),

                Column(
                  children: [
                    // Campo de Nombre
                    TextFormField(
                      controller: nameController,
                      validator: AuthValidator.isNameValid,
                      decoration: const InputDecoration(
                        labelText: "Nombre de usuario",
                        labelStyle:
                            TextStyle(color: Colors.black), // Etiqueta en negro
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Campo de Correo Electrónico
                    TextFormField(
                      controller: emailController,
                      validator: AuthValidator.isEmailValid,
                      decoration: const InputDecoration(
                        labelText: "Dirección de correo electrónico",
                        labelStyle:
                            TextStyle(color: Colors.black), // Etiqueta en negro
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Campo de Contraseña
                    TextFormField(
                      controller: passwordController,
                      obscureText: passwordSee,
                      validator: AuthValidator.isPasswordValid,
                      decoration: InputDecoration(
                        labelText: "Contraseña",
                        labelStyle:
                            TextStyle(color: Colors.black), // Etiqueta en negro
                        suffixIcon: GestureDetector(
                          onTap: () {
                            passwordSee = !passwordSee;
                            setState(() {});
                          },
                          child: Icon(
                            passwordSee
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color:
                                Colors.black, // Icono de visibilidad en negro
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Campo de Confirmar Contraseña
                    TextFormField(
                      controller: passwordRetryController,
                      obscureText: passwordSee,
                      validator: AuthValidator.isPasswordValid,
                      decoration: const InputDecoration(
                        labelText: "Confirmar contraseña",
                        labelStyle:
                            TextStyle(color: Colors.black), // Etiqueta en negro
                      ),
                    ),

                    const SizedBox(height: 40),

                    // Botón de Registro
                    MyButtonTwo(
                      text: "Continuar",
                      onPressed: signUpButton,
                      color: Colors.yellow, // Color de botón amarillo
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signUpButton() async {
    if (_signUpGlobalKey.currentState!.validate()) {
      try {
        final Map<String, String> message = await authController.registration(
          nameController.text.trim(),
          emailController.text.trim(),
          passwordController.text.trim(),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message["message"]!),
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * .9),
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 5),
            shape: const StadiumBorder(),
            dismissDirection: DismissDirection.horizontal,
            showCloseIcon: true,
          ),
        );
      } catch (e) {
        print("Error: ${e.toString()}");
      }
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordRetryController.dispose();
    super.dispose();
  }
}
