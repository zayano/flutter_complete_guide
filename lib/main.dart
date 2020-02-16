import 'package:flutter/material.dart';

import 'quiz.dart';
import 'result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  
  final _questions = const [
      {
        'questionText': 'What\'s your favorite color?',
        'answers' : [
          {'text':'Red', 'score':10},
          {'text':'Black', 'score':8}, 
          {'text':'Yellow', 'score':4}, 
          {'text':'Blue', 'score':1}],
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers' : [
          {'text':'Cat', 'score':10},
          {'text':'Fish', 'score':8}, 
          {'text':'Bird', 'score':4}, 
          {'text':'Snake', 'score':1}],
      },
      {
        'questionText': 'What\'s your favorite Anime?',
        'answers' : [
          {'text':'Onepiece', 'score':10},
          {'text':'Naruto', 'score':8},
          {'text':'SAO', 'score':4},
          {'text':'Bleach', 'score':1}],
      },
    ];
  
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;  
    });
  }

  void _answerQuestion(int score){
    // var aBool = true;
    // aBool = false;
    
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;  
    });
    print(_questionIndex);
    if(_questionIndex < _questions.length){
      print('we have more questions!');
    } else {
      print('No more questions!');
    }
  }
  
  @override
  Widget build(BuildContext context) {

    // var dummy = ['Hello'];
    // dummy.add('Reza');
    // print(dummy);
    // dummy = [];
    // questions = [];

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lime,
        appBar: AppBar(
          title: Text('My Learn Flutter'),
      ),
      body: _questionIndex < _questions.length 
      ? Quiz(
        answerQuestion: _answerQuestion,
        questionIndex: _questionIndex,
        questions: _questions,
      )
        :Result(_totalScore, _resetQuiz),
      ),
    );
  }
}