
import 'dart:math';

class CalculatorBrain{
CalculatorBrain({required this.weight, required this.height,});
  final int height;
  final int weight;
  double _bmi = 0;

  String calculateBMI(){
    _bmi = weight/ pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi>=25){
      return 'Overweight';
    }else if(_bmi>=18.5){
      return 'Normal weight';
    }else if(_bmi == 0){
      return 'Zero';
    }else{
      return 'Underweight';
    }
  }

String getInterpretation(){
  if(_bmi>=25){
    return 'You are Overweight. Please excercise';
  }else if(_bmi>=18.5){
    return 'Normal weight.You are doing good';
  }else{
    return 'You are underweight. Eat healthy food more often';
  }
}

}