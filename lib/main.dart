import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int firstNum;
   int secondNum;

   String textToDisplay = "";
   String res;
   String operatorToPerform;

  void btnClicked( String btnValue) {
   if(btnValue == "C"){
    firstNum = 0;
    secondNum = 0;

   textToDisplay = "";
   res = "";
   operatorToPerform = "";

   } else if(btnValue == "+" || btnValue == "-"|| btnValue == "x" || btnValue == "/") {

     firstNum = int.parse(textToDisplay);
     res = "";
     operatorToPerform = btnValue;

  } else if(btnValue == "="){
       secondNum = int.parse(textToDisplay);

       if(operatorToPerform == "+"){
         res = (firstNum + secondNum).toString();
       }

       if(operatorToPerform == "-"){
         res = (firstNum - secondNum).toString();
       }

       if(operatorToPerform == "x"){
         res = (firstNum * secondNum).toString();
       }

       if(operatorToPerform == "/"){
         res = (firstNum ~/ secondNum).toString();
       }

     } else {
         res = int.parse(textToDisplay + btnValue).toString();
       }

      setState(() {
        textToDisplay = res;
      });

  }

   Widget customButton(String btnValue){
     return Expanded(
       child: OutlineButton(
         padding: EdgeInsets.all(25.0),
         onPressed: () => btnClicked(btnValue),
         child: Text(
           "$btnValue",
           style: TextStyle(
             fontSize: 25
           ),
         ),
         ),
     );
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
              child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  alignment: Alignment.bottomRight,
                child:Text(
                  "$textToDisplay",
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.w600
                  ),
                )
                )
                ),
              Row(children: <Widget>[
             customButton("9"),
             customButton("8"),
             customButton("7"),
             customButton("+"),
              ],
              ),
              Row(children: <Widget>[
             customButton("6"),
             customButton("5"),
             customButton("4"),
             customButton("-"),
              ],
              ),
              Row(children: <Widget>[
             customButton("3"),
             customButton("2"),
             customButton("1"),
             customButton("x"),
              ],
              ),
              Row(children: <Widget>[
             customButton("C"),
             customButton("0"),
             customButton("="),
             customButton("/"),
              ],
              ),
            ],
          )
        ),
      )
    );
  }
}
