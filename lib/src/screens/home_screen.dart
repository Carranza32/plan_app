import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plan_app/src/constants.dart';
import 'package:plan_app/src/widgets/drawer_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        endDrawer: const DrawerWidget(),
        appBar: AppBar(
          title: const Text('Bienvenido'),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                image: const AssetImage('assets/home2.jpg'),
                height: size.height * 0.3,
              ),

              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Seleccione la obra que desea visualizar",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Material(
                borderRadius: BorderRadius.circular(6),
                elevation: 2,
                child: DropdownButtonFormField(
                  decoration: formFieldStyle(),
                  onChanged: (value) {
                    print(value);
                  },
                  items: const [
                    DropdownMenuItem(
                      value: 1,
                      child: Text("Puente Algarrobo 1"),
                    ),
                    DropdownMenuItem(
                      value: 2,
                      child: Text("Puente Algarrobo 2"),
                    ),
                    DropdownMenuItem(
                      value: 3,
                      child: Text("Puente Algarrobo 3"),
                    ),
                  ],
                )
              ),
            
              Spacer(),

              ElevatedButton(
                style: primaryButtonStyle().copyWith(
                  minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 0)),
                  elevation: MaterialStateProperty.all<double>(0),
                ),
                child: const Text("Continuar"),
                onPressed: () {
                  Get.offAllNamed('/commune/dashboard');
                },
              ),

              Spacer(),
            ],
          ),
        ),
      )
    );
  }
}