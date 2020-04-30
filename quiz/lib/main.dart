import 'package:flutter/material.dart';
import 'quizbrain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quiz());

class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.cyan[100],
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[900],
          title: Center(
            child: Text(
              'Quiz App',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: Quizzler(),
      ),
    );
  }
}

class Quizzler extends StatefulWidget {
  @override
  _QuizzlerState createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  List<Widget> score = [];
  int questionno = 0;
  void check(bool actual) {
    bool correct = quizBrain.getans();
    setState(() {
      if (actual == correct) {
        score.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        score.add(
          Icon(Icons.close, color: Colors.red),
        );
      }
      quizBrain.checkitnow(questionno);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 8,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                quizBrain.getques(),
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: FlatButton(
              color: Colors.lightGreenAccent[100],
              onPressed: () {
                setState(() {
                  check(true);
                });
              },
              child: Text('TRUE'),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: FlatButton(
              color: Colors.redAccent[100],
              onPressed: () {
                check(false);
              },
              child: Text('False'),
            ),
          ),
        ),
        Row(
          children:score,
        ),
      ],
    );
  }
}
