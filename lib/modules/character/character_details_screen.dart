import 'package:flutter/material.dart';
import 'package:futurama/data/futurama_character.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final FuturamaCharacter character;

  const CharacterDetailsScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    var fullName =
        "${character.name.first} ${character.name.middle} ${character.name.last}";

    return Scaffold(
      extendBodyBehindAppBar: isPortrait,
      appBar: AppBar(
        backgroundColor: const Color(0x00000000),
        elevation: 0,
        title: isPortrait
            ? null
            : Text(
                "${character.name.getFullName()} - ${character.occupation}",
              ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Hero(
                    tag: Image.network(character.images.main),
                    child: SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Container(
                        margin: const EdgeInsets.only(
                          bottom: 6.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                          color: Theme.of(context).cardColor,
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).shadowColor,
                              offset: const Offset(0.0, 1.0), //(x,y)
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: isPortrait
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 60),
                                    child: Image.network(
                                      character.images.main,
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.20,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          fullName,
                                          style: const TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          character.occupation.isNotEmpty
                                              ? character.occupation
                                              : "No Occupation",
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 30, horizontal: 10),
                                child: Image.network(
                                  character.images.main,
                                  fit: BoxFit.contain,
                                  // height: MediaQuery.of(context).size.height * 0.3,
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 16),
                    const Text(
                      'Biography',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 10),
                    getLabelValue("Gender", character.gender),
                    const Divider(),
                    getLabelValue("Species", character.species),
                    const Divider(),
                    getLabelValue("Home Planet", character.homePlanet ?? ""),
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
            ],
          ),
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
