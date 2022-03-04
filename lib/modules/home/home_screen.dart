import 'package:busca_cep/modules/home/components/info_cep.dart';
import 'package:busca_cep/modules/home/home_controller.dart';
import 'package:busca_cep/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    var maskFormatter = MaskTextInputFormatter(
        mask: '#####-###',
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Busca Cep",
          style: TextStyle(color: blueColor),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/correios_logo.png',
                width: 60,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    flex: 73,
                    child: SizedBox(
                      height: 50,
                      child: TextField(
                        controller: controller.cepController,
                        decoration: const InputDecoration(
                          labelText: "Cep",
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [maskFormatter],
                      ),
                    )),
                Expanded(flex: 2, child: Container()),
                Expanded(
                  flex: 25,
                  child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: blueColor,
                        ),
                        onPressed: () {
                          controller.getCep();
                        },
                        child: const Text(
                          "Buscar",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              if (controller.cep.value.bairro == null) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.info),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Cep nao encontrado'),
                  ],
                );
              } else {
                return Column(
                  children: [
                    InfoCep(
                        icon: const Icon(Icons.add_road),
                        text: controller.cep.value.logradouro!),
                    InfoCep(
                      icon: const Icon(Icons.maps_home_work_outlined ),
                      text: controller.cep.value.bairro!,
                    ),
                    InfoCep(
                        icon: const Icon(Icons.location_city),
                        text: controller.cep.value.localidade!),
                    InfoCep(
                      icon: const Icon(Icons.location_on_sharp),
                      text: controller.cep.value.uf!,
                    ),
                  ],
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
