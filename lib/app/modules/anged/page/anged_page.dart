// ignore_for_file: lines_longer_than_80_chars

import 'package:emerson/app/modules/anged/model/anged_model.dart';
import 'package:emerson/utils/constans.dart';
import 'package:emerson/utils/methods.dart';
import 'package:flutter/material.dart';

class AngedPage extends StatefulWidget {
  const AngedPage({super.key});

  @override
  State<AngedPage> createState() => _AngedPageState();
}

class _AngedPageState extends State<AngedPage> {
  TextEditingController controller = TextEditingController();
  List<String> words = ['Angular', 'React', 'Vuejs'];
  int indexWords = 0;
  String word = '';
  String selectedLetter = '';
  int maxNumErros = 4;
  int numAttempts = 0;
  int numErrors = 0;
  List<AngedModel> wordSearch = [];
  List<bool> wordSearchBool = [];
  String messageError = 'Perdiste, ya no tienes mas vidas, suerte a la proxima';
  String imageAnged = '';

  @override
  void initState() {
    numAttempts = maxNumErros;
    imageAnged = 'assets/anged/$numErrors.png';
    initWord();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void initWord() {
    if (indexWords == words.length) indexWords = 0;

    word = words[indexWords];
    for (var i = 0; i < word.length; i++) {
      wordSearch.add(AngedModel(letter: word[i].toUpperCase(), view: false));
      wordSearchBool.add(false);
    }
  }

  void searchLetter(String letter) {
    var isTotalLetters = true;
    var isFound = false;
    //buscando si la letra esta en la palabra
    for (var i = 0; i < wordSearch.length; i++) {
      if (wordSearch[i].letter.toUpperCase() == letter.toUpperCase()) {
        wordSearch[i].view = true;
        isFound = true;
        wordSearchBool[i] = true;
      }
    }

    //si todas las letras fueron encontradas
    for (final e in wordSearchBool) {
      if (!e) isTotalLetters = false;
    }

    //si no se encuentra la palabra sumar y restar las vidas y los errores
    if (!isFound) {
      numAttempts--;
      numErrors++;
      imageAnged = 'assets/anged/$numErrors.png';
    }

    //si ya se encontraron todas las letras, entonces palabra encontrada
    if (isTotalLetters && (numErrors != maxNumErros)) {
      indexWords++;
      resetValues();
      initWord();
      openConfirmDialog(context, 'Palabra Encontrada', () {}, () {});
    }

    // si ya se terminaron los numero de intentos
    if (numErrors == maxNumErros) {
      indexWords++;
      resetValues();
      initWord();
      openConfirmDialog(
        context,
        messageError,
        () {},
        () {},
      );
    }
  }

  void resetValues() {
    numAttempts = maxNumErros;
    numErrors = 0;
    imageAnged = 'assets/anged/$numErrors.png';
    controller.clear();
    wordSearch.clear();
    wordSearchBool.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    numErrors.toString(),
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Image.asset(
                    imageAnged,
                    scale: 2.5,
                  ),
                  Text(
                    numAttempts.toString(),
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        'Informacion',
                        style: TextStyle(
                          color: Colors.black26,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Text(
                      'Framework front end',
                      style: TextStyle(
                        color: ConstantsApp.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),

              //view letters
              wordSpace(),
              //input and button

              Container(
                margin: const EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.83,
                      height: 40,
                      child: TextFormField(
                        controller: controller,
                        decoration: const InputDecoration(
                          labelText: 'Ingrese la letra o palabra completa',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ConstantsApp.primaryColor,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      child: IconButton(
                        onPressed: () {
                          if (controller.text.isEmpty) {
                            openConfirmDialog(
                              context,
                              'Ingrese una letra o una palabra',
                              () {},
                              () {},
                            );
                          }
                          if (controller.text.length == 1) {
                            // FocusScope.of(context).unfocus();
                            selectedLetter = controller.text;
                            controller.clear();
                            searchLetter(selectedLetter);
                            setState(() {});
                          }

                          if (controller.text.length > 1) {
                            FocusScope.of(context).unfocus();
                            if (controller.text.toUpperCase() == word.toUpperCase()) {
                              indexWords++;
                              resetValues();
                              initWord();
                              openConfirmDialog(
                                context,
                                'Palabra Encontrada',
                                () {},
                                () {},
                              );
                              setState(() {});
                            } else {
                              controller.clear();
                              numAttempts--;
                              numErrors++;
                              imageAnged = 'assets/anged/$numErrors.png';
                              setState(() {});
                            }

                            if (numErrors == maxNumErros) {
                              indexWords++;
                              resetValues();
                              initWord();
                              openConfirmDialog(
                                context,
                                messageError,
                                () {},
                                () {},
                              );
                              setState(() {});
                            }
                          }
                        },
                        icon: const Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),

              const Spacer()
            ],
          ),
        ),
      ),
    );
  }

  Widget wordSpace() {
    final list = <Widget>[];

    for (var i = 0; i < wordSearch.length; i++) {
      list.add(letter(wordSearch[i]));
    }
    return Flexible(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: list,
      ),
    );
  }

  Widget letter(AngedModel model) {
    return FittedBox(
      child: Text(
        model.view ? model.letter : '__',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 30,
        ),
      ),
    );
  }
}
