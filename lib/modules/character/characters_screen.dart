import 'package:flutter/material.dart';
import 'package:futurama/modules/character/characters_provider.dart';
import 'package:futurama/modules/common/info_widget.dart';
import 'package:provider/provider.dart';

import 'character_details_screen.dart';

class CharactersScreen extends StatelessWidget {
  static const routeName = '/characters';

  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final charactersProvider = Provider.of<CharactersProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Futurama Characters'),
      ),
      body: charactersProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : charactersProvider.hasError
              ? ErrorWidget(charactersProvider.error!)
              : !charactersProvider.hasData
                  ? const InfoWidget(message: "No characters available")
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: ListView.separated(
                        itemCount:
                            charactersProvider.futuramaCharacters!.length,
                        itemBuilder: (context, index) {
                          final character =
                              charactersProvider.futuramaCharacters![index];
                          return ListTile(
                            leading: Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Image.network(
                                character.images.main,
                                height: 100,
                                width: 40,
                                fit: BoxFit.contain,
                              ),
                            ),
                            title: Text(character.name.getFullName()),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CharacterDetailsScreen(
                                      character: character),
                                ),
                              );
                            },
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(
                          indent: 56,
                        ),
                      ),
                    ),
    );
  }
}
