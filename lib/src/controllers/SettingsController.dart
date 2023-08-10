import 'package:get/get.dart';

class SettingsController extends GetxController {
  RxString selectedRole = 'Gerente'.obs; // Variable observables para el rol seleccionado
  List<String> roles = ['Gerente', 'Supervisor', 'PJTE']; // Lista de roles
  
  String gerente = 'Gerente';
  String supervisor= 'Supervisor';
  String pjte = 'PJTE';

  void updateSelectedRole(String newRole) {
    selectedRole.value = newRole;

    print(selectedRole.value);
  }
}
