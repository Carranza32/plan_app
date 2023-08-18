import 'package:plan_app/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class RecuperateScreen extends StatelessWidget {
	const RecuperateScreen({super.key});

	@override
	Widget build(BuildContext context) {
		final size = MediaQuery.of(context).size;

		return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            _buildBackground(),
            SingleChildScrollView(
              child: Positioned.fill(
                left: size.width * 0.5,
                right: size.width * 0.5,
                child: Align(
                  alignment: Alignment.center,
                  child: _buildLoginForm(context),
                ),
              ),
            )
          ],
        ),
      ),
		);
	}

  Widget _buildBackground() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Fondo login.webp'), // Reemplaza con la ruta de tu imagen
          fit: BoxFit.cover,
          opacity: 0.5,
        ),
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Image.asset('assets/logo.png', width: 150),
            const SizedBox(height: 30),
            Text("Recuperar contraseña", style: titleStyle()),
            const SizedBox(height: 30),
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Email
                  const Text("Correo de recuperación"),
                  const SizedBox(height: 10),
                  Material(
                    borderRadius: BorderRadius.circular(6),
                    elevation: 2,
                    child: TextFormField(
                      decoration: formFieldStyle().copyWith(
                        hintText: ""
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  Row(
                    children: [
                      // Forgot password
                      TextButton(
                        child: const Text("¿Ya tienes una cuenta? Inicia sesión", style: TextStyle(decoration: TextDecoration.underline)),
                        onPressed: () {
                          Get.offAllNamed('/login');
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  // Submit
                  ElevatedButton(
                    style: primaryButtonStyle().copyWith(
                      minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 0)),
                      elevation: MaterialStateProperty.all<double>(0),
                    ),
                    child: const Text("Enviar correo de recuperación"),
                    onPressed: () {
                      Get.showSnackbar(
                        const GetSnackBar(
                          message: 'Correo enviado',
                          duration: Duration(seconds: 3),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}