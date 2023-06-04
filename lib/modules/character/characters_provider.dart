import 'dart:convert';
import 'package:futurama/data/futurama_character.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class CharactersProvider with ChangeNotifier {
  List<FuturamaCharacter>? futuramaCharacters;
  bool isLoading = true;
  String? error;

  bool get hasError => error != null && error!.isNotEmpty;
  bool get hasData =>
      futuramaCharacters != null && futuramaCharacters!.isNotEmpty;

  CharactersProvider() {
    fetchCharacters();
  }

  Future<void> fetchCharacters() async {
    final response = await http
        .get(Uri.parse('https://api.sampleapis.com/futurama/characters'));

    if (response.statusCode == 200) {
      futuramaCharacters = (json.decode(response.body) as List<dynamic>)
          .map((data) => FuturamaCharacter.fromJson(data))
          .toList();
      notifyListeners();
    } else {
      error = 'Failed to fetch characters';
    }
    isLoading = false;
  }
}
