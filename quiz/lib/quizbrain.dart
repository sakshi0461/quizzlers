import 'question.dart';

class QuizBrain{
  int questionNo=0;
  List<Question> _questionBank=[
    Question('Question 1',true),
    Question('Question 2',true),
    Question('Question 3',true),
    Question('Question 4',false),
    Question('Question 5',true),
    Question('Question 6',false),
    Question('Question 7',false),
    Question('Question 8',true),
    Question('Question 9',true),
    Question('Question 10',false),
  ];

  String getques(){
    return _questionBank[questionNo].questext;
  }

  bool getans(){
    return _questionBank[questionNo].quesans;
  }

  void checkitnow(int questionno){
    if(questionNo>_questionBank.length-1){
     questionNo=0;
    }
    else
    questionNo++;
  }
}