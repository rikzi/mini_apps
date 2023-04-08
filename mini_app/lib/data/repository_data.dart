import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mini_app/data/local_storage.dart';
import 'package:mini_app/model/model_pokemon.dart';

class FetchApi {
  Future<Map<String, dynamic>> getJson(String url) async {
    Map<String, dynamic> result = {};
    Uri uri = Uri.parse(url);
    try {
      //if it's connected and server connect fine
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        Map<String, dynamic> data = json as Map<String, dynamic>;
        // saving json String to local storage
        await LocalStorage().savedataJson(response.body);
        result = {'success': true, 'data': data};
      }
      //if it's connected but server not feedback
      if (response.statusCode != 200) {
        result = {'success': false, 'message': 'something wrong with server'};
      }
    } catch (e) {
      //if something unexpected happen
      result = {'success': false, 'message': e};
    }
    return result;
  }

  Future<List<ModelPokemon>> getPokemon() async {
    Map<String, dynamic> feedback =
        await getJson('https://pokeapi.co/api/v2/pokemon?limit=50');
    print(feedback);
    // if the result is success and sucessfully retrive data
    Map<String, dynamic> newJson;
    if (feedback['success']) {
      newJson = feedback['data'];

      // if the result is fail and take data from local storage (HIVE)
    } else {
      // retrive string json from local storage
      String response = await LocalStorage().getDataJson();
      var json = jsonDecode(response);
      newJson = json as Map<String, dynamic>;
    }
    var jsonResult = newJson['results'];
    // parsing json to List
    List<ModelPokemon> result =
        List<ModelPokemon>.from(jsonResult.map((e) => ModelPokemon.parsing(e)));
    return result;
  }
}
