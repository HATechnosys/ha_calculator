import 'package:flutter/material.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      theme: ThemeData(accentColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
        ),
        body: Calculator(),
      ),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

onMasure(int num) {

}

class _CalculatorState extends State<Calculator> {



  String operator = "";
  String value1 = "";
  String value2 = "";


  var _controllerTextField = TextEditingController(text: "0");


  addValue(String value) {
    setState(() {
      if (value1.isNotEmpty) {
        if (operator.isNotEmpty) {
          _controllerTextField.text = value2 += value;
        } else {
          _controllerTextField.text = value1 += value;
        }
      } else {
        _controllerTextField.text = value1 += value;
      }
    });
  }

  clear() {
    value1 = "";
    value2 = "";
    operator = "";
    setState(() {
      _controllerTextField.text = "";
    });
  }


  double result() {
    double res = 0;
    switch (operator) {
      case "*" :
        {
          res = double.parse(value1) * double.parse(value2);
        }
        break;
      case "/" :
        {
          res = double.parse(value1) / double.parse(value2);
        }
        break;
      case "+" :
        {
          res = double.parse(value1) + double.parse(value2);
        }
        break;
      case "-" :
        {
          res = double.parse(value1) - double.parse(value2);
        }
        break;
    }
    value1 = res.toString();
    value2 ="";
    setState(() {
      _controllerTextField.text = res.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 5, bottom: 20),
      child: Column(
        children: [
          Spacer(),
          TextField(
            decoration: InputDecoration(hintText: "0"),
            style: TextStyle(fontSize: 52),
            textAlign: TextAlign.right,
            controller: _controllerTextField,
          ),
          Row(
            children: [
              NumberView("7", () {
                addValue("7");
              }),
              NumberView("8", () {
                addValue("8");
              }),
              NumberView("9", () {
                addValue("9");
              }),
              NumberView("C", () {
                clear();
              }),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
          ),
          Row(
            children: [
              NumberView("4", () {
                addValue("4");
              }),
              NumberView("5", () {
                addValue("5");
              }),
              NumberView("6", () {
                addValue("6");
              }),
              NumberView("/", () {
                operator = "/";
              }),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
          ),
          Row(
            children: [
              NumberView("1", () {
                addValue("1");
              }),
              NumberView("2", () {
                addValue("2");
              }),
              NumberView("3", () {
                addValue("3");
              }),
              NumberView("*", () {
                operator = "*";
              }),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
          ),
          Row(
            children: [
              NumberView("0", () {
                addValue("0");
              }),
              NumberView(".", () {
                addValue(".");
              }),
              NumberView("=", () {
                result();
              }),
              NumberView("-", () {
                operator = "-";
                result();
              }),
              NumberView("+", () {
                operator = "+";
                result();
              }),
            ],
          )
        ],
      ),
    );
  }
}

class NumberView extends StatefulWidget {
  String name;
  Function function;

  NumberView(this.name,
      this.function);

  @override
  _NumberViewState createState() => _NumberViewState();
}

class _NumberViewState extends State<NumberView> {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: RaisedButton(
          child: Text(
            "${widget.name}",
            style: TextStyle(fontSize: 40),
          ),
          onPressed: widget.function,
          color: Colors.black,
          textColor: Colors.white,
          splashColor: Colors.amber,
        ),
      ),
    );
  }
}
