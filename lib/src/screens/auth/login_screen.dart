import 'package:plan_app/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginScreen extends StatelessWidget {
	const LoginScreen({super.key});

	@override
	Widget build(BuildContext context) {
		final size = MediaQuery.of(context).size;

		return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            _buildBackground(),
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: _buildLoginForm(context),
              ),
            ),
          ],
        ),
      ),
		);
	}

  Widget _buildBackground() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background.jpg'), // Reemplaza con la ruta de tu imagen
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
            Text("Iniciar sesión", style: titleStyle()),
            const SizedBox(height: 30),
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Email
                  const Text("Rut"),
                  const SizedBox(height: 10),
                  Material(
                    borderRadius: BorderRadius.circular(6),
                    elevation: 2,
                    child: TextFormField(
                      decoration: formFieldStyle().copyWith(
                        hintText: "xxxxxxx-x"
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Password
                  const Text("Contraseña"),
                  const SizedBox(height: 10),
                  Material(
                    borderRadius: BorderRadius.circular(6),
                    elevation: 2,
                    child: TextFormField(
                      decoration: formFieldStyle(),
                    ),
                  ),
                  const SizedBox(height: 30),

                  Row(
                    children: [
                      // Remember me
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      const Text("Recordarme"),
                      const Spacer(),
                      // Forgot password
                      TextButton(
                        child: const Text("Recuperar contraseña", style: TextStyle(decoration: TextDecoration.underline)),
                        onPressed: () {},
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
                    child: const Text("Iniciar sesión"),
                    onPressed: () {
                      Get.offAllNamed('/home');
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