import 'dart:convert';

import 'package:acnh_explorer/models/animal.dart';
import 'package:http/http.dart' as http;

class AnimalService {
  final String _url = 'https://acnhapi.com/v1';

  Future<Animal> fetchAnimal(String type, int id) async {
    final response = await http.get('$_url/$type/$id');

    if (response.statusCode == 200) {
      return Animal.fromJson(json.decode(response.body));
    } else {
      throw Exception(
          'Failed to load animal:' + response.statusCode.toString());
    }
  }

  Future<List<Animal>> fetchAnimals(String type) async {
    final response = await http.get('$_url/$type');

    if (response.statusCode == 200) {
      List<Animal> result = new List();
      Map decodedResponse = jsonDecode(response.body) as Map;
      for (final name in decodedResponse.keys) {
        final value = Animal.fromJson(decodedResponse[name]);
        result.add(value);
      }
      return result;
    } else {
      throw Exception(
          'Failed to load animals:' + response.statusCode.toString());
    }
  }
}
