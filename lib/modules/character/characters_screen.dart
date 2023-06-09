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
                      child: ListView.builder(
                        itemCount:
                            charactersProvider.futuramaCharacters!.length,
                        itemBuilder: (context, index) {
                          final character =
                              charactersProvider.futuramaCharacters![index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 16),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                                color: Theme.of(context).cardColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Theme.of(context).shadowColor,
                                    offset: const Offset(0.0, 0.5), //(x,y)
                                    blurRadius: 0.1,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  leading: Image.network(
                                    character.images.main,
                                    height: 100,
                                    width: 40,
                                    fit: BoxFit.contain,
                                  ),
                                  title: Text(character.name.getFullName()),
                                  subtitle: character.occupation.isNotEmpty
                                      ? Text(character.occupation)
                                      : const Text("No Occupation"),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CharacterDetailsScreen(
                                                character: character),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
    );
  }
}
