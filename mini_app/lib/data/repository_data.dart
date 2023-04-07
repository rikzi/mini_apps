import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mini_app/data/local_storage.dart';
import 'package:mini_app/model/model_pokemon.dart';

class FetchApi {
  Future<Map<String, dynamic>> getJson(String url) async {
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      Map<String, dynamic> result = json as Map<String, dynamic>;
      LocalStorage().savedata(response.body);
      return {'success': true, 'data': result};
    }
    return {'success': true, 'data': null};
  }

  Future<List<ModelPokemon>> getPokemon() async {
    Map<String, dynamic> feedback =
        await getJson('https://pokeapi.co/api/v2/pokemon?limit=50');
    // print(json['result'])
    Map<String, dynamic> newJson;
    if (feedback['success']) {
      newJson = feedback['data'];
    } else {
      String response = await LocalStorage().getData();
      var json = jsonDecode(response);
      newJson = json as Map<String, dynamic>;
    }
    var jsonResult = newJson['results'];
    List<ModelPokemon> result =
        List<ModelPokemon>.from(jsonResult.map((e) => ModelPokemon.parsing(e)));
    return result;
  }
}
