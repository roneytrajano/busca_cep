import 'package:busca_cep/models/cep.dart';
import 'package:dio/dio.dart';

class HomeRepository{
  Future<Cep> getCep({required String cep}) async{

    try
    {
      var response = await Dio().get('https://viacep.com.br/ws/$cep/json');
      return Cep.fromJson(response.data);

    }catch(e)
    {
      // ignore: avoid_print
      print(e);
      return Cep();
    }





  }
}