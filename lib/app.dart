import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _AppState();
}

class _AppState extends State<Calculator> {
  var result = "";

  Widget btn(var textt) {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            result = result + textt;
          });
        },
        child: Text(textt));
  }

  clearrr() {
    setState(() {
      result = "";
    });
  }

  output() {
    Parser p = Parser();
    // Parse is defined as to break something down into its parts, particularly for study of the individual parts. An example of to parse is to break down a sentence to explain each element to someone.
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      result = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              result,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                btn("1"),
                btn("2"),
                btn("3"),
                btn("4"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                btn("5"),
                btn("6"),
                btn("7"),
                btn("8"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                btn("9"),
                btn("0"),
                btn("+"),
                btn("-"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                btn("*"),
                btn("/"),
                ElevatedButton(onPressed: clearrr, child: const Text("AC")),
                ElevatedButton(onPressed: output, child: const Text("=")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
