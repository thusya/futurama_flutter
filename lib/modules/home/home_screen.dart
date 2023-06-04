import 'package:flutter/material.dart';
import 'package:futurama/modules/character/characters_screen.dart';
import 'package:futurama/modules/common/info_widget.dart';
import 'package:futurama/modules/quiz/quiz_screen.dart';
import 'package:futurama/modules/home/futurama_info_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FuturamaInfoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Futurama'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: provider.isLoading
            ? const Center(child: CircularProgressIndicator())
            : provider.hasError
                ? ErrorWidget(provider.error!)
                : !provider.hasData
                    ? const InfoWidget(message: "No info available")
                    : Column(
                        children: [
                          Expanded(
                            child: ListView(
                              shrinkWrap: true,
                              children: provider.futuramaInfoList!
                                  .map((e) => Column(
                                        children: [
                                          Text(
                                            e.synopsis,
                                            style: const TextStyle(
                                                fontSize: 16, height: 1.3),
                                            textAlign: TextAlign.justify,
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: e.creators
                                                .map(
                                                  (c) => Text(
                                                    c.name,
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                )
                                                .toList(),
                                          )
                                        ],
                                      ))
                                  .toList(),
                            ),
                          ),
                          const SizedBox(height: 32),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, CharactersScreen.routeName);
                                  },
                                  child: const Text('Characters'),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, QuizScreen.routeName);
                                  },
                                  child: const Text('Quiz'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
      ),
    );
  }
}
