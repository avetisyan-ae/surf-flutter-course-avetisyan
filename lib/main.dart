import 'dart:io';

/// К предыдущему заданию
/// const - значение должно быть доступно в момент компиляции
/// final - тоже const, но значение может быть присвоено позже


/// 1 Используя switch, напишите программу в методе main(), которая выводит название месяца по номеру от 1 до 12.
void main() {
  int month = 4;
  switch (month) {
    case 1: print("Январь");
      break;
    case 2:  print( "Февраль");
      break;
    case 3: print( "Март");
      break;
    case 4: print( "Апрель");
      break;
    case 5: print( "Май");
      break;
    case 6: print( "Июнь");
      break;
    case 7:print( "Июль");
      break;
    case 8: print( "Август");
      break;
    case 9: print( "Сентябрь");
      break;
    case 10: print( "Октябрь");
      break;
    case 11: print( "Ноябрь");
      break;
    case 12: print( "Декабрь");
      break;
  }
 

 /// 2 Используя циклы, напишите программу, которая выводит на консоль все четные числа от 0 до 100.
  for(int i = 0; i <= 100; i+=2){
    print(i);
  }
  

  /// Написать программу, которая слушает ввод в консоли, складывает вводимые пользователем числа. 
  /// Если пользователь ввел stop, завершить приложение. Если пользователь вводит 
  /// некорректные данные - прервать текущую итерацию, начать заново.

  var input;
  int result = 0;
  String out = "exit";
  do {
    print("Введите число");
     input = stdin.readLineSync();
     try{
      result+= int.parse(input);
      print("Текущая сумма $result");
      }catch(e){
        if(input != out){
        print("Неверное значение");
        continue;
        }
      }
   
  } while (input != out);
  
  
}
