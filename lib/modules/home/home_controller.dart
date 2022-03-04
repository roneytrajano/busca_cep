import 'package:busca_cep/models/cep.dart';
import 'package:busca_cep/modules/home/repository/home_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class HomeController{
  var isLoading = false.obs;
  var cep = Cep().obs;
  TextEditingController cepController = TextEditingController();

  void getCep() async {
    isLoading.value = true;

    HomeRepository repository = HomeRepository();
    cep.value = await repository.getCep(cep: cepController.text);

    isLoading.value = false;
  }
}