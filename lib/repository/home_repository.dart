import 'package:flutter_cubit_video/assets/data.dart';
import 'package:flutter_cubit_video/models/home.dart';

class HomeRepository {

  Future<List<Set<HomeItem>>> getAll() async{
    List list = listHome;

    final result = list.map((e) => {
       HomeItem(
        id: e["id"],
        nome: e["nome"],
        descricao: e["descicao"],
        nomeCoordenador: e["nomeCoordenador"],
        nomeColaborador: e["nomeColaborador"],
        dataInicio: e["dataInicio"]
    )
    }).toList();

    return result;
  }
}