import 'dart:core';
import 'dart:io';


/*



1. Используя Future 

    1) Напишите функцию, которая считывает данные с клавиатуры. 
        Функция должна возвращать Future.
    2) Напишите код, который дожидается выполнения функции 
        и распечатывает на консоль "Введена строка stroke_name".
    3) Поэкспериментируйте с async/await и then


2. Используя Stream

    1) Напишите функцию, которая считывает данные с клавиатуры до тех пор, 
        пока не будет введен строка "exit". Функция должна возвращать Stream.
    2) Напишите код, который прослушивает поток и распечатывает на 
        консоль "Введена строка stroke_name" каждый раз, когда в потоке 
        появляется новое событие.


*/







void main()async{


    ///Заданае 1.2
    print("Введена строка "+(await readLine()));

    ///Заданае 1.3
    readLine().then((value){
        print("Введена строка 1  $value\n");
    });





    ///Заданае 2.2
    readSync().listen((value){
        print("Введена строка $value\n");
    });
    
}

///Заданае 1.1
Future<String> readLine()async{
    print('Введите что-то:');
    String? result =  await stdin.readLineSync();
    return result??"empty";
}





///Заданае 2.1
Stream<String> readSync()async*{
    String? result = "";
    print("Потоковый ввод\nДля выхода введите \"exit\"");
    do{
        result = await stdin.readLineSync();
        yield(result??"empty");
    }while(result != "exit");
}
