import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:math_expressions/math_expressions.dart';
import 'componant.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  var userInput = '';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(userInput.toString(),
                            style: const TextStyle(
                                fontSize: 30, color: Colors.white)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(answer.toString(),
                            style: const TextStyle(
                                fontSize: 30, color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          button_widget(
                            data: 'A/C',
                            onpressed: () {
                              userInput = '';
                              answer = '';
                              setState(() {});
                            },
                          ),
                          button_widget(
                            data: '+/-',
                            onpressed: () {
                              userInput += '+/-';

                              setState(() {});
                            },
                          ),
                          button_widget(
                            data: '%',
                            onpressed: (() {
                              userInput += '%';

                              setState(() {});
                            }),
                          ),
                          button_widget(
                              data: '/',
                              onpressed: () {
                                userInput += '/';

                                setState(() {});
                              }),
                        ],
                      ),
                      Row(
                        children: [
                          button_widget(
                            data: '7',
                            onpressed: () {
                              userInput += '7';

                              setState(() {});
                            },
                          ),
                          button_widget(
                            data: '8',
                            onpressed: () {
                              userInput += '8';

                              setState(() {});
                            },
                          ),
                          button_widget(
                            data: '9',
                            onpressed: (() {
                              userInput += '9';

                              setState(() {});
                            }),
                          ),
                          button_widget(
                              data: '*',
                              onpressed: () {
                                userInput += 'x';

                                setState(() {});
                              }),
                        ],
                      ),
                      Row(
                        children: [
                          button_widget(
                            data: '4',
                            onpressed: () {
                              userInput += '4';

                              setState(() {});
                            },
                          ),
                          button_widget(
                            data: '5',
                            onpressed: () {
                              userInput += '5';

                              setState(() {});
                            },
                          ),
                          button_widget(
                            data: '6',
                            onpressed: (() {
                              userInput += '6';

                              setState(() {});
                            }),
                          ),
                          button_widget(
                            data: '-',
                            onpressed: () {
                              userInput += '6';

                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          button_widget(
                            data: '1',
                            onpressed: () {
                              userInput += '1';

                              setState(() {});
                            },
                          ),
                          button_widget(
                            data: '2',
                            onpressed: () {
                              userInput += '2';

                              setState(() {});
                            },
                          ),
                          button_widget(
                            data: '3',
                            onpressed: () {
                              userInput += '3';

                              setState(() {});
                            },
                          ),
                          button_widget(
                            data: '+',
                            onpressed: (() {
                              userInput += '+';

                              setState(() {});
                            }),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          button_widget(
                            data: '0',
                            onpressed: () {
                              userInput += '0';

                              setState(() {});
                            },
                          ),
                          button_widget(
                            data: '.',
                            onpressed: () {
                              userInput += '.';

                              setState(() {});
                            },
                          ),
                          button_widget(
                            data: 'DEL',
                            onpressed: (() {
                              userInput =
                                  userInput.substring(0, userInput.length - 1);
                              setState(() {});
                            }),
                          ),
                          button_widget(
                            data: ' = ',
                            onpressed: () {
                              equalpres();
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void equalpres() {
    var finalUserInput = userInput;
    finalUserInput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();

    double evel = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = evel.toString();
  }
}
