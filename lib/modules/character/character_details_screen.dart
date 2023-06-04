import 'package:flutter/material.dart';
import 'package:futurama/data/futurama_character.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final FuturamaCharacter character;

  const CharacterDetailsScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name.getFullName()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(character.images.main),
            const SizedBox(height: 16.0),
            getLabelValue("Gender", character.gender),
            const Divider(),
            getLabelValue("Species", character.species),
            const Divider(),
            getLabelValue("Home Planet", character.homePlanet ?? ""),
            const Divider(),
            getLabelValue("Occupation", character.occupation),
            const Divider(),
            const SizedBox(height: 16.0),
            const Text(
              'Sayings:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: character.sayings
                  .sublist(
                      0,
                      character.sayings.length > 3
                          ? 3
                          : character.sayings.length)
                  .map((saying) => Text(
                        '- $saying',
                        style: const TextStyle(height: 1.5),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget getLabelValue(String label, String value) => Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(label),
            ),
            Expanded(
              flex: 2,
              child: Text(value),
            ),
          ],
        ),
      );
}
