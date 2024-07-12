// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sort_child_properties_last
import 'package:calculator/ui_helper/colors.dart';
import 'package:calculator/ui_helper/roundedButtons.dart';
import 'package:calculator/ui_helper/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var userInput = "";
  var result = "";

  final List buttons = [
    "C",
    "( )",
    "%",
    "/",
    "7",
    "8",
    "9",
    "x",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "+",
    "+/-",
    "0",
    ".",
    "="
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: ColorPallete.bgColorLight,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 35, left: 15, right: 15),
              child: Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 45, right: 35),
                        child: Text(
                          userInput,
                          style: TextStyle(
                              fontSize: 39,
                              color: ColorPallete.inputColorLight,
                              fontWeight: FontWeight.w600),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, right: 35),
                      child: Text(
                        result,
                        style: resultTextStyle(),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 35),
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  userInput = userInput.substring(
                                      0, userInput.length - 1);
                                });
                              },
                              child: FaIcon(
                                FontAwesomeIcons.deleteLeft,
                                color: ColorPallete.operationColorLight,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 5),
                            child: Container(
                              height: 1,
                              color: Color.fromARGB(171, 88, 74, 74),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                width: double.infinity,
                height: 555,
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15),
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return Container(
                        height: 30,
                        width: 30,
                        child: RoundedButton(
                          btnText: buttons[index],
                          btnTextColor: ColorPallete.clearColorLight,
                          btnBgColor: ColorPallete.buttonColorLight,
                          btnTask: () {
                            setState(() {
                              userInput = "";
                              result = "0";
                            });
                          },
                        ),
                      );
                    } else if (index == 1) {
                      return Container(
                        height: 30,
                        width: 30,
                        child: RoundedButton(
                          btnText: buttons[index],
                          btnTextColor: ColorPallete.operationColorLight,
                          btnBgColor: ColorPallete.buttonColorLight,
                          btnTask: () {
                            print("${buttons[index]} clicked");
                          },
                        ),
                      );
                    } else if (index == 2 ||
                        index == 3 ||
                        index == 7 ||
                        index == 11 ||
                        index == 15) {
                      return Container(
                        height: 30,
                        width: 30,
                        child: RoundedButton(
                          btnText: buttons[index],
                          btnTextColor: ColorPallete.operationColorLight,
                          btnBgColor: ColorPallete.buttonColorLight,
                          btnTask: () {
                            setState(() {
                              userInput += buttons[index];
                            });
                          },
                        ),
                      );
                    } else if (index == 19) {
                      return Container(
                        height: 30,
                        width: 30,
                        child: RoundedButton(
                          btnText: buttons[index],
                          btnTextColor: ColorPallete.buttonColorLight,
                          btnBgColor: ColorPallete.operationColorLight,
                          btnTask: () {
                            setState(() {
                              equalPressed();
                            });
                          },
                        ),
                      );
                    } else {
                      return Container(
                        height: 30,
                        width: 30,
                        child: RoundedButton(
                          btnText: buttons[index],
                          btnTextColor: ColorPallete.inputColorLight,
                          btnBgColor: ColorPallete.buttonColorLight,
                          btnTask: () {
                            setState(() {
                              userInput += buttons[index];
                            });
                          },
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void equalPressed() {
    String finalUserInput = userInput;
    finalUserInput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finalUserInput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    result = eval.toString();
  }

  bool isOperator(String x) {
    if(x == "+" || x == "-" || x =="/" || x == "x") {
      return true;
    }
    return false;
  }
}